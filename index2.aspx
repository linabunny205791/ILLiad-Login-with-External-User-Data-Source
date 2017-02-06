<%@ Page language="C#"%>
<%@ Import Namespace="Illiad2" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
	if (!IsPostBack)
	{
		if ( Request.Cookies["illiadlogin"] == null )
		{
			// user did not hit .dll first, set a cookie to check if they have
			// cookies enabled and send them to cookie redirect page
			
			Response.Cookies["cookiecheck"].Value = "yes";
			Response.Redirect("error_cookie.aspx");
		}
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
			if ( objUser.CheckStandingLDAP("csusm.edu", txtUsername.Text, txtPassword.Text) )
			{
				// check if user is in illiad
				if ( objUser.CheckStandingIlliad(txtUsername.Text) )
				{			
					try
					{
						// check if user is in good standing with catalog	
						if ( 1 == 1) //Use when PAC record check unavailable
						if ( objUser.CheckStandingCatalog(txtUsername.Text, true) )
						{
							//objUser.CheckStandingCatalog(txtUsername.Text, true);
							// update illiad if data from catalog is newer
							//if  ( objUser.CatalogUpdatedDate > objUser.IlliadUpdatedDate )
							//{
								objUser.UpdateUserIlliad( txtUsername.Text );
							//}
							
						
							// redirect user to entrance page that simulates logging into illiad
							Response.Redirect("welcome.aspx", false);
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
					Response.Redirect( "newuser/", false);
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
			
			objUser.WriteToLog(ex.ToString() + objUser.PatronRecord, txtUsername.Text + ": " + ex.Message, "login");
	
		}
	}
}
</script>
<html>
<head>
<title>Login | Interlibrary Loan | Library | California State University San Marcos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="http://library.csusm.edu/css/lion.css" rel="stylesheet" type="text/css">
<link href="../css/illiad.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript" src="http://library.csusm.edu/scripts/image_functions.js"></script>
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
<style type="text/css">
<!--
.style1 {color: #006633}
.error {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<body onLoad="document.forms.Login.txtUsername.focus();">
<form id="Login" method="post" runat="server" onSubmit="return CheckUsername(this)">
<div align="center"> 
	<!--#include virtual="/login/includes/sub_header.asp"-->
    <table width="675" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td align="center">
			  <p>
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <br>
                <br>
              </p>
              <table border="0" cellpadding="10" bgcolor="#EFEFEF">
                <tr>
                  <td colspan="2" valign="top"><table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                      <td width="29"><img src="images/lock.gif" alt="locked" width="29" height="41"></td>
                      <td class="heading2">Login with your <strong>campus username and password </strong></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td valign="top"><strong>username:</strong></td>
                  <td valign="top"><asp:TextBox ID="txtUsername" name="txtUsername" runat="server" TabIndex="1"></asp:TextBox></td>
                </tr>
                <tr>
                  <td valign="top"><strong>password:</strong></td>
                  <td valign="top"><asp:TextBox ID="txtPassword" name="txtPassword" runat="server" TabIndex="2" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                  <td colspan="2" valign="top" align="right"><asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="LoginCheck"></asp:Button></td>
                </tr>
              </table>
            <p><a href="help.aspx">Help</a>&nbsp;&nbsp;| &nbsp;&nbsp;<a href="index_affiliate.aspx">Log-in for affiliate users</a> </p>
            <p>&nbsp;</p>
		</td>
      </tr>
    </table>
    <!--#include virtual="/login/includes/sub_footer.asp"-->
</div>
</form>
</body>
</html>