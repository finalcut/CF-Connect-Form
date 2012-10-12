<cfcomponent>
	<cffunction name="before" output="true">
	</cffunction>

	<cffunction name="init">
		<cfset  variables.instance= structNew() />
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
		<cfset var config = getConfig() />
		<cfreturn CreateObject("component","com.blackboard.connect.connect").init(config.secret, config.rawKey, config.webserviceURL, config.siteLocalId, config.loggingPath, config.uselogging) />
	</cffunction>

	<cffunction name="getConfig" access="private" returntype="any">
		<cfif NOT StructKeyExists(variables.instance, "config")>
			<cfset variables.instance.config = structNew() />
			<cfset variables.instance.config.today = DateConvert("local2utc",Now()) />
			<cfset variables.instance.config.dateVal = DateFormat(variables.instance.config.today, "yyyymmdd") />
			<cfset variables.instance.config.timeVal = TimeFormat(variables.instance.config.today, "HHmm") />
			<cfset variables.instance.config.rawKey = "140779rA4AK" /> <!---  140779Ax6Wn--->
			<cfset variables.instance.config.secret = "GhyMgB9ehge4rKJ" /> <!---  j9t3DUQcFAbHefH --->
			<cfset variables.instance.config.webserviceURL = "https://ServiceSTG.BlackboardConnect.Com/Contact/v2/ContactService.asmx" />
			<cfset variables.instance.config.siteLocalId = "140779" />
			<cfset variables.instance.config.loggingPath = "#ExpandPath('./')#logs/bb.log" />
			<cfset variables.instance.config.uselogging = 1 />
		</cfif>
		<cfreturn variables.instance.config />
	</cffunction>
</cfcomponent>