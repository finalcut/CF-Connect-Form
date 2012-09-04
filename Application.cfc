<cfcomponent extends="org.corfield.framework">
	<cfscript>
	variables.framework = structNew();

    variables.framework.reloadApplicationOnEveryRequest = true;
	</cfscript>
	<cffunction name="setupRequest">
		<cfset controller('security.checkMUID') />
	</cffunction>

</cfcomponent>

<!---
component extends="org.corfield.framework" {
	
	function setupRequest(){
		controller('security.checkMUID');
	}

	// Either put the org folder in your webroot or create a mapping for it!
	
	// FW/1 - configuration for introduction application:
	// controllers/layouts/services/views are in this folder (allowing for non-empty context root):
	variables.framework = {
		reloadApplicationOnEveryRequest = true,
		base = getDirectoryFromPath( CGI.SCRIPT_NAME ).replace( getContextRoot(), '' )
	};

}
--->>