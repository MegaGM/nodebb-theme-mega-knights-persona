
						</div><!--END content -->
					</td>

					<td class="hidden-xs" style="width: 280px;">

						<!-- START VK Widget -->
						<!--script type='text/javascript' src='//vk.com/js/api/openapi.js'></script>

						<div id='vk_groups'></div>
						<script type='text/javascript'>
						VK.Widgets.Group('vk_groups', {mode: 0, width: '280', height: '250', color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 95547226);
						</script-->
						<!-- END VK Widget -->

						<div class="panel panel-default no-gutter" id="mega-teamspeak-container">

							<p style="padding-top: 25px; text-align: center;">
							<a href="http://www.teamspeak.com/?page=downloads" alt="Скачать клиент TeamSpeak" title="Скачать клиент TeamSpeak" target="_blank">
								<img src="/plugins/nodebb-theme-mega-knights-persona/images/teamspeak3_logo.png" alt="">
							</a>

							<br />
							<br />
							Адрес сервера: <a href="ts3server://Knights.pro" target="_blank" alt="Адрес для ввода в программу TeamSpeak 3" title="Адрес для ввода в программу TeamSpeak 3">Knights.pro</a></p>

							<div id="mega-teamspeak" style="padding: 0px 5px 10px 3px">
								<p style="padding-top: 50px; margin-bottom: 150px; text-align: center;">
								<a href="#" id="mega-teamspeak-spinner" class="active" title="" data-original-title="Connect to Knights.pro TeamSpeak server"><i class="fa fa-spinner fa-spin"></i></a>
								</p>

							</div>
						</div>
					</td>

				</tr>
			</tbody>
		</table>
	</div><!--END main-->

	<div class="hide tpl-500">
	<!-- IMPORT 500.tpl -->
	</div>
	<!-- IMPORT partials/modals/upload_picture_modal.tpl -->

	<div class="topic-search hidden">
		<div class="btn-group">
			<button type="button" class="btn btn-default count"></button>
			<button type="button" class="btn btn-default prev"><i class="fa fa-fw fa-angle-up"></i></button>
			<button type="button" class="btn btn-default next"><i class="fa fa-fw fa-angle-down"></i></button>
		</div>
	</div>
	<div class="alert-window alert-left-top"></div>
	<div class="alert-window alert-left-bottom"></div>
	<div class="alert-window alert-right-top"></div>
	<div class="alert-window alert-right-bottom"></div>

	<script>
		require(['forum/footer']);
	</script>
</body>
</html>
