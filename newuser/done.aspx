<%@ Page Language="C#" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Account Setup Complete! | Interlibrary Loan | University Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body id="type-b">
  <!--#include virtual="/illiad/includes/csusm_header.asp"-->
  <div class="row">
    <div class="col-md-8">
      <div><img src="images/done.gif" alt="steps" width="442" height="93" border="0" usemap="#Map"></div>
      <h2> That's it! You're now ready to use Interlibrary Loan. </h2>
      <p>We just need you to <a href="../../illiad/illiad.dll<%= Session["openurl"] %>">login again</a> real quick and you can get started. </p>
    </div>
  </div>
  <map name="Map"> 
    <area shape="rect" coords="13,3,79,87" href="index.aspx" alt="step 1"> 
    <area shape="rect" coords="94,3,162,88" href="copyright.aspx"> 
    <area shape="rect" coords="185,3,250,92" href="verify.aspx">
  </map> 
  <!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>
