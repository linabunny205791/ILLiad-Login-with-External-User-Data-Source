<%@ Page language="C#"%>
<%@ Import Namespace="Illiad" %>
<script runat="server">

protected void Page_Load(Object Src, EventArgs E)
{
  
  Authentication objUser = new Authentication();
  
  // redirect out a user who has not logged in
  if ( Session["username"] == null )
  {
    Session["error"] = "An Unexpected Error occured ";
    objUser.WriteToLog("no username during registration on verify.aspx page", (string)Session["username"], "login");
    Response.Redirect("../error.aspx", false);
  }


  if (!IsPostBack)
  {     
    // get user data from pac
    try
    {
      // pull entire patron record
      objUser.PullEntireRecord( (string) Session["username"], true );

      // set hidden values
      StatusGroup.Value = objUser.Status;
      FirstName.Value = objUser.FirstName;
      LastName.Value = objUser.LastName;
      SSN.Value = objUser.Barcode;
      Department.Value = objUser.DepartmentAbbreviation;
      Phone.Value = objUser.Phone;
      EMailAddress.Value= objUser.Email;
      Address.Value = objUser.StreetAddress;
      City.Value = objUser.City;
      State.Value = objUser.State;
      Zip.Value = objUser.Zipcode;
      ExpirationDate.Value = Convert.ToString(objUser.ExpirationDate);
      
      // set display values
      lblFirstName.Text = objUser.FirstName;
      lblLastName.Text = objUser.LastName;
      lblEmail.Text = objUser.Email;
      lblMailingAddress.Text = objUser.StreetAddress;
      lblCity.Text = objUser.City;
      lblState.Text = objUser.State;
      lblZipcode.Text = objUser.Zipcode;
      
    }
    catch (Exception ex )
    {
      objUser.WriteToLog(ex.ToString(), (string) Session["username"] + ": " + ex.Message, "patronload");
      Response.Redirect("../error.aspx", false);
    }
  }
}
void Register(Object sender, EventArgs e)
{
  // create new object and fill properties with form values
  // to prevent having to go back to PAC for data yet again
  
  Authentication objUser = new Authentication();
  
  objUser.Status = StatusGroup.Value;
  objUser.FirstName = FirstName.Value;
  objUser.LastName = LastName.Value;
  objUser.Barcode = SSN.Value;
  objUser.DepartmentAbbreviation = Department.Value;
  objUser.Phone = Phone.Value;
  objUser.Email = EMailAddress.Value;
  objUser.StreetAddress = Address.Value;
  objUser.City = City.Value;
  objUser.State = State.Value;
  objUser.Zipcode = Zip.Value;
  objUser.ExpirationDate = Convert.ToDateTime(ExpirationDate.Value);
  
  // add user to database
  try
  { 
    int iRows = objUser.AddUserIlliad((string) Session["username"], WebDeliveryGroup.SelectedValue);
  }
  catch (Exception ex )
  {
    // log errors -- likley from some SQL problem
    Session["error"] = "An Unexpected Error occured " + ex.Message;
    objUser.WriteToLog(ex.ToString(), (string) Session["username"] + ": " + ex.Message, "patronload");
    Response.Redirect("../error.aspx", false);
  }

  Response.Redirect("done.aspx", false);
}
</script>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Verify Personal Information and Preferences | Interlibrary Loan | University Library | California State University San Marcos</title>
<!--#include virtual="/illiad/includes/csusm_headtag_inserts.html"-->
<script type="text/javascript" language="JavaScript" src="../scripts/illiadform.js"></script>
</head>
<body id="type-b">
  <!--#include virtual="/illiad/includes/csusm_header.asp"-->
  <div class="row">
    <div class="col-md-8">
      <div><img src="images/step-3.gif" alt="steps" width="442" height="93" border="0" usemap="#Map"> </div> 
        <form id="Registration" method="post" runat="server"> 
          <h2>Verify Personal Information and Preferences </h2> 
          <p>It is important that you double-check the information below before proceeding. All correspondence will be sent to the following e-mail and street address.</p>
          <h3>Personal Information</h3>
          <table class="table"> 
            <tbody>
              <tr> 
                <th width="25%">First Name:</th> 
                <td width="75%"><asp:Label ID="lblFirstName" runat=server ></asp:Label> </td> 
              </tr> 
              <tr> 
                <th>Last Name:</th> 
                <td><asp:Label ID="lblLastName" runat=server ></asp:Label> </td> 
              </tr> 
              <tr> 
                <th>Email Address:</th> 
                <td><asp:Label ID="lblEmail" runat=server ></asp:Label> </td> 
              </tr> 
              <tr> 
                <th>Mailing Address:</th> 
                <td><asp:Label ID="lblMailingAddress" runat=server ></asp:Label></td> 
              </tr> 
              <tr> 
                <th> City:</th>
                <td> <asp:Label ID="lblCity" runat=server ></asp:Label></td> 
              </tr>
              <tr>
                <th>State:</th>
                <td><asp:Label ID="lblState" runat=server ></asp:Label></td>
              </tr>
              <tr>
                <th>Zipcode:</th>
                <td><asp:Label ID="lblZipcode" runat=server ></asp:Label></td>
              </tr> 
            </tbody>
          </table>
          <h3>Interlibrary Loan Preferences</h3>
          <table class="table">
            <tr>
              <th width="25%">Article Delivery Method:</th>
              <td width="75%">
                All articles will be delivered electronically. You will receive a notification if an item cannot be delivered electronically.
              </td>
            </tr>
            <tr> 
              <th>Loan Delivery Method:</th>
              <td> 
                Items that cannot be mailed or delivered electronically, such as books, will  be held for pickup at the Library Circulation Desk. 
              </td>
            </tr>
            <tr> 
              <th>Notification Method:</th>
              <td>We will send all notifications and messages to your campus e-mail address. </td>
            </tr>
          </table>
          <p><asp:Button ID="btnRegister" runat="server" Text="Continue" OnClick="Register" class="btn btn-sm btn-success"></asp:Button></p>     
          <input type="hidden" id="StatusGroup" name="StatusGroup" runat="server">
          <input type="hidden" id="FirstName"  name="FirstName" runat="server">
          <input type="hidden" id="LastName"  name="LastName" runat="server">
          <input type="hidden" id="SSN"  name="SSN" runat="server">
          <input type="hidden" id="Department"  name="Department" runat="server">
          <input type="hidden" id="Phone"  name="Phone" runat="server">
          <input type="hidden" id="EMailAddress"  name="EMailAddress" runat="server">
          <input type="hidden" id="Address"  name="Address" runat="server">
          <input type="hidden" id="City"  name="City" runat="server">
          <input type="hidden" id="State"  name="State" runat="server">
          <input type="hidden" id="Zip"  name="Zip" runat="server">
          <input type="hidden" id="ExpirationDate"  name="ExpirationDate" runat="server">
        </form>
        <h3>All corrections need to be made with the campus</h3>
        <p>If any of the information above is wrong, please correct it as soon as possible. Students need to visit the <a href="http://www.csusm.edu/admissions/" class="info"> Office of Admissions</a>. Faculty and Staff should contact the <a href="http://www.csusm.edu/iits/fshelp/index.htm" class="info">Faculty Staff Help Desk</a>.</p>
        <h3>Why can't I change the information here?</h3>        
        <p>In order to insure that your information <strong>remains accurate and up-to-date across all campus systems</strong>, we ask that you update your information with the Office of Admissions (for students) or the Faculty / Staff Helpdesk (for University employees). The campus IT department will send to the Library any updated information it has received, and we will in turn <strong>automatically update our records</strong>.</p>
        <h3>Do I have to use my campus e-mail address?</h3>
        <p>The Library will send notices only to your <em>campus</em> email address. If you would prefer that notices come to a different email address, such as Yahoo or Hotmail, you need to <a href="http://public.csusm.edu/cwis/tools/forward/">set-up an e-mail forward</a> to that account from your campus email. </p>
      </div> 
    </div>
  </div>
  <map name="Map"> 
    <area shape="rect" coords="13,3,79,87" href="index.aspx" alt="step 1"> 
    <area shape="rect" coords="94,3,162,88" href="copyright.aspx"> 
  </map> 
  <!--#include virtual="/illiad/includes/csusm_footer.asp"-->
</body>
</html>
