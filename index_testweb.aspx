<%@ Page language="C#" validateRequest="False" %>
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
		else
		{
			GetOpenURL();
		}
	}
}
void GetOpenURL ()
{
	/*
	 * Purpose:	Grabs OpenURL 0.1 elements from querystring
	 * Accepts:	Nothing
	 * Returns:	Nothing, sets all values in session state
	 */
	
	string strOpenUrl = "";				// the entire openurl
	
	string strSid = ""; 				// sid
	string strPid = ""; 				// pid
	string strGenre = "";				// genre
	
	string strAuLast = ""; 				// aulast
	string strAuthorFirst = ""; 		// aufirst
	string strAuthorInitial = ""; 		// auinit
	string strAuthorInitialMiddle = ""; // auinitm
	string strAuthorInitialLast	 = "";	// auinitl
	
	string strArticleTitle = ""; 		// atitle
	string strJournalTitle = ""; 		// title
	string strSeriesTitle = ""; 		// stitle
	
	string strDate = ""; 				// date
	string strVolume = ""; 				// volume
	string strIssue = ""; 				// issue
	string strPart = "";				// part
	string strStartPage = ""; 			// spage
	string strEndPage = ""; 			// epage
	string strPages = "";				// pages
	string strQuarter = "";				// quarter
	string strSeason = "";				// ssn
	
	string strIssn = ""; 				// issn
	string strElectronicIssn = "";		// eissn
	string strCoden = "";				// coden
	string strIsbn = "";				// isbn
	
	// grab query string values
	
	if ( Request.QueryString != null )
	{
		strOpenUrl = "?";
		
		foreach ( string var in Request.QueryString )
		{
			strOpenUrl += var + "=" + Server.UrlEncode(Request.QueryString[ var ]) + "&";
		}
	}
	
	// identifiers
	
	if ( Request.QueryString["rft.sid"] != null ) { strSid = Request.QueryString["rft.sid"].Trim();	}
	if ( Request.QueryString["rft.pid"] != null ) {	strPid = Request.QueryString["rft.pid"].Trim();	}
	if ( Request.QueryString["rft.genre"] != null ) { strGenre = Request.QueryString["rft.genre"].Trim(); }
	
	// author
	
	if ( Request.QueryString["rft.aulast"] != null ) { strAuLast = Request.QueryString["rft.aulast"].Trim(); }
	if ( Request.QueryString["rft.aufirst"] != null ) {	strAuthorFirst = Request.QueryString["rft.aufirst"].Trim();	}
	if ( Request.QueryString["rft.auinit"] != null ) { strAuthorInitial = Request.QueryString["rft.auinit"].Trim();	}
	if ( Request.QueryString["rft.auinitm"] != null ) {	strAuthorInitialMiddle = Request.QueryString["rft.auinitm"].Trim();	}
	if ( Request.QueryString["rft.auinitl"] != null ) {	strAuthorInitialLast = Request.QueryString["rft.auinitl"].Trim(); }
	
	// title
	
	if ( Request.QueryString["rft.atitle"] != null ) { strArticleTitle = Request.QueryString["rft.atitle"].Trim();	}	
	if ( Request.QueryString["rft.title"] != null ) { strJournalTitle = Request.QueryString["rft.title"].Trim(); }
	if ( Request.QueryString["rft.stitle"] != null ) { strSeriesTitle = Request.QueryString["rft.stitle"].Trim(); }
	
	// publication
	
	if ( Request.QueryString["rft.date"] != null ) { strDate = Request.QueryString["rft.date"].Trim();	}	
	if ( Request.QueryString["rft.volume"] != null ) { strVolume = Request.QueryString["rft.volume"].Trim(); }
	if ( Request.QueryString["rft.issue"] != null ) { strIssue = Request.QueryString["rft.issue"].Trim(); }	
	if ( Request.QueryString["rft.part"] != null ) { strPart = Request.QueryString["rft.part"].Trim();	}	
	if ( Request.QueryString["rft.spage"] != null ) { strStartPage = Request.QueryString["rft.spage"].Trim(); }	
	if ( Request.QueryString["rft.epage"] != null ) { strEndPage = Request.QueryString["rft.epage"].Trim();	}
	if ( Request.QueryString["rft.pages"] != null ) { strPages = Request.QueryString["rft.pages"].Trim(); }
	if ( Request.QueryString["rft.quarter"] != null ) {	strQuarter = Request.QueryString["rft.quarter"].Trim();	}
	if ( Request.QueryString["rft.ssn"] != null ) {	strSeason = Request.QueryString["rft.ssn"].Trim();	}	
	
	// standard numbers
	
	if ( Request.QueryString["rft.issn"] != null ) { strIssn = Request.QueryString["rft.issn"].Trim();	}
	if ( Request.QueryString["rft.eissn"] != null ) { strElectronicIssn = Request.QueryString["rft.eissn"].Trim();	}
	if ( Request.QueryString["rft.coden"] != null ) { strCoden = Request.QueryString["rft.coden"].Trim(); }
	if ( Request.QueryString["rft.isbn"] != null ) { strIsbn = Request.QueryString["rft.isbn"].Trim();	}	
			
	// set session state
	// In Illiad 7.2 and greater this is what is us to append to the Illiad.dll string in the Welcome page
	// and used to complete the ILL forms. 
	Session["openurl"] = strOpenUrl; 	
	
	//This is for passing along pieces of data to the screen in index.aspx and welcome.aspx pages
	Session["sid"] = strSid; 				 
	Session["pid"] = strPid; 				
	Session["genre"] = strGenre; 
	
	Session["aulast"] = strAuLast; 			
	Session["aufirst"] = strAuthorFirst;
	Session["auinit"] = strAuthorInitial; 		
	Session["auinitm"] = strAuthorInitialMiddle; 
	Session["auinitl"] = strAuthorInitialLast;
	
	Session["atitle"] = strArticleTitle; 		
	Session["title"] = strJournalTitle;
	Session["stitle"] = strSeriesTitle;
	
	Session["date"] = strDate; 				
	Session["volume"] = strVolume; 				
	Session["issue"] = strIssue; 		
	Session["part"] = strPart; 		
	Session["spage"] = strStartPage; 			
	Session["epage"] = strEndPage; 
	Session["pages"] = strPages; 		
	Session["quarter"] = strQuarter; 		
	Session["ssn"] = strSeason; 		
	
	Session["issn"] = strIssn;
	Session["eissn"] = strElectronicIssn;
	Session["coden"] = strCoden;
	Session["isbn"] =  strIsbn;
	
	
	// set request display label
	
	if ( strIssn != "" )
	{
		strIssn = "[" + strIssn + "]";
	}
	
	if (strDate != "")
	{
		strDate = "yr: " + strDate;
	}
	
	if (strVolume != "")
	{
		strVolume = "vol: " + strVolume;
	}
	
	if (strIssue != "")
	{
		strIssue = "iss: " + strIssue;
	}
	
	if (strStartPage != "")
	{
		strStartPage = "pg: " + strStartPage;
	}
	
	StringBuilder objStringBuilder = new StringBuilder();
	objStringBuilder.Append("<table cellspacing='0' cellpadding='3' border='0'>");
	objStringBuilder.Append("<tr>"); 
	objStringBuilder.Append("<td valign='top' width='10'><b>Title: </b></td>");
	objStringBuilder.Append("<td valign='top' align='left'>" + strArticleTitle + "&nbsp;");
	objStringBuilder.Append("</td>");
	objStringBuilder.Append("</tr>");
	objStringBuilder.Append("<tr> ");
	objStringBuilder.Append("<td valign='top' width='10'><b>Source: </b></td>");
	objStringBuilder.Append("<td valign='top' align='left'>" + strJournalTitle + "&nbsp;" + strIssn + "<br>");
	objStringBuilder.Append( strDate + "&nbsp;" + strVolume + "&nbsp;" + strIssue + "&nbsp;" + strStartPage);
	objStringBuilder.Append("</td>");
	objStringBuilder.Append("</tr>");
	objStringBuilder.Append("</table>");
	
	// assign to session variable for display on next page
	// and label for this page
	Session["request"] = objStringBuilder.ToString();
	lblRequest.Text = objStringBuilder.ToString();

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
						//if ( 1 == 1 )	//Used to bypass PAC check if unavailable					
						if ( objUser.CheckStandingCatalog(txtUsername.Text, true) )
						{
							
							// update illiad if data from catalog is newer
							
							if  ( objUser.CatalogUpdatedDate > objUser.IlliadUpdatedDate )
							{
								objUser.UpdateUserIlliad( txtUsername.Text );
							}
							
						
							// redirect user to entrance page that simulates logging into illiad
							Response.Redirect("welcome_testweb.aspx", false);
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
<!--#include virtual="/illiad/header.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
<div class="righty-twothirds-panel">
<form id="Login" method="post" runat="server" class="webform-client-form" onSubmit="return CheckUsername(this)">
<div><asp:Label ID="lblError" runat="server"></asp:Label></div>
<p><strong>You are requesting:</strong></p>
<p><asp:Label ID="lblRequest" runat="server"></asp:Label></p>
<fieldset class="webform-component-fieldset">
<legend><a>Sign-In </a></legend>
<div class="fieldset-wrapper">
<p> &nbsp; Please use your CSUSM email account info</p>
<div class="form-line-item">
<label for="user">username </label><asp:TextBox ID="txtUsername" name="txtUsername" class="form-text" runat="server" TabIndex="1"></asp:TextBox>
</div>
<div class="form-line-item">
<label for="pass">password </label><asp:TextBox ID="txtPassword" name="txtPassword" class="form-text" runat="server" TabIndex="2" TextMode="Password"></asp:TextBox>
</div>
<div class="form-line-item">
<asp:Button ID="btnLogin" runat="server" class="form-submit" Text="Login" OnClick="LoginCheck"></asp:Button>
</div>
</div>
</fieldset>
</form>
</div>
<div id="right-sidebar-holder">
<div class="sidebar-content-item">
<div class="tabbed-header">
<h4><span>Helpful Tips</span></h4>
</div>
<div class="sidebar-content-piece">	
<p><a href="help.aspx">Login Help</a></p>
<p><a href="index_affiliate.aspx">Log-in for affiliate users</a> </p>
<p><a href="http://www.csusm.edu/iits/sth/email.htm">Email at CSUSM</a><br>
Learn how to get and use your CSUSM email account.</p>
</div>
</div>

</div>

<!--#include virtual="/illiad/footer.html"-->