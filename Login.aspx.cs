using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WiselySplit
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void loginBtn_Click(object sender, EventArgs e)

        {#add try catch for error handling
        {
        #add try catch block and error handling for input validation
            if ((unameTxtBox.Text == null || unameTxtBox.Text == "") || (upassTxtBox.Text == null || upassTxtBox.Text == ""))
            {
                invalidCredLbl.Visible = false;
                loginErrorLbl.Visible = false;
            }
            else
            {
                string result = Operations.authenticateUser(unameTxtBox.Text, upassTxtBox.Text);
                switch (result)
                {
                    case "success":
                        loginErrorLbl.Visible = false;
                        invalidCredLbl.Visible = false;
                        Response.Redirect("/Home.aspx");
                        break;
                    case "fail":
                        loginErrorLbl.Visible = false;
                        invalidCredLbl.Visible = true;
                        break;
                    case "error":
                        loginErrorLbl.Visible = true;
                        invalidCredLbl.Visible = false;
                        break;
                    default:
                        loginErrorLbl.Visible = false;
                        invalidCredLbl.Visible = false;
                        break;
                }
            }
        }
    }
}
