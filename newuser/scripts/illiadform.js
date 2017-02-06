// JavaScript Document
function SwitchLoginIlliad()
{
	document.forms.Login.SubmitButton.value = 'Logon to ILLiad';
	return true;
}

function SwitchLoginIlliadBV()
{
	document.forms.LoginBV.SubmitButton.value = 'Logon to ILLiad';
	return true;
}

function CheckUsername( form1 )
{
	var strUsername = form1.txtUsername.value;
	var strError = "";		// error check
	
	// normalize data
	strUsername = strUsername.replace(' ','');
	strUsername = strUsername.replace('-','');
	
	
	if ( strUsername.match(/20680/) )		// check for barcode
	{
		strError = "It looks like you entered a library barcode.\n\n " +
				   "Interlibrary Loan now only accepts campus usernames and passwords.\n  " +
				   "This is the same username and password you use to login to campus computers \n" +
				   "or with Webmail.";
	}
	else if ( strUsername.match(/^[0-9]{9}$/) ) 	// check for ssn
	{
		strError = "It looks like you entered a social security number.\n\n " +
				   "Interlibrary Loan only accepts campus usernames and passwords.\n " +
				   "This is the same username and password you use to login to campus computers \n" +
				   "or with Webmail.";
	}
	else if ( strUsername.match(/^\@[0-9]{7,10}$/) ) 		// check for campus id
	{
		strError = "It looks like you entered a campus id number.\n\n " +
				   "Interlibrary Loan only accepts campus usernames and passwords.\n " +
				   "This is the same username and password you use to login to campus computers \n" +
				   "or with Webmail.";
	}		
	else if ( strUsername.match(/csusm/) ) 			// check for domain name
	{
		strError = "Please don't specify the domain '@csusm.edu' or 'csusm\\' when entering in your username.\n " +
				   "Just enter in the username itself.";
	}		
	// check if any of the above matched
	if ( strError != "")
	{
		alert(strError);
		return false;
	}
	return true;
}