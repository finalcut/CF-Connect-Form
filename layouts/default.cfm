<!DOCTYPE html>
<html>
	<head>
  	<script src="../bootstrap/js/jquery.js" type="text/javascript"></script>
	<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../bootstrap/js/plugins/jquery.validate.min.js" type="text/javascript"></script>
	<script src="../bootstrap/js/plugins/additional-methods.min.js" type="text/javascript"></script>

	<style type="text/css">
		span.error { color: red;}
	</style>

	<script type="text/javascript">

		//override some default validator settings to work better with bootstrap
		$(document).ready(function(){
			jQuery.validator.setDefaults({ 
			    errorElement: "span",
			    errorClass: "error" 
			});
			// turn validation on for every form on the page
			$("form").validate();
		});
	</script>

	<link href="../bootstrap/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<cfoutput>#body#</cfoutput>
	</body>
</html>