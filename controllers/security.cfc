<cfcomponent>
	<cffunction name="checkMUID">
		<cfargument name="rc">
		<cfset var e = "" />
		<cfset var fullid = "" />
		<cfset var isGood = StructKeyExists(rc, "id") />
		<cfif isGood>
			<cfset e = createObject("component", "alert.com.encryptor").init() />
			<cfset fullid = e.decryptify(rc.id) />
			<!--- todo: decrypt the id and extract the muid, 901number, first name, and lastname from it.. --->
			<cfif ListLen(fullid,"|") EQ 4>
				<cfset rc.muid = GetToken(fullid,1,"|") />
				<cfset rc.nineOhOneNumber = GetToken(fullid,2,"|") />
				<cfset rc.firstname = GetToken(fullid,3,"|") />
				<cfset rc.lastname = GetToken(fullid,4,"|") />
		<cfelse>
				<cfset isGood = false />
			</cfif>
		</cfif>
		<cfif NOT isGood>
			<cfthrow detail="You are not a valid user.  Please access this site via the mymu portal.">
		</cfif>
	</cffunction>
</cfcomponent>