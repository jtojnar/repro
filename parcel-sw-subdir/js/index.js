if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('js/sw.js');
}

document.querySelector('button').onclick = function() {
  const url = new URL('./', location.href);
  console.log(url);
  caches.match(new Request(url)).then((resp) => {
    console.log(resp);
    return resp.text();
  }).then((text) => {
    console.log(text);
  })
}
