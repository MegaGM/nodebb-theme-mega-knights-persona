
<!-- IMPORT partials/account_menu.tpl -->

<div class="account">
	<div class="row">
		<div class="col-md-5">
			<div class="account-picture-block text-center">
				<img id="user-current-picture" class="user-profile-picture" src="{picture}" /><br /><br />
				<a id="changePictureBtn" href="#" class="btn btn-default">[[user:change_picture]]</a>
				<br/><br/>

				<!-- IF !username:disableEdit -->
				<a href="{config.relative_path}/user/{userslug}/edit/username" class="btn btn-default">[[user:change_username]]</a><br/><br/>
				<!-- ENDIF !username:disableEdit -->

				<a href="{config.relative_path}/user/{userslug}/edit/email" class="btn btn-default">[[user:change_email]]</a><br/><br/>

				<a href="{config.relative_path}/user/{userslug}/edit/password" class="btn btn-default">[[user:change_password]]</a><br/><br/>

				<!-- IF config.requireEmailConfirmation -->
				<!-- IF email -->
				<!-- IF isSelf -->
				<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF email -->
				<!-- ENDIF config.requireEmailConfirmation -->

				<!-- IF config.allowAccountDelete -->
				<!-- IF isSelf -->
				<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF config.allowAccountDelete -->

			</div>
		</div>

		<div class="col-md-7">
			
			
			
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
			
			<div>
				<form class='form-horizontal'>

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

		<div class="col-md-5">
			<!-- IF sso.length -->
			<label class="control-label">[[user:sso.title]]</label>
			<div class="list-group">
				<!-- BEGIN sso -->
				<a class="list-group-item" href="{../url}" target="<!-- IF ../associated -->_blank<!-- ELSE -->_top<!-- ENDIF ../associated -->">
					<!-- IF ../icon --><i class="fa {../icon}"></i><!-- ENDIF ../icon -->
					<!-- IF ../associated -->[[user:sso.associated]]<!-- ELSE -->[[user:sso.not-associated]]<!-- ENDIF ../associated -->
					{../name}
				</a>
				<!-- END sso -->
			</div>
			<!-- ENDIF sso.length -->
		</div>
	</div>
</div>

