<cfcomponent name="encryptor">
	<cffunction name="init" returntype="encryptor">
		<cfscript>
			variables.instance = structNew();
			variables.instance.password = "D3sS$Z3F+2fooMal3rt1GTL";

			return this;
		</cfscript>
	</cffunction>

	<cffunction name="decryptify" returntype="string" output="false">
		<cfargument name="instring" type="string" required="true" />
		<cfset var val = "" />
		<cfset var d = createObject("java", "Encryptor").init() />
		<cftry>
			<cfset val = d.decrypt(arguments.instring, variables.instance.password) />
		<cfcatch>
			<cfthrow detail="The id passed is not valid.  Please access the site via the mymu portal." />
		</cfcatch>
		</cftry>
		<cfreturn val />
	</cffunction>

	<cffunction name="encryptify" returntype="string" output="false">
		<cfargument name="instring" type="string" required="true" />

		<cfset var d = createObject("java", "Encryptor").init() />
		<cfreturn d.encrypt(arguments.instring, variables.instance.password) />
	</cffunction>

</cfcomponent>