using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace WiselySplit
{
    public class Operations
    {
        public static SqlConnection dbConnect(String connStr) {
            SqlConnection conn = new SqlConnection(connStr);
            return conn;
        }

        public static bool createUser(List<KeyValuePair<string,string>> userDetails) {
            try
            {
                Variables.User user = new Variables.User();
                var userid = new Object();
                foreach (KeyValuePair<string, string> kvp in userDetails)
                {
                    if (kvp.Key == "uname") user.Name = kvp.Value;
                    if (kvp.Key == "upass") user.Password = kvp.Value;
                    if (kvp.Key == "email") user.Email = kvp.Value;
                    if (kvp.Key == "question") user.Question = kvp.Value;
                    if (kvp.Key == "answer") user.Answer = kvp.Value;
                }

                byte[] passwordHash = getHashedValue(user.Password);
                
                using (SqlConnection conn = dbConnect(Variables.connStr))
                {
                    #add configuration file or check sql statement for sql injection and unauthorized updated to db
                    string createUser = "INSERT INTO [dbo].[Login] (uname, upass, Email)  VALUES ('" + user.Name + "',CONVERT(VARBINARY(25),'" + passwordHash + "'),'" + user.Email + "')";
                    string getUserId = "SELECT Id FROM [dbo].[Login] where uname='" + user.Name + "' AND upass=CONVERT(VARBINARY(25),'" + passwordHash + "')";
                    SqlCommand addUser = new SqlCommand(createUser, conn);
                    SqlCommand getId = new SqlCommand(getUserId, conn);
                    conn.Open();
                    int createdUserResult = addUser.ExecuteNonQuery();
                    using (SqlDataReader reader = getId.ExecuteReader()) {
                        if (reader.Read()) {
                            userid = reader["id"];
                        }
                    }
                    conn.Close();

                    if (createdUserResult > 0)
                    {
                        if (addSecurityQuestion(conn,userid,user.Name, user.Question, user.Answer)) return true;
                        else return false;
                    }
                    else return false;
                }
            }
            catch (Exception ex) {
                Console.WriteLine("An error occured: " + ex.Message);
                return false;
            }
        }

        public static List<KeyValuePair<string,string>> checkIfExistingUser(string uname, string email) {
            try{
                var existingUser = new List<KeyValuePair<string, string>>();
                using (SqlConnection conn = dbConnect(Variables.connStr))
                {
                    string getUserId = "SELECT uname,Email FROM [dbo].[Login] where uname='" + uname + "' OR Email='" + email + "'";
                    SqlCommand checkUser = new SqlCommand(getUserId, conn);
                    conn.Open();
                    using (SqlDataReader reader = checkUser.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            existingUser.Add(new KeyValuePair<string, string>("existingUname", reader["uname"].ToString()));
                            existingUser.Add(new KeyValuePair<string, string>("existingEmail", reader["Email"].ToString()));
                        }
                    }
                    conn.Close();
                }
                return existingUser;
            }
            catch (Exception ex) {
                return new List<KeyValuePair<string, string>>() { new KeyValuePair<string,string>("Exception", ex.Message.ToString())};
            }
            
        }

        public static string authenticateUser(string name, string pass) {
            try
            {
                using (SqlConnection conn = dbConnect(Variables.connStr))
                {
                    byte[] passHash = getHashedValue(pass);
                    string query = "SELECT uname, upass FROM Login Where uname='" + name + "' AND upass=CONVERT(VARBINARY(25),'" + passHash + "')";
                    SqlCommand command = new SqlCommand(query, conn);
                    conn.Open();
                    int result = 0;
                    using (SqlDataReader reader = command.ExecuteReader()) {
                        if (reader.Read()) {
                            if (reader["uname"] != null) {
                                result=1;
                            }
                        }
                    }
                    conn.Close();
                    return result == 1 ? "success" : "fail";
                }
            }
            catch (Exception ex) {
                Console.WriteLine("An error occurred " + ex.Message);
                return "error";
            }            
        }

        public static bool addSecurityQuestion(SqlConnection conn, Object id, string name, string question, string answer) {
            string addSecurity = "INSERT INTO [dbo].[Authenticate] (id, uname, Question, Answer)  VALUES ("+ id +",'" + name + "','" + question + "',CONVERT(VARBINARY(25),'" + answer + "'))";
            SqlCommand addPassRecovery = new SqlCommand(addSecurity, conn);
            conn.Open();
            int rowCount = addPassRecovery.ExecuteNonQuery();
            conn.Close();
            return rowCount > 0 ? true : false;
        }

        public static byte[] getHashedValue(string pass) {
            byte[] passwordHash = new byte[50];
            using (var sha256 = new SHA256Managed())
            {
                passwordHash = sha256.ComputeHash(Encoding.UTF8.GetBytes(pass));
            }
            return passwordHash;
        }
    }
}
