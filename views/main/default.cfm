<cfoutput>
	<h1>Hello, #rc.firstname# #rc.lastname#</h1>
	<p>Please edit your alert preferences below.</p>
	<form method="post" id="frmAlert" action="index.cfm?action=main.process">
		<input type="hidden" name="id" value="#rc.id#" />


		<fieldset><legend>Email</legend>
			<div class="row offset1">
				<div class="span6">
				<label>Primary Email</label>
				<div>
					<strong>#rc.contact.getPrimaryEmail()#</strong>
					<input type="hidden" name="email" id="email1" value="#rc.contact.getPrimaryEmail()#" />
				</div>
				</div>
				<div class="span6">
				<label for="email2">Secondary Email</label>
				<input type="text" name="email" id="email2" value="#rc.contact.getSecondaryEmail()#" class="email" />
				</div>
			</div>
			
		</fieldset>
		<fieldset><legend>Text Messaging</legend>
			<div class="row offset1">
				<div class="span6">
				<label for="text">Text Number</label>
				<input type="text" name="text" id="text" value="#rc.contact.getTextNumber()#" class="phoneUS"  />
				</div>
			</div>

			
		</fieldset>
		<fieldset><legend>Phone Numbers</legend>
			<div class="row offset1">
				<div class="span6">
					<label for="home">Home Phone</label>
					<input type="text" name="homePhone" id="home" value="#rc.contact.getHomePhone()#" class="phoneUS" />
				</div>
				<div class="span6">
					<label for="work">Work Phone</label>
					<input type="text" name="workPhone" id="work" value="#rc.contact.getWorkPhone()#" class="phoneUS" />
				</div>
			</div>
			<div class="row offset1">
				<div class="span6">
					<label for="mobile">Mobile Phone</label>
					<input type="text" name="mobilePhone" id="mobile" value="#rc.contact.getMobilePhone()#" class="phoneUS" />
				</div>
			</div>			
		</fieldset>
		<div class="form-actions">
            <button type="submit" class="btn btn-primary">Save</button>
            <button class="btn">Cancel</button>
          </div>
</form>
</cfoutput>

<script type="text/javascript">
	$().ready(function(){
		$("#frmAlert").validate();
	});
</script>
