<cfoutput>
	<h1>Hello, #rc.firstname# #rc.lastname#</h1>
	<p>Please edit your alert preferences below.</p>
	<form method="post" id="frmAlert" action="index.cfm?action=main.process">
		<input type="hidden" name="id" value="#rc.id#" />


		<fieldset><legend>Email</legend>
			<div class="row offset1">
				<div class="span5">
				<label>Primary Email</label>
				<div>
					<strong>#rc.contact.getPrimaryEmail()#</strong>
					<input type="hidden" name="email" id="email1" value="#rc.contact.getPrimaryEmail()#" />
				</div>
				</div>
				<div class="span5">
				<label for="email2">Secondary Email</label>
				<input type="text" name="email" id="email2" value="#rc.contact.getSecondaryEmail()#" class="email" />
				</div>
			</div>
			
		</fieldset>
		<fieldset><legend>Text Messaging</legend>
			<div class="row offset1">
				<div class="span5">
					<label for="text">Text Number</label>
					<input type="text" name="text" id="text" value="#rc.contact.getTextNumber()#" class="phoneUS"  />
				</div>
				<div class="span4 alert alert-error">
					NOTE: SIP and Google Voice are not supported for mobile messaging. Please provide your real cellular number.
				</div>
			</div>

			
		</fieldset>
		<fieldset><legend>Phone Numbers</legend>
			<div class="row offset1">
				<div class="span5">
					<label for="home">Home Phone</label>
					<input type="text" name="homePhone" id="home" value="#rc.contact.getHomePhone()#" class="phoneUS" />
				</div>
				<div class="span5">
					<label for="work">Work Phone</label>
					<input type="text" name="workPhone" id="work" value="#rc.contact.getWorkPhone()#" class="phoneUS" />
				</div>
			</div>
			<div class="row offset1">
				<div class="span5">
					<label for="mobile">Mobile Phone</label>
					<input type="text" name="mobilePhone" id="mobile" value="#rc.contact.getMobilePhone()#" class="phoneUS" />
				</div>
			</div>			
		</fieldset>
		<fieldset><legend>Agreement</legend>
		<div class="row offset1">
			<div class="span8">
				<div class="control-group">
				<div class="controls">
				<label for="agree" class="checkbox inline"><input type="checkbox" name="agree" id="agree" value="1" class="checkbox" required />By clicking on the save button, I acknowlege the following MU Alert system terms of use.</label>
				</div>
				</div>
				<div class="row">The MU Alert System is powered through Blackboard Connect, a worldwide provider of emergency notification systems.  Enrollment in the MU Alert System is free, voluntary, and is strongly recommended. MU Alert notices will only be sent for emergency notifications and testing and maintenance of the system.   Tests are expected to be conducted once per semester.  I am enrolling in this system for the purpose of receiving emergency alerts delivered by the system.  MU Alerts will be sent to my choice of one or more of the following communication paths: e-mail, voice call, and SMS/text messages.  I understand that my rate plan with my communications provider determines whether any extra charges are incurred by MU Alert messages delivered to my phone.  Marshall University will not be responsible for any charges incurred by subscription to the MU Alert system.  The contact information I provide will only be used for the MU Alert system and will not be shared for any commerical purposes.  Subscribers are responsible for periodically reviewing and maintaining their contact information for accuracy.</div>

				<div class="row alert alert-info">You may opt out of this system at any time by returning to these enrollment pages and deleting your contact information.</div>
			</div>
		</div>
		<div class="form-actions">
            <input type="submit" class="btn btn-primary" value="Save" />
            <button class="btn">Cancel</button>
          </div>
</form>
</cfoutput>

<script type="text/javascript">
	$().ready(function(){
		$("#frmAlert").validate();
	});
</script>
