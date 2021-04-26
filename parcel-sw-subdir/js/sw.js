const cachedEntries = [
    {
        url: '../',
        revision: '2'
    }
];


self.addEventListener('install', function(event) {
    event.waitUntil(Promise.all(cachedEntries.map(entry =>
        // We will cache each file in a separate cache denoted by its revision.
        caches.open(entry.revision).then(cache => cache.add(entry.url))
    )));
});


self.addEventListener('activate', function(event) {
});


self.addEventListener('fetch', function(event) {
    console.log(event);
    event.respondWith(caches.match(event.request).then(function(resp) {
        console.log(resp);
        return resp || fetch(event.request);
    }));
});
