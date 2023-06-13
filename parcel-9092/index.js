import ReactDOM from 'react-dom';

navigator.serviceWorker.register(new URL('./sw.js', import.meta.url), { type: 'module' });
