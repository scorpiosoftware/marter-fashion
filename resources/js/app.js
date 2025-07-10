import './bootstrap.js';
import './brand.js';
import './cart.js';
import './float.js';
// import './general.js';
import './main.js';
import './slider.js';

import './toast.js';

import './wow.js';
import './imageCompressor.js';
import Swal from 'sweetalert2';
window.Swal = Swal;
import Alpine from 'alpinejs';
window.$ = window.jQuery = $;
window.Alpine = Alpine;

Alpine.start();
