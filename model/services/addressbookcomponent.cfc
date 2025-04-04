<cfcomponent>
    <cffunction name="loginUser" returnType="string">
        <cfargument name="emailId">
        <cfargument name="password">
        <cfset local.encryptedPassword = hash(arguments.password,"sha-256","UTF-8")>
		<cfset local.loginDetails = getUserDetails(
			emailId = arguments.emailId,
			password = local.encryptedPassword
		)>
		<cfif local.loginDetails.recordCount GT 0>
			<cfset local.result = "success">
			<cfset session.emailId = local.loginDetails.emailId>
			<cfset session.username = local.loginDetails.username>
			<cfelse>
				<cfset local.result = "failed">
		</cfif>
		<cfreturn local.result>
    </cffunction>

	<cffunction name="getUserDetails" returnType="query">
        <cfargument name="emailId" required = "true">
        <cfargument name="password" required = "false">
		<cfquery name="local.getUserQuery" dataSource="myData">
			SELECT 
				name,
				username,
                emailId,
				password,
				profileImage
            FROM 
                userTable
            WHERE 
                emailId = <cfqueryparam value = '#arguments.emailId#' cfsqltype = "cf_sql_varchar">
				<cfif structKeyExists(arguments,"password")>
					AND password = <cfqueryparam value = '#arguments.password#' cfsqltype = "cf_sql_varchar">
				</cfif>
		</cfquery>
		<cfreturn local.getUserQuery>
    </cffunction>

	<cffunction name="displayContact" returnType="query">
		<cfargument  name="contactId">
        <cfquery name="local.addContact">
            SELECT 
                contactId,
				title,
                firstName,
                lastName,
                gender,
                dateOfBirth,
                profileImage,
                address,
                street,
                district,
                state,
                country,
                pincode,
                emailId,
                phoneNumber,
                _createdBy
            FROM 
                contactTable
            WHERE 
				active = 1
				<cfif structKeyExists(arguments,"contactId")>
					AND contactId = <cfqueryparam value = '#arguments.contactId#' cfsqltype = "cf_sql_integer">
                    <cfelse>
                        AND _createdBy = <cfqueryparam value = '#session.username#' cfsqltype = "cf_sql_varchar">
				</cfif>
        </cfquery>
        <cfreturn local.addContact>
    </cffunction>

	<cffunction name="addContacts">
		<cfargument name="title"> 
        <cfargument name="firstName">
        <cfargument name="lastName">
        <cfargument name="gender">
        <cfargument name="dateOfBirth">
        <cfargument name="profileImage">
        <cfargument name="address"> 
        <cfargument name="street"> 
        <cfargument name="district">
        <cfargument name="state">
        <cfargument name="country">
        <cfargument name="pincode">
        <cfargument name="emailId">
        <cfargument name="phoneNumber">
        <cfquery name="local.addContact">
            INSERT INTO 
                contactTable (
                title,
                firstName,
                lastName,
                gender,
                dateOfBirth,
                profileImage,
                address,
                street,
                district,
                state,
                country,
                pincode,
                emailId,
                phoneNumber,
                _createdBy,
                _createdOn,
                active
                )
            VALUES (
                <cfqueryparam value = '#arguments.title#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.firstName#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.lastName#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.gender#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.dateOfBirth#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.profileImage#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.address#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.street#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.district#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.state#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.country#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.pinCode#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.emailId#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#arguments.phoneNumber#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#session.username#' cfsqltype = "cf_sql_varchar">,
                <cfqueryparam value = '#dateFormat(now(),"yyyy-mm-dd")#' cfsqltype = "cf_sql_date">,
                1
                )
        </cfquery>
    </cffunction>

    <cffunction name="editContacts">
        <cfargument name="title"> 
        <cfargument name="firstName">
        <cfargument name="lastName">
        <cfargument name="gender">
        <cfargument name="dateOfBirth">
        <cfargument name="profileImage">
        <cfargument name="address"> 
        <cfargument name="street"> 
        <cfargument name="district">
        <cfargument name="state">
        <cfargument name="country">
        <cfargument name="pincode">
        <cfargument name="emailId">
        <cfargument name="phoneNumber">
        <cfargument  name="editSubmit">
        <cfquery name = "local.editContact">
            UPDATE
                contactTable
            SET
                title = <cfqueryparam value = '#arguments.title#' cfsqltype = "cf_sql_varchar">,
                firstName = <cfqueryparam value = '#arguments.firstName#' cfsqltype = "cf_sql_varchar">,
                lastName = <cfqueryparam value = '#arguments.lastName#' cfsqltype = "cf_sql_varchar">,
                gender = <cfqueryparam value = '#arguments.gender#' cfsqltype = "cf_sql_varchar">,
                dateOfBirth = <cfqueryparam value = '#arguments.dateOfBirth#' cfsqltype = "cf_sql_varchar">,
                <cfif arguments.profileImage NEQ "">
                    profileImage = <cfqueryparam value = '#arguments.profileImage#' cfsqltype = "cf_sql_varchar">,
                </cfif>
                address = <cfqueryparam value = '#arguments.address#' cfsqltype = "cf_sql_varchar">,
                street = <cfqueryparam value = '#arguments.street#' cfsqltype = "cf_sql_varchar">,
                district = <cfqueryparam value = '#arguments.district#' cfsqltype = "cf_sql_varchar">,
                STATE = <cfqueryparam value = '#arguments.state#' cfsqltype = "cf_sql_varchar">,
                country = <cfqueryparam value = '#arguments.country#' cfsqltype = "cf_sql_varchar">,
                pincode = <cfqueryparam value = '#arguments.pinCode#' cfsqltype = "cf_sql_varchar">,
                emailId = <cfqueryparam value = '#arguments.emailId#' cfsqltype = "cf_sql_varchar">,
                phoneNumber = <cfqueryparam value = '#arguments.phoneNumber#' cfsqltype = "cf_sql_varchar">,
                _UpdatedOn = <cfqueryparam value = '#dateFormat(now(),"yyyy-mm-dd")#' cfsqltype = "cf_sql_varchar">
            WHERE 
                contactId = <cfqueryparam value = '#arguments.editSubmit#' cfsqltype = "cf_sql_varchar">
        </cfquery>
    </cffunction>

	<cffunction name="viewModal" access="remote" returnFormat="JSON" returnType="struct">
        <cfargument name="contactIdModal">
        <cfargument  name="editval">
        <cfset local.structure = structNew()>
        <cfset local.viewQuery = displayContact(contactId = arguments.contactIdModal)>
        <cfset local.roleIdArray = arrayNew(1)>
        <cfset local.structure["title"] = local.viewQuery.title>
        <cfset local.structure["firstName"] = local.viewQuery.firstName>
        <cfset local.structure["lastName"] = local.viewQuery.lastName>
        <cfset local.structure["gender"] = local.viewQuery.gender>
        <cfif arguments.editVal EQ true>
            <cfset local.structure["dateOfBirth"] = dateFormat(local.viewQuery.dateOfBirth,"yyyy-mm-dd")>
            <cfelse>
                <cfset local.structure["dateOfBirth"] = dateFormat(local.viewQuery.dateOfBirth,"dd-mm-yyyy")>
        </cfif>
        <cfset local.structure["profileImage"] = local.viewQuery.profileImage>
        <cfset local.structure["address"] = local.viewQuery.address>
        <cfset local.structure["street"] = local.viewQuery.street>
        <cfset local.structure["state"] = local.viewQuery.state>
        <cfset local.structure["district"] = local.viewQuery.district>
        <cfset local.structure["country"] = local.viewQuery.country>
        <cfset local.structure["pincode"] = local.viewQuery.pincode>
        <cfset local.structure["emailId"] = local.viewQuery.emailId>
        <cfset local.structure["phoneNumber"] = local.viewQuery.phoneNumber>
        <cfset local.structure["createSubmitId"] = arguments.contactIdModal>
        <cfreturn local.structure>
    </cffunction>
    
    <cffunction name="deleteContact" access="remote" returnType="boolean">
        <cfargument name="contactId">
        <cfquery name="local.deleteRoles">
            update 
                contactTable set active = <cfqueryparam value = 0 cfsqltype = "cf_sql_integer"> 
            WHERE 
                contactId = <cfqueryparam value = '#arguments.contactId#' cfsqltype = "cf_sql_integer">;
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction name="logout" access="remote" returnType="boolean">
        <cfset structClear(session)>
        <cfreturn true>
    </cffunction>


</cfcomponent> 
