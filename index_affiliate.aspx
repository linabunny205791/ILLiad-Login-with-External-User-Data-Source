<%@ Page language="C#" %>
<%@ Import Namespace="Illiad" %>
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
		//added 7.7.2010se
		Session["username"] = txtUsername.Text;

		try
		{
			// check if user is in good standing with catalog
			
			if ( objUser.CheckStandingCatalog(txtUsername.Text, false) )
			{
				// check if user is in illiad -- this also sets the username
				// property of the object to the local illiad username 
				
				if ( objUser.CheckAffiliateStandingIlliad(txtUsername.Text) )
				{
					Session["username"] = objUser.Username;
					
					// check if record of last name matches entered last name
					if ( objUser.LastName == txtPassword.Text )
					{
					
						// update illiad if data from catalog is newer
						if  ( objUser.CatalogUpdatedDate > objUser.IlliadUpdatedDate )
						{
							objUser.UpdateUserIlliad( objUser.Username );
						}
						
						// redirect user to entrance page that simulates logging into illiad
						Response.Redirect("welcome.aspx", false);
					}
					throw new Exception (System.Configuration.ConfigurationSettings.AppSettings["errorBadBarcodeName"]);
				}
				else
				{
					// not already an Illiad user, so redirect them to registration
					//throw new Exception ( "It looks like you've never used Interlibrary Loan before. " +
					//	"Please contact Library Resource Sharing at (760) 750-4345. ");
					//Response.Redirect( "newuser/", false); WORKING
					Response.Redirect( "newuser/", false);
				}
			}
			else
			{
				throw new Exception (System.Configuration.ConfigurationSettings.AppSettings["errorBadBarcodeName"]);
			}
		}
		catch ( Exception ex )
		{
			// the user was rejected by the catalog for something
						
			objUser.WriteToLog(ex.ToString() + objUser.PatronRecord, txtUsername.Text + ": " + ex.Message, "login");
						
			lblError.Text = "<table border='0' cellpadding='5' cellspacing='0'>" +
				"<tr> " +
				"<td with='29'><img src='images/warning.gif' width='30' height='28' alt=''></td>" +
				"<td><span class='error'>We're sorry but: " + ex.Message + "</span> [ <a href='help.aspx'>more help</a> ]</td>" +
				"</tr>" +
				"</table>";						
		}
	}
}
</script>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign-In | Interlibrary Loan | University Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body onLoad="document.forms.Login.txtUsername.focus();" id="type-b">
<!--#include virtual="/illiad/includes/csusm_header.asp"-->
<div class="row">
  <div class="col-md-8">
	  <div class="row">
	    <div class="col-md-8">
			  <form id="Login" method="post" runat="server" class="form-horizontal" onSubmit="return CheckUsername(this)">
					<h3><a>Sign-In <span class="openurl_request">to Complete Request</span></a></h3>
					<div><asp:Label ID="lblError" runat="server"></asp:Label></div>
					<fieldset class="webform-component-fieldset" id="request_holder">
						<legend><a>Your Request </a></legend>
						<div class="fieldset-wrapper">
						<asp:Label ID="lblRequest" runat="server"></asp:Label>
						</div>
					</fieldset>
					<div class="panel panel-default">
						<div class="panel-heading">
						  <p>Please login with your Library provided ID Number and Last Name.</p>
						  </div>
						<div class="panel-body">
							<div class="form-group">
								<label for="txtUsername" class="col-sm-2 control-label">Library ID Number </label>
								<div class="col-sm-10">
									<asp:TextBox ID="txtUsername" name="txtUsername" runat="server" TabIndex="1"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<label for="txtPassword" class="col-sm-2 control-label">Last Name </label>
								<div class="col-sm-10">
									<asp:TextBox ID="txtPassword" name="txtPassword" runat="server" TabIndex="2" TextMode="Password"></asp:TextBox>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="LoginCheck"></asp:Button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<h4>When do you need it?</h4>
		<table class="table" summary="Summary of options for acquiring materials not owned by the CSUSM Library.">
			<thead>
				<tr>
			    <th width="100" scope="col"></th>
			    <th width="100" scope="col">Formats</th>
			    <th scope="col">Options</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <td><b>Today</b></td>
			    <td><p>Books &amp; Articles </p></td>
			    <td><p><strong><a href="https://www.google.com/maps/search/library/">Other Local Libraries</a></strong><br />
			      If another local academic or public  library has the book or journal you  want, you can pay them a visit.</p></td>
			  </tr>
			  <tr>
			    <td><b>2-5 days </b></td>
			    <td><p>Books</p></td>
			    <td><p><a href="https://biblio.csusm.edu/content/san-diego-circuit"><strong>Circuit</strong></a><br />
			      If you find the book in Circuit (over 3 million titles), you can request it online and pick it up at our Library usually within 2-3 business days. We will notifiy you via email when your items are ready!</p></td>
			  </tr>
			  <tr>
			    <td><b>2-10 days</b></td>
			    <td><p>Books, Articles, &amp; Dissertations</p></td>
			    <td><p><a href="https://illiad.csusm.edu/illiad/illiad.dll"><strong>Interlibrary Loan Request</strong></a><br />We can get just about anything you need from just about any library within a couple of weeks. Articles can arrive in 2-5 days while books, etc. can take longer. We will notifiy you via email when your items are ready! </p></td>
			  </tr>
			</tbody>
		</table>
	</div>

	<div class="col-md-3 col-md-offset-1">
		<div id="sidebar-right1" class="row">
		<br/>
		<br/>
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Interlibrary Loan Help</h3>
			  </div>
			  <div class="panel-body">
					<p> Library - Resource Sharing<br />
					    California State University San Marcos<br />
					    333 S. Twin Oaks Valley Rd.<br />
					    San Marcos, CA 92096-0001</p>
					<p> (760) 750-4345<br />
					  <a href="mailto:ill@csusm.edu">ill@csusm.edu</a></p>
			  </div>
			</div>
			<div class="panel panel-default">
			  <div class="panel-heading">
			    <h3 class="panel-title">Login Help</h3>
			  </div>
			  <div class="panel-body">
					<p><a href="http://biblio.csusm.edu/external/distance-services-library/login-help-for-interlibrary-loan">Login Help</a></p>
					<p><a href="index_affiliate.aspx">Log-in for affiliate users</a> </p>
					<p><a href="https://illiad.csusm.edu/illiad/lending/">Institutional Lending Login/Registration</a> </p>
					<p><a href="http://www.csusm.edu/iits/sth/email.htm">Email at CSUSM</a><br />
					Learn how to get and use your CSUSM email account.</p>
			  </div>
			</div>
		</div>
	</div>
</div>
<!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>
