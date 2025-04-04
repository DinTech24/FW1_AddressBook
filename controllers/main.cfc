component accessors="true" {
	property addressbookcomponentService;
	
	function init( fw ) {
        variables.framework = arguments.fw;
        return this;
    }
	
	public string function default( rc ) {
        param name="rc.emailId" default="";
		param name="rc.password" default="";
		if(len(rc.emailId) AND len(rc.password)){
			local.loginData = addressbookcomponentService.loginUser(
				emailId = rc.emailId,
				password = rc.password
			)
			if(local.loginData == "success"){
				location("index.cfm?action=main.homepage",false)
			}
			rc.loginResponse = local.loginData;
		}
		
	}

	public string function homepage( rc ) {
		if(NOT structKeyExists(session,"emailId")){
			location("index.cfm?action=main.default",false)
		}
		param name="rc.selectTitle" default="";
		param name="rc.firstName" default="";
		param name="rc.lastName" default="";
		param name="rc.selectGender" default="";
		param name="rc.dob" default="";
		param name="rc.profilePic" default="";
		param name="rc.address" default="";
		param name="rc.street" default="";
		param name="rc.district" default="";
		param name="rc.state" default="";
		param name="rc.country" default="";
		param name="rc.pincode" default="";
		param name="rc.emailId" default="";
		param name="rc.phone" default="";
		local.userData = addressbookcomponentService.getUserDetails(
			emailId = session.emailId
		)
		rc.userDetails = local.userData
		if(structKeyExists(rc,"createSubmit")){
			if (rc.profilePic == "") {
				local.profileImage = "Assets/Images/profileImage.png";
			}else {
				local.expandContactPath = "Assets/UploadedImages/"
				contactFile = fileUpload(
					destination = expandPath(expandContactPath),
					filefield = "profilePic",
					onconflict = "MakeUnique",
					mimetype="image/*"
				);
				local.profileImage = expandContactPath & contactFile.serverFile;
			}
			local.Data = addressbookcomponentService.addContacts(
                title = rc.selectTitle,
                firstName = rc.firstName,
                lastName = rc.lastName,
                gender = rc.selectGender,
                dateOfBirth = rc.dob,
                profileImage = local.profileImage,
                address = rc.address,
                street = rc.street,
                district = rc.district,
                state = rc.state,
                country = rc.country,
                pincode = rc.pincode,
                emailId = rc.emailId,
                phoneNumber = rc.phone
			)
		}
		if(structKeyExists(rc,"editSubmit")){
			param name="rc.editSubmit" default="";
			if (rc.profilePic !== "") {
				local.expandContactPath = "Assets/UploadedImages/"
				contactFile = fileUpload(
					destination = expandPath(expandContactPath),
					filefield = "profilePic",
					onconflict = "MakeUnique",
					mimetype="image/*"
				);
				local.profileImage = expandContactPath & contactFile.serverFile;
			}else{
				local.profileImage = ""
			}
			local.Data = addressbookcomponentService.editContacts(
                title = rc.selectTitle,
                firstName = rc.firstName,
                lastName = rc.lastName,
                gender = rc.selectGender,
                dateOfBirth = rc.dob,
                profileImage = local.profileImage,
                address = rc.address,
                street = rc.street,
                district = rc.district,
                state = rc.state,
                country = rc.country,
                pincode = rc.pincode,
                emailId = rc.emailId,
                phoneNumber = rc.phone,
				editSubmit = rc.editSubmit
			)
		}
		local.contactData = addressbookcomponentService.displayContact()
		rc.contactDetails = local.contactData;
	}

	remote function logoutUser(){
		addressbookcomponentService.logout()
	}

	remote function displayContactDetails(contactIdModal,editval){
		local.contactData = addressbookcomponentService.viewModal(
			contactIdModal=contactIdModal,

			
			editval = editval
		)
		variables.framework.renderData().data( local.contactData ).type( "json" );
	}

}