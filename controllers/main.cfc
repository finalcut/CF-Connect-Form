<cfcomponent>
	<cffunction name="before" output="true">
	</cffunction>

	<cffunction name="init">
		<cfset  variables.instance= structNew() />
	</cffunction>

	<cffunction name="default">
		<cfargument name="rc">

		<cfset var local = structNew() />
		<cfset var config = GetConfig() />

		<cfset local.bb = getBBObject() />
		<cfset local.user = local.bb.getContact(rc.nineOhOneNumber, config.usertype) />

		<cfset setDefaultEmail(rc,local.user) />

		<cfset local.contact = createObject("component", "com.blackboard.connect.simpleContact").init(local.user) />
		<cfset rc.contact = local.contact />
	</cffunction>

	<cffunction name="unsubscribe">
		<cfargument name="rc">
		<cfset var local = structNew() />
		<cfset var config = GetConfig() />

		<cfset local.bb = getBBObject() />
		<cfset local.simple = createObject("component", "com.blackboard.connect.simpleContact").simpleInit(argumentCollection=rc) />
		<cfset local.contact = local.simple.getContact() />
		<cfset local.contact.setContactType(config.usertype) />

		<cfset local.contactXML = local.bb.deleteContact(rc.nineOhOneNumber,config.usertype,local.contact) />
	</cffunction>


	<cffunction name="process">
		<cfargument name="rc">
		<cfset var local = structNew() />
		<cfset var config = GetConfig() />
		<cfset local.bb = getBBObject() />

		<cfset local.simple = createObject("component", "com.blackboard.connect.simpleContact").simpleInit(argumentCollection=rc) />
		<cfset local.contact = local.simple.getContact() />
		<cfset local.contact.setContactType(config.usertype) />

		<cfset local.contactXML = local.bb.saveContact(local.contact) />
	</cffunction>

	<cffunction name="after">
	</cffunction>


	<cffunction name="setDefaultEmail" access="private" returntype="any">
		<cfargument name="rc">
		<cfargument name="user" type="any">

		<cfset var local = StructNew() />

		<!---
			If we want to prepopulate an email field; if none exist - use this..
			NOTE: this will be confusing if the user deletes their email addresses and then reloads the page and sees an email address.
		--->
		<cfreturn />

			<cfif ArrayLen(arguments.user.getEmailAddresses()) EQ 0>
				<cfset local.primaryEmail = createObject("component", "com.blackboard.connect.email").init("#rc.muid#@marshall.edu", 1) />
				<cfset arguments.user.addEmailAddress(local.primaryEmail) />
			</cfif>

	</cffunction>



	<cffunction name="getBBObject" access="private" returntype="any">
		<cfset var config = getConfig() />
		<cfreturn CreateObject("component","com.blackboard.connect.connect").init(config.secret, config.rawKey, config.webserviceURL, config.siteLocalId, config.loggingPath, config.uselogging) />
	</cffunction>

	<cffunction name="getConfig" access="private" returntype="any">
		<cfset var c = "" />
		<cfset var o = "" />
		<cfif NOT StructKeyExists(variables.instance, "config")>
			<cffile action="read" file="#ExpandPath('./')#config.xml" variable="c">
			<cfwddx action="wddx2cfml" input="#c#" output="c" />
			<cfset variables.instance.config = c />
			<cfset variables.instance.config.loggingPath = ExpandPath('./#variables.instance.config.loggingPath#') />
		</cfif>
		<cfreturn variables.instance.config />
	</cffunction>
</cfcomponent>