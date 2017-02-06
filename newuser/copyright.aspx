<%@ Page Language="c#"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Copyright Notice | Interlibrary Loan | University Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="scripts/illiadform.js"></script>
</head>
<body id="type-b">
<!--#include virtual="/illiad/includes/csusm_header.asp"-->
<div class="row">
    <div class="col-md-8">
        <div><img src="images/step-2.gif" alt="steps" width="442" height="93" border="0" usemap="#Map"></div>
        <h2> Copyright Notice </h2>
        <p>The <a href="http://www.copyright.gov/title17/" class="info">Copyright law of the United States</a> (Title 17, United States Code) governs the making of photocopies or other reproductions of copyrighted materials.</p>
        <p>Under certain conditions specified in the law, libraries and archives are authorized to furnish a photocopy or other reproduction. One of these specified conditions is that the photocopy or reproduction is not to be &quot;used for any purpose other than private study, scholarship, or research&quot;. If a user makes a request for, or later uses, a photocopy or reproduction for purposes in excess of &quot;fair use&quot;, that user may be liable for copyright infringement. </p>
        <p><strong>This institution reserves the right to refuse to accept a copying order if, in its judgment, fulfillment of the order would involve violation of copyright law.</strong></p>
        <form action="verify.aspx" method="POST">
            <input type="submit" name="SubmitButton" value="Continue" class="btn btn-sm btn-success">
        </form>
    </div>
    <map name="Map">
        <area shape="rect" coords="13,3,79,87" href="index.aspx" alt="step 1">
    </map>
</div>
<!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>