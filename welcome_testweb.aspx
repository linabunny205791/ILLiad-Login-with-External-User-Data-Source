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
<!--#include virtual="/illiad/header.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>

<form id="Login" method="post" action="../illiad/testweb/illiad.dll<%=Session["openurl"]%>" onSubmit="return SwitchLoginIlliad()" name="Logon">
<input type="hidden" name="IlliadForm" value="Logon">
<!-- <input type="hidden" name="ILLiadOpenURL" value="True"> -->
<input type="hidden" name="Username" value="<%= Session["username"] %>">
<input type="hidden" name="Password" value="yourpassword">
<asp:Literal ID="litHidden" runat="server" />
<div align="center">

	<table width="675" border="0" align="center" cellpadding="10" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td align="center">
			 <table width="400" border="0" cellpadding="5">
                <tr>
                  <td><p><strong>You are requesting:</strong></p>
                    <p>
                      <asp:Label ID="lblRequest" runat="server"></asp:Label>
                    </p></td>
                </tr>
          </table>
		  <p>&nbsp;</p>
              <table width="400" border="0" cellpadding="10" bgcolor="#EFEFEF">
                <tr>
                  <td colspan="2" valign="top"><table border="0" cellpadding="5" cellspacing="0">
                      <tr>
                        <td width="29"><img src="images/warning_good.gif" width="30" height="28"></td>
                        <td class="heading2"><span class="style1 heading1"><strong>Welcome back! </strong></span></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top"><p class="style1 heading1">&nbsp;</p>
                    <input name="SubmitButton" type="submit" id="SubmitButton" value="Continue">
                  </td>
                </tr>
                <tr>
                  <td colspan="2" valign="top" align="right">&nbsp;</td>
                </tr>
              </table>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
        </td>
      </tr>
    </table>     

</div>
</form>

<!--#include virtual="/illiad/footer.html"-->