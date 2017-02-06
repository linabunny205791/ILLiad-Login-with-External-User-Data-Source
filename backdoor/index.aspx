<%@ Page language="C#"%>
<%@ Import Namespace="Illiad" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
    if (!IsPostBack)
    {
        /*if ( Request.Cookies["illiadlogin"] == null )
        {
            // user did not hit .dll first, set a cookie to check if they have
            // cookies enabled and send them to cookie redirect page
            
            Response.Cookies["cookiecheck"].Value = "yes";
            Response.Redirect("error_cookie.aspx");
        }*/
    }
}
void LoginCheck(Object sender, EventArgs e)
{

    if (IsPostBack)
    {
    
        // set default values
        Authentication objUser = new Authentication();  
        lblError.Text = "";
        Session["username"] = txtUsername.Text;
        
        try
        {
            // check if user is valid in active directory
            if (true)
            {
                // check if user is in illiad
                if ( objUser.CheckStandingIlliad(txtUsername.Text) )
                {           
                    try
                    {
                        // check if user is in good standing with catalog   
                        if ( objUser.CheckStandingCatalog(txtUsername.Text, true) )
                        {
                            
                            // update illiad if data from catalog is newer
                            //if  ( objUser.CatalogUpdatedDate > objUser.IlliadUpdatedDate )
                            if  ( objUser.CatalogUpdatedDate.Date >= objUser.IlliadUpdatedDate.Date )
                            {
                                objUser.UpdateUserIlliad( txtUsername.Text );
                            }
                            
                        
                            // redirect user to entrance page that simulates logging into illiad
                            Response.Redirect("../welcome.aspx", false);
                        }
                    }
                    catch ( Exception ex )
                    {
                        // the user was rejected by the catalog for something
                        
                        objUser.WriteToLog(ex.ToString(), (string) Session["username"] + ": " + ex.Message, "login");
                        
                        lblError.Text = "<table border='0' cellpadding='5' cellspacing='0'>" +
                          "<tr> " +
                            "<td with='29'><img src='images/warning.gif' width='30' height='28' alt=''></td>" +
                            "<td><span class='error'>We're sorry but: " + ex.Message + "</span> [ <a href='help.aspx'>more help</a> ]</td>" +
                          "</tr>" +
                        "</table>";                     
                    }
                } 
                else
                {
                    // not already an Illiad user, so redirect them to registration
                    Response.Redirect( "../newuser/", false);
                }
            }
        }
        catch( Exception ex )
        {
            // the user was rejected for something
            // most likely bad username / password
            lblError.Text = "<table border='0' cellpadding='5' cellspacing='0'>" +
              "<tr> " +
                "<td with='29'><img src='images/warning.gif' width='30' height='28' alt=''></td>" +
                "<td><span class='error'>We're sorry: " + ex.Message + "</span> [ <a href='help.aspx'>more help</a> ]</td>" +
              "</tr>" +
            "</table>";
            
            objUser.WriteToLog(ex.ToString(), txtUsername.Text + ": " + ex.Message, "login");
    
        }
    }
}
</script>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Login Test | Interlibrary Loan | University Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body id="type-b">
  <!--#include virtual="/illiad/includes/csusm_header.asp"-->
  <div class="row">
    <div class="col-md-8">
    <h2>User Login Test</h2>
      <form id="Login" method="post" class="form-inline" runat="server" onSubmit="return CheckUsername(this)">
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <div class="form-group">
          <label>Enter Username: </label>
          <asp:TextBox ID="txtUsername" name="txtUsername" class="form-control" runat="server" TabIndex="1"></asp:TextBox>
        </div>
        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-sm btn-info" OnClick="LoginCheck"></asp:Button>
      </form>
    </div>
  </div>
  <!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>