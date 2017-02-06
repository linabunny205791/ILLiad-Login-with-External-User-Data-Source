<%@ Page language="C#" %>
<%@ Import Namespace="Illiad" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
	if (!IsPostBack)
	{
	
		StringBuilder objStringBuilder = new StringBuilder();
		
		// identifiers
		
		if ( Session["sid"] != "" && Session["sid"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"sid\" value=\"" +  (string) Session["sid"] + "\">");
		}
		if ( Session["pid"] != "" && Session["pid"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"pid\" value=\"" +  (string) Session["pid"] + "\">");
		}
		if ( Session["genre"] != "" && Session["genre"] != null ) {	
			objStringBuilder.Append("<input type=\"hidden\" name=\"genre\" value=\"" +  (string) Session["genre"] + "\">");
		}
		
		// author
		
		if ( Session["aulast"] != "" && Session["aulast"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"aulast\" value=\"" +  (string) Session["aulast"] + "\">");
		}
		if ( Session["aufirst"] != "" && Session["aufirst"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"aufirst\" value=\"" +  (string) Session["aufirst"] + "\">");
		}
		if ( Session["auinit"] != "" && Session["auinit"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"auinit\" value=\"" +  (string) Session["auinit"] + "\">");
		}
		if ( Session["auinitm"] != "" && Session["auinitm"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"auinitm\" value=\"" +  (string) Session["auinitm"] + "\">");
		}
		if ( Session["auinitl"] != "" && Session["auinitl"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"auinitl\" value=\"" +  (string) Session["auinitl"] + "\">");
		}
		
		// title
		
		if ( Session["atitle"] != "" && Session["atitle"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"atitle\" value=\"" +  (string) Session["atitle"] + "\">");
		}
		if ( Session["title"] != "" && Session["title"] != null ) {	
			objStringBuilder.Append("<input type=\"hidden\" name=\"title\" value=\"" +  (string) Session["title"] + "\">");
		}
		if ( ( Session["stitle"] != "" && Session["stitle"] != null ) &&  ( Session["sid"] != "" &&  Session["title"] != null) ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"stitle\" value=\"" +  (string) Session["stitle"] + "\">");
		}
		
		// publication	

		if ( Session["date"] != "" && Session["date"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"date\" value=\"" +  (string) Session["date"] + "\">");
		}
		if ( Session["volume"] != "" && Session["volume"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"volume\" value=\"" +  (string) Session["volume"] + "\">");
		}
		if ( Session["issue"] != "" && Session["issue"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"issue\" value=\"" +  (string) Session["issue"] + "\">");
		}
		if ( Session["part"] != "" && Session["part"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"part\" value=\"" +  (string) Session["part"] + "\">");
		}
		if ( Session["spage"] != "" && Session["spage"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"spage\" value=\"" +  (string) Session["spage"] + "\">");
		}
		if ( Session["epage"] != "" && Session["epage"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"epage\" value=\"" +  (string) Session["epage"] + "\">");
		}
		if ( Session["pages"] != "" && Session["pages"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"pages\" value=\"" +  (string) Session["pages"] + "\">");
		}
		if ( Session["quarter"] != "" && Session["quarter"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"quarter\" value=\"" +  (string) Session["quarter"] + "\">");
		}
		if ( Session["ssn"] != "" && Session["ssn"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"ssn\" value=\"" +  (string) Session["ssn"] + "\">");
		}
		
		// standard numbers
		
		if ( Session["issn"] != "" && Session["issn"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"issn\" value=\"" +  (string) Session["issn"] + "\">");
		}
		if ( Session["eissn"] != "" && Session["eissn"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"eissn\" value=\"" +  (string) Session["eissn"] + "\">");
		}
		if ( Session["coden"] != "" && Session["coden"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"coden\" value=\"" +  (string) Session["coden"] + "\">");
		}
		if ( Session["isbn"] != "" && Session["isbn"] != null ) {
			objStringBuilder.Append("<input type=\"hidden\" name=\"isbn\" value=\"" +  (string) Session["isbn"] + "\">");
		}	
		
		// display request from previous page
		// and set hidden values on page
		lblRequest.Text = (string) Session["request"];
		litHidden.Text = objStringBuilder.ToString();
	}
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Welcome | Interlibrary Loan | Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body id="type-b">
<!--#include virtual="/illiad/includes/csusm_header.asp"-->
<div class="righty-twothirds-panel">
<form id="Login" method="post" class="webform-client-form" action="../illiad/illiad.dll<%=Session["openurl"]%>" onSubmit="return SwitchLoginIlliad()" name="Logon">
<input type="hidden" name="IlliadForm" value="Logon">
<!-- <input type="hidden" name="ILLiadOpenURL" value="True"> -->
<input type="hidden" name="Username" value="<%= Session["username"] %>">
<input type="hidden" name="Password" value="yourpassword">
<asp:Literal ID="litHidden" runat="server" />
<fieldset class="webform-component-fieldset" id="request_holder">
<legend><a>Your Request </a></legend>
<div class="fieldset-wrapper">
<asp:Label ID="lblRequest" runat="server"></asp:Label>
</div></fieldset>
<h3><img src="images/warning_good.gif" width="30" height="28" />Welcome back! </h3>
<input name="SubmitButton" type="submit" id="SubmitButton" value="Continue" class="form-submit" />
</form>
</div>
<!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>