<cfcomponent extends="org.corfield.framework">
	<cfscript>
	variables.framework = structNew();

    variables.framework.reloadApplicationOnEveryRequest = true;
	</cfscript>
	<cffunction name="setupRequest">
		<cfset controller('security.checkMUID') />
	</cffunction>

</cfcomponent>
