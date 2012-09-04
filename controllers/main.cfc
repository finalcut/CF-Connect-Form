<cfcomponent>
	<cffunction name="before" output="true">
	</cffunction>

	<cffunction name="default">
		<cfargument name="rc">

		<cfset var local = structNew() />

		<!--- todo: lookup the 901 number: 
		<cfset local.banner = createObject("component","com.blackboard.connect.banner").init() />
		<cfset rc.nineOhOneNumber = local.banner.getnineOhOneNumber(arguments.rc.muid) />
		--->

		<cfset local.bb = getBBObject() />
		<cfset local.user = local.bb.getContact(rc.nineOhOneNumber, "Student") />

		


		<cfif ArrayLen(local.user.getEmailAddresses()) EQ 0>

			<cfset local.primaryEmail = createObject("component", "com.blackboard.connect.email").init("#rc.muid#@marshall.edu", 1) />
			<cfset local.user.addEmailAddress(local.primaryEmail) />
		</cfif>

		<cfset local.contact = createObject("component", "com.blackboard.connect.simpleContact").init(local.user) />
		<cfset rc.contact = local.contact />
	</cffunction>



	<cffunction name="process">
		<cfargument name="rc">
		<cfset var local = structNew() />
		<cfset local.bb = getBBObject() />

		<cfset local.simple = createObject("component", "com.blackboard.connect.simpleContact").simpleInit(argumentCollection=rc) />
		<cfset local.contact = local.simple.getContact() />

		<cfset local.contactXML = local.bb.saveContact(local.contact) />
	</cffunction>

	<cffunction name="after">
	</cffunction>


	<cffunction name="getBBObject" access="private" returntype="any">
		<cfset  var config = structNew() />
		<cfset config.today = DateConvert("local2utc",Now()) />
		<cfset config.dateVal = DateFormat(config.today, "yyyymmdd") />
		<cfset config.timeVal = TimeFormat(config.today, "HHmm") />
		<cfset config.rawKey = "140779rA4AK" />
		<cfset config.secret = "GhyMgB9ehge4rKJ" />
		<cfset config.webserviceURL = "https://ServiceSTG.BlackboardConnect.Com/Contact/v2/ContactService.asmx" />
		<cfset config.siteLocalId = "140779" />
		<cfreturn CreateObject("component","com.blackboard.connect.connect").init(config.secret, config.rawKey, config.webserviceURL, config.siteLocalId) />
	</cffunction>
</cfcomponent>