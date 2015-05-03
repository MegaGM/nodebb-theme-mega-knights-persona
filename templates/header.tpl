<!DOCTYPE html>
<html>
<head>
	<title>{browserTitle}</title>
	<!-- BEGIN metaTags -->
	{function.buildMetaTag}
	<!-- END metaTags -->
	<link rel="stylesheet" type="text/css" href="{relative_path}/stylesheet.css?{css-buster}" />
	<!-- IF bootswatchCSS --><link href="{bootswatchCSS}" rel="stylesheet" media="screen"><!-- ENDIF bootswatchCSS -->
	<!-- BEGIN linkTags -->
	<link<!-- IF linkTags.link --> link="{linkTags.link}"<!-- ENDIF linkTags.link --><!-- IF linkTags.rel --> rel="{linkTags.rel}"<!-- ENDIF linkTags.rel --><!-- IF linkTags.type --> type="{linkTags.type}"<!-- ENDIF linkTags.type --><!-- IF linkTags.href --> href="{linkTags.href}"<!-- ENDIF linkTags.href --> />
	<!-- END linkTags -->
	<!-- IF useCustomCSS -->
	<style type="text/css">{customCSS}</style>
	<!-- ENDIF useCustomCSS -->

	<!--[if lt IE 9]>
	<script src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/2.3.0/es5-shim.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
	<script>__lt_ie_9__ = 1;</script>
	<![endif]-->

	<script>
		var RELATIVE_PATH = "{relative_path}";
		var config = JSON.parse('{configJSON}');
		var app = {
			template: "{template.name}"
		};
		app.user = JSON.parse('{userJSON}');
	</script>
	<script src="{relative_path}/nodebb.min.js?{script-buster}"></script>
	<!-- IMPORT partials/requirejs-config.tpl -->

	<!-- IF useCustomJS -->
	{customJS}
	<!-- ENDIF useCustomJS -->
</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top header" role="navigation" id="header-menu">
		<div class="container">
			<!-- IMPORT partials/menu.tpl -->
		</div>
	</nav>





	<div class="container" id="main">

		<table class="table">
			<tbody>
				<tr>
					<td class="hidden-xs" style="width: 280px;">


						<script type='text/javascript' src='//vk.com/js/api/openapi.js?116'></script>

						<!-- VK Widget -->
						<div id='vk_groups'></div>
						<script type='text/javascript'>
						VK.Widgets.Group('vk_groups', {mode: 0, width: '280', height: '250', color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 26322514);
						</script>

						<div class="panel panel-default no-gutter" id="mega-teamspeak-container" style="width: 280px;">

							<p style="padding-top: 10px; text-align: center;">
							<a href="http://www.teamspeak.com/?page=downloads" alt="Скачать клиент TeamSpeak" title="Скачать клиент TeamSpeak" target="_blank">
								<img src="/plugins/nodebb-theme-mega-knights-persona/images/teamspeak3_logo.png" alt="">
							</a>

							<br />
							Адрес сервера: <a href="ts3server://Knights.pro" target="_blank" alt="Адрес для ввода в программу TeamSpeak 3" title="Адрес для ввода в программу TeamSpeak 3">Knights.pro</a></p>

							<div id="mega-teamspeak" style="padding: 0px 5px 10px 3px">
								<p style="padding-top: 50px; margin-bottom: 150px; text-align: center;">
								<a href="#" id="mega-teamspeak-spinner" class="active" title="" data-original-title="Connect to Knights.pro TeamSpeak server"><i class="fa fa-spinner fa-spin"></i></a>
								</p>

							</div>
						</div>
					</td>

					<td>
						<div id="content">
							<!-- IMPORT partials/noscript/warning.tpl -->