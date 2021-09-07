self.addEventListener('push', event => {
	console.log('[Service Worker] Push Received.');
	console.log(`[Service Worker] Push had this data: "${event.data.text()}"`);

	const data = event.data.json();
	switch (data.type) {
		case "notification":
			event.waitUntil(self.registration.showNotification(data.title, data.options));
			break;
		case "notification-sound":
			self.registration.showNotification(data.title, data.options);
			var audio = new Audio(data.sound);
			event.waitUntil(audio.play());
			break;
		case "sound":
			var audio = new Audio(data.sound);
			event.waitUntil(audio.play());
			break;
	}

});
