// ==UserScript==
// @name     auto_login_preprod.js
// @version  1
// @grant    none
// @require       http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js
// ==/UserScript==

var preprod_hosts = [
  'preprod.finaoprime.com',
  'preprod.baishieldportal.com',
  'preprod.ctsonline.com.au',
  'preprod.linbeckonline.com.au',
  'preprod.tfnswdataportal.com.au',
  'preprod.swconnect.com.au',
  'preprod.swdelivery.com.au',
];

$(document).ready(function() {

  if (preprod_hosts.includes(window.location.host)) {
    if (window.location.pathname == '/contact_us') {
      window.location.pathname = '/auth/login';
    }
    if (window.location.pathname == '/auth/login') {
      $('input#email').val('dean@finao.com.au');
      $('button[type="submit"]').click();
    }
  }

});
