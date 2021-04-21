using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WiselySplit
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signUpBtn_Click(object sender, EventArgs e)
        {

            if ((unameTxtBox.Text != null && unameTxtBox.Text != "") && (upassTxtBox.Text != null && upassTxtBox.Text != "") &&
                (confirmPassTxtBox.Text != null && confirmPassTxtBox.Text != "") && (emailTxtBox.Text != null && emailTxtBox.Text != "") &&
                (questionTxtBox.Text != null && questionTxtBox.Text != "") && (answerTxtBox.Text != null && answerTxtBox.Text != ""))
            {
                if (upassTxtBox.Text != confirmPassTxtBox.Text)
                {
                    passMatchErrorLbl.Visible = true;
                    return;
                }
                else {
                    passMatchErrorLbl.Visible = false;

                    string[] existingUser = new string[2] { string.Empty, string.Empty };
                    bool userAlreadyExists = false;

                    List<KeyValuePair<string, string>> existingUserDetails = Operations.checkIfExistingUser(unameTxtBox.Text, emailTxtBox.Text);
                    foreach (var kvp in existingUserDetails)
                    {
                        if (kvp.Key == "existingUname")
                        {
                            existingUser[0] = kvp.Value;
                        }
                        else if (kvp.Key == "existingEmail")
                        {
                            existingUser[1] = kvp.Value;
                        }
                    }

                    if ((existingUser[1] != null && existingUser[1] != string.Empty))
                    {
                        userAlreadyExists = true;
                    }
                    if (existingUser[0] == unameTxtBox.Text)
                    {
                        unameTakenLbl.Visible = true;
                        return;
                    }
                    else {
                        unameTakenLbl.Visible = false;
                    }

                    if (userAlreadyExists)
                    {
                        existingUserLbl.Text += emailTxtBox.Text;
                        existingUserLbl.Visible = true;
                        return;
                    }
                    else
                    {
                        List<KeyValuePair<string, string>> userDetails = new List<KeyValuePair<string, string>>();
                        userDetails.Add(new KeyValuePair<string, string>("uname", unameTxtBox.Text));
                        userDetails.Add(new KeyValuePair<string, string>("upass", upassTxtBox.Text));
                        userDetails.Add(new KeyValuePair<string, string>("email", emailTxtBox.Text));
                        userDetails.Add(new KeyValuePair<string, string>("question", questionTxtBox.Text));
                        userDetails.Add(new KeyValuePair<string, string>("answer", answerTxtBox.Text));
                        if (Operations.createUser(userDetails))
                        {
                            errorLbl.Visible = false;
                            Response.Redirect("/Login.aspx");
                        }
                        else
                        {
                            errorLbl.Visible = true;
                        }
                    }
                }                
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Login.aspx");
        }
    }
}