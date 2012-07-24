<cfcomponent>
	<cffunction name="checkMUID">
		<cfargument name="rc">
		<cfset var isGood = StructKeyExists(rc, "id") />
		<cfif isGood>
			<!--- todo: decrypt the id and extract the muid, 901number, first name, and lastname from it.. --->
			<cfif ListLen(rc.id,"|") EQ 4>
				<cfset rc.muid = GetToken(rc.id,1,"|") />
				<cfset rc.nineOhOneNumber = GetToken(rc.id,2,"|") />
				<cfset rc.firstname = GetToken(rc.id,3,"|") />
				<cfset rc.lastname = GetToken(rc.id,4,"|") />
		<cfelse>
				<cfset rc.muid = "rawlins2" />
				<cfset rc.nineOhOneNumber = "901182306" />
				<cfset rc.firstname = "William" />
				<cfset rc.lastname = "Rawlinson" />
			</cfif>
		</cfif>
		<cfif NOT isGood>
			<cfthrow detail="You are not a valid user.  Please access this site via the mymu portal.">
		</cfif>
	</cffunction>
</cfcomponent>