<%@ Page Language="C#" ContentType="text/xml" %>
<%@Import Namespace="System" %>
<%@Import Namespace="System.IO" %>
<script runat="server">
protected void Page_Load(Object Src, EventArgs E)
{
	string strPath = "";	// physical path to error log file
	
	int iMonth = DateTime.Now.Month;
	int iYear = DateTime.Now.Year;
	string strYearMonth = iYear.ToString() + "-" + iMonth.ToString("00");
			
	string strLog = "";		// querystring: specified file

	// grab query string values
	if ( Request.QueryString["log"] != null ) {
		strLog = Request.QueryString["log"].Trim();
	}

	if ( strLog == "patronload" )
	{
		strPath = Server.MapPath("logs/patronload-" + strYearMonth + ".xml");
	}
	else if ( strLog == "login")
	{
		strPath = Server.MapPath("logs/login-" + strYearMonth + ".xml");
	}
	
	if (File.Exists(strPath))
	{

		// open the file for reading
		StreamReader objReader = File.OpenText(strPath);
		string strXml = objReader.ReadToEnd();
		objReader.Close();
		
		xmlOutput.DocumentContent = strXml;
	}
}
</script>
<asp:Xml ID="xmlOutput" runat="server" />