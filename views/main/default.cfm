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
					<input type="text" name="email" id="email1" value="#rc.contact.getPrimaryEmail()#" class="email" />
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
					<input type="text" name="text" id="text" value="#rc.contact.getTextNumber()#" class="phoneUS phone"  />
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
					<input type="text" name="homePhone" id="home" value="#rc.contact.getHomePhone()#" class="phoneUS phone" />
				</div>
				<div class="span5">
					<label for="work">Work Phone</label>
					<input type="text" name="workPhone" id="work" value="#rc.contact.getWorkPhone()#" class="phoneUS phone" />
				</div>
			</div>
			<div class="row offset1">
				<div class="span5">
					<label for="mobile">Mobile Phone</label>
					<input type="text" name="mobilePhone" id="mobile" value="#rc.contact.getMobilePhone()#" class="phoneUS phone" />
				</div>
			</div>			
		</fieldset>

		<div class="form-actions">
            <input type="submit" class="btn btn-primary" value="Save" />
            <button class="btn btn-danger" id="btnUnsubscribe">Unsubscribe</button>
          </div>
</form>

		<div class="modal hide fade" id="agreementModal" tabindex="-1" role="dialog" aria-labelledby="agreementHeader" aria-hidden="true">
			<div class="modal-header">
				<h3 id="agreementHeader">User Agreement</h3>
			</div>
			<div class="modal-body">
				The MU Alert System is powered through Blackboard Connect, a worldwide provider of emergency notification systems.  Enrollment in the MU Alert System is free, voluntary, and is strongly recommended. MU Alert notices will only be sent for emergency notifications and testing and maintenance of the system.   Tests are expected to be conducted once per semester.  I am enrolling in this system for the purpose of receiving emergency alerts delivered by the system.  MU Alerts will be sent to my choice of one or more of the following communication paths: e-mail, voice call, and SMS/text messages.  I understand that my rate plan with my communications provider determines whether any extra charges are incurred by MU Alert messages delivered to my phone.  Marshall University will not be responsible for any charges incurred by subscription to the MU Alert system.  The contact information I provide will only be used for the MU Alert system and will not be shared for any commerical purposes.  Subscribers are responsible for periodically reviewing and maintaining their contact information for accuracy.


				<div class="alert alert-info">You may opt out of this system at any time by returning to these enrollment pages and deleting your contact information.</div>
			</div>
			<div class="modal-footer">
				<a href="##" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Accept</a>
				<a href="##" class="btn btn-danger" id="btnRejectAgreement">Reject</a>
			</div>

		</div>

</cfoutput>





<script type="text/javascript">
	$().ready(function(){

		$('.phone').mask("999-999-9999");


		$('#agreementModal').modal({
			keyboard: false,
			backdrop: 'static'

		});

		$("#btnRejectAgreement").click(function(){
			window.close();
		})


		$("#frmAlert").validate();

		$("#btnUnsubscribe").click(function(){
			if(confirm('Are you sure you wish to be removed from the Marshall University Emergency Alert System?')){
				return false;
			}
		});
	});
</script>
