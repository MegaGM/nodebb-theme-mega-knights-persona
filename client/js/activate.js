$(document).on('ready', function (e) {

	require(['../../plugins/nodebb-theme-mega-knights-persona/static/vendor/perfect-scrollbar', '../../plugins/nodebb-plugin-mega-teamspeak/js/vendor/js.cookie'], function (pScroll, Cookies) {

		pScroll.initialize(document.getElementById('sidebar-area'));

		console.log(typeof Cookies.get('sidebar-is-open'));

		if ('true' === Cookies.get('sidebar-is-open') && 'lg' === utils.findBootstrapEnvironment()) {
			openSidebar();
		}

		function closeSidebar() {
			$('#sidebar-area ').animate({
				left: -550
			}, 300);
			Cookies.set('sidebar-is-open', false);
		}

		function openSidebar() {
			$('#sidebar-area').show().animate({
				left: 0
			}, {
				duration: 300,
				complete: function (event) {
					pScroll.update(document.getElementById('sidebar-area'));
					Cookies.set('sidebar-is-open', true);
				}
			});
		}

		$(document).on('click', '.sidebar-area-close-button', closeSidebar);

		$(document).on('click', '.sidebar-area-open-button', openSidebar);

	});

});
