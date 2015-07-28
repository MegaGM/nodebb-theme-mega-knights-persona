
<!-- IMPORT partials/account_menu.tpl -->

<div class="account">
	<div class="row">
		<div class="col-md-12" style="text-align: center; margin-bottom:20px;">
			<div class="account-picture-block text-center">
				<img id="user-current-picture" class="user-profile-picture" src="{picture}" /><br /><br />
				<a id="changePictureBtn" href="#" class="btn btn-primary">[[user:change_picture]]</a>
				<br/><br/>
				<!-- IF config.allowAccountDelete -->
				<!-- IF isSelf -->
				<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF config.allowAccountDelete -->
				<!-- IF config.requireEmailConfirmation -->
				<!-- IF email -->
				<!-- IF isSelf -->
				<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a>
				<!-- ENDIF isSelf -->
				<!-- ENDIF email -->
				<!-- ENDIF config.requireEmailConfirmation -->
			</div>
		</div>

		<div class="col-md-6">
			<div>
				<form class='form-horizontal'>

					<div class="control-group">
						<label class="control-label" for="inputUsername">[[user:username]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputUsername" placeholder="[[user:username]]" value="{username}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputEmail">[[user:email]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputEmail" placeholder="[[user:email]]" value="{email}">
						</div>

					</div>

					<div class="control-group">
						<label class="control-label" for="inputFullname">[[user:fullname]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputFullname" placeholder="[[user:fullname]]" value="{fullname}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputWebsite">[[user:website]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputWebsite" placeholder="http://..." value="{website}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputLocation">[[user:location]]</label>
						<div class="controls">
							<input class="form-control" type="text" id="inputLocation" placeholder="[[user:location]]" value="{location}">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputBirthday">[[user:birthday]]</label>
						<div class="controls">
							<input class="form-control" id="inputBirthday" value="{birthday}" placeholder="yyyy-mm-dd">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputAboutMe">[[user:aboutme]]</label> <small><label id="aboutMeCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputAboutMe" rows="5">{aboutme}</textarea>
						</div>
					</div>
					<!-- IF !disableSignatures -->
					<div class="control-group">
						<label class="control-label" for="inputSignature">[[user:signature]]</label> <small><label id="signatureCharCountLeft"></label></small>
						<div class="controls">
							<textarea class="form-control" id="inputSignature" rows="5">{signature}</textarea>
						</div>
					</div>
					<!-- ENDIF !disableSignatures -->

					<input type="hidden" id="inputUID" value="{uid}"><br />

					<div class="form-actions">
						<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
					</div>

				</form>
			</div>

			<hr class="visible-xs visible-sm"/>
		</div>

		<div class="col-md-6">
			<div style="vertical-align:top;">
				<form class='form-horizontal'>
					<!-- IF isSelf -->
					<div class="control-group">
						<label class="control-label" for="inputCurrentPassword">[[user:current_password]]</label>
						<div class="controls">
							<input autocomplete="off" class="form-control" type="password" id="inputCurrentPassword" placeholder="[[user:current_password]]" value=""<!-- IF !hasPassword --> disabled<!-- ENDIF !hasPassword-->>
						</div>
					</div>
					<!-- ENDIF isSelf -->

					<div class="control-group">
						<label class="control-label" for="inputNewPassword">[[user:password]]</label>
						<div class="input-group">
							<input class="form-control" type="password" id="inputNewPassword" placeholder="[[user:password]]" value="">
							<span class="input-group-addon">
								<span id="password-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="inputNewPasswordAgain">[[user:confirm_password]]</label>
						<div class="input-group">
							<input class="form-control" type="password" id="inputNewPasswordAgain" placeholder="[[user:confirm_password]]" value="">
							<span class="input-group-addon">
								<span id="password-confirm-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
					</div>
					<br/>
					<div class="form-actions">
						<a id="changePasswordBtn" href="#" class="btn btn-primary"><i class="hide fa fa-spinner fa-spin"></i> [[user:change_password]]</a>
					</div>

				</form>



				<!-- add -->
				<br />

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Интегрированные аккаунты</h3>
					</div>
					<div id="mega-teamspeak-bounder-cldbids" style="margin-top: -1px;">
						<div class="panel-body">
							Нет подтвержденных аккаунтов
						</div>
					</div>
				</div>
				<a id="mega-teamspeak-bounder-show-btn" href="#" class="btn btn-primary">Добавить аккаунт Teamspeak</a>

				<br/>

				<form class='form-horizontal no-submit' style="display: none">

					<div class="control-group">
						<label class="control-label" for="mega-teamspeak-bounder-input-nickname">Укажите ник</label>
						<div class="input-group">
							<input class="form-control" type="text" id="mega-teamspeak-bounder-input-nickname" placeholder="Скопируйте сюда Ваш ник из Teamspeak" value="" autocomplete="off">
							<span class="input-group-addon">
							<span id="mega-teamspeak-bounder-input-nickname-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
					</div>

					<br/>
					<div class="form-actions">
						<a id="mega-teamspeak-bounder-nickname-btn" href="#" class="btn btn-primary">Получить пин-код</a>
					</div>

				</form>

				<form class='form-horizontal no-submit' style="display: none">

					<div class="control-group">
						<label class="control-label" for="mega-teamspeak-bounder-input-pincode">Подтвердите, что это Ваш аккаунт</label>
						<div class="input-group">
							<input class="form-control" type="text" id="mega-teamspeak-bounder-input-pincode" placeholder="Введите полученный пин-код" value="" autocomplete="off">
							<span class="input-group-addon">
							<span id="mega-teamspeak-bounder-input-pincode-notify"><i class="fa fa-circle-o"></i></span>
							</span>
						</div>
					</div>

					<br/>
					<div class="form-actions">
						<a id="mega-teamspeak-bounder-pincode-btn" href="#" class="btn btn-primary">Подтвердить</a>
					</div>

				</form>

				<script>
					var successIcon = '<i class="fa fa-check"></i>';
					var standardIcon = '<i class="fa fa-circle-o"></i>';
					var iNickname = $( '#mega-teamspeak-bounder-input-nickname' );
					var iPincode = $( '#mega-teamspeak-bounder-input-pincode' );
					var bNickname = $( '#mega-teamspeak-bounder-nickname-btn' );
					var bPincode = $( '#mega-teamspeak-bounder-pincode-btn' );
					var nNickname = $( '#mega-teamspeak-bounder-input-nickname-notify' );
					var bShowBounder = $( '#mega-teamspeak-bounder-show-btn' );

					$( 'form.no-submit' ).on( 'submit', function ( event ) {
						event.preventDefault( );
					});

					$.get( RELATIVE_PATH + '/mega/teamspeak/bounder/uid/{uid}', {}, function ( data ) {
						if ( data != 'false' ) {
							$( '#mega-teamspeak-bounder-cldbids' ).html( data );
						}
					});

					bShowBounder.on( 'click', function ( event ) {
						event.preventDefault( );
						$( this ).attr( 'disabled', true );
						/*bNickname.closest( '.form-horizontal' ).removeClass( 'hidden' );*/
						bNickname.closest( '.form-horizontal' ).slideDown( 'fast' );

					});
					bNickname.on( 'click', function ( event ) {
						event.preventDefault( );

						var data = { };
						data.nickname = iNickname.val( );

						socket.emit( 'modules.bounder', data, function ( fix, data ) {
							if ( data.err ) return app.alertError( data.err );
							/*app.alert({ type: 'info', message: 'Введите пинкод', timeout: 3000 });*/

							iNickname.attr( 'disabled', true );

							bNickname.closest( '.form-actions' ).addClass( 'hidden' );

							nNickname.html( successIcon )
								.parent( ).removeClass( 'alert-danger' ).addClass( 'alert-success' );

							iPincode.closest( '.form-horizontal' ).slideDown( 'fast' );
						});
					});

					bPincode.on( 'click', function ( event ) {
						event.preventDefault( );

						var data = { };
						data.pincode = iPincode.val( ).trim( );

						socket.emit( 'modules.bounder', data, function ( fix, data ) {
							if ( data.err ) return app.alertError( data.err );
							if ( data.msg ) app.alert({
								type: 'success',
								title: 'Успех',
								message: data.msg,
								clickfn: function ( ) { }
							});

							iNickname.val( '' );
							iPincode.val( '' );

							iNickname.attr( 'disabled', false );

							bNickname.closest( '.form-actions' ).removeClass( 'hidden' );
							bNickname.closest( '.form-horizontal' ).fadeOut( 'slow' );

							nNickname.html( standardIcon )
								.parent( ).removeClass( 'alert-danger alert-success' );

							iPincode.closest( '.form-horizontal' ).fadeOut( 'slow' );
							bShowBounder.attr( 'disabled', false );

							$.get( RELATIVE_PATH + '/mega/teamspeak/bounder/uid/{uid}', {}, function ( data ) {
								if ( data != 'false' ) {
									$( '#mega-teamspeak-bounder-cldbids' ).html( data );
								}
							});

						});
					});
				</script>
				<!-- add -->



			</div>
		</div>
	</div>

	<!-- IMPORT partials/modals/change_picture_modal.tpl -->
	<!-- IMPORT partials/modals/upload_picture_from_url_modal.tpl -->
</div>

<!-- IMPORT partials/variables/account.tpl -->
<!-- IMPORT partials/variables/account/edit.tpl -->