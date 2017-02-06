<%@ Page language="C#" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
	if (!IsPostBack)
	{
		// if cookiecheck cookie exists (set on previous page), 
		// then user has cookies enabled, but just hit login directly,
		// so send them to .dll.  if it does not exist, then user has
		// cookies turned off, so show them page below
		
		if ( Request.Cookies["cookiecheck"] != null )
		{
			Response.Redirect("/illiad/illiad.dll");		
		}	
	}
}
</script>
<html>
<head>
<title>Library: Interlibrary Loan Welcome Back</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="http://library.csusm.edu/css/lion.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript" src="http://library.csusm.edu/scripts/image_functions.js"></script>
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
<style type="text/css">
<!--
.style2 {color: #990000}
-->
</style>
</head>
<body>
<div align="center">
<!--#include virtual="/login/includes/sub_header.asp"-->
  <p>&nbsp;</p>
  <table width="400" border="0" cellpadding="10" bgcolor="#EFEFEF">
      <tr>
        <td colspan="2" valign="top"><table border="0" cellpadding="5" cellspacing="0">
            <tr>
              <td width="29"><img src="images/warning.gif" width="30" height="28"></td>
              <td class="heading2"><span class="style2 heading1"><strong>Cookies are required</strong></span></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2" valign="top">
          <p>We're sorry, but Interlibrary Loan requires that cookies be enabled on your browser.</p>
          <p>Please enable cookies on your browser and <a href="/">login again</a>. </p></td>
      </tr>
      <tr>
        <td colspan="2" valign="top" align="right">&nbsp;</td>
      </tr>
    </table>
	<p>&nbsp; </p>

<!--#include virtual="/login/includes/sub_footer.asp"-->
</div>
</body>
</html>