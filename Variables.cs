using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace WiselySplit
{
    public class Variables
    {
        public static string connStr = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;

        public struct User {
            public string uname;
            public string pass;
            public string email;
            public string question;
            public string answer;

            public User(string uname, string pass, string email, string question, string answer)
            {
                this.uname = uname;
                this.pass = pass;
                this.email = email;
                this.question = question;
                this.answer = answer;
            }

            public string Name {
                get { return uname; }
                set { uname = value; }
            }
            public string Password
            {
                get { return pass; }
                set { pass = value; }
            }
            public string Email
            {
                get { return email; }
                set { email = value; }
            }
            public string Question
            {
                get { return question; }
                set { question = value; }
            }
            public string Answer
            {
                get { return answer; }
                set { answer = value; }
            }
        }
    }
}