<%@ Page Language="C#" %>
<%@ Import Namespace="Illiad" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
	// check if this is an unexpected error, and log appropriately
	// all other errors are logged at point of problem and error message
	// passed here version error session object
	
	if ( Request.QueryString["aspxerrorpath"] != null )
	{
		Session["error"] = "This is an unexpected system error.";
		Authentication objUser = new Authentication();
		objUser.WriteToLog(Request.QueryString["aspxerrorpath"].Trim(), "unexpected error", "login");
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Error | Interlibrary Loan | Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<style type="text/css">
<!--
.style1 {color: #990000}
-->
</style>
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body id="type-b">
<!--#include virtual="/illiad/includes/csusm_header.asp"-->
<div class="righty-twothirds-panel">
<h2><img src="https://biblio.csusm.edu/sites/all/images/icons/problem.png" alt="warning sign icon" width="22" height="30" align="top" /> An  unexpected error occured </h2>
<p>The Library has already been informed of this problem, and will attempt to resolve it. Library Technical Support is only available Monday&#8211;Friday from 8:00 AM to 5:00 PM</p>
<p>If you would like to talk to someone from the Library about this issue:</p>
<p>Phone: 760-750-4358<br />
Email: <a href="http://biblio.csusm.edu/external/contact-library/email-us?area=troudenb@csusm.edu">Library Feedback Form </a></p>
<h4>Details</h4>
<p><%= Session["error"] %></p>
</div>
<div id="right-sidebar-holder">
<div class="sidebar-content-item">
<div class="tabbed-header">
<h4><span>Helpful Tips</span></h4>
</div>
<div class="sidebar-content-piece">	
<p><a href="http://biblio.csusm.edu/external/distance-services-library/login-help-for-interlibrary-loan">Login Help</a></p>
<p><a href="index_affiliate.aspx">Log-in for affiliate users</a> </p>
<p><a href="http://www.csusm.edu/iits/sth/email.htm">Email at CSUSM</a><br />
Learn how to get and use your CSUSM email account.</p>
</div>
</div>

</div>


<!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>