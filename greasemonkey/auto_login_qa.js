// ==UserScript==
// @name     auto_login_qa.js
// @version  1
// @grant    none
// @require       http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js
// ==/UserScript==

$(document).ready(function() {

  if (window.location.host.endsWith('qa.finao.com.au')) {
    if (window.location.pathname == '/contact_us') {
      window.location.pathname = '/auth/login';
    }
    if (window.location.pathname == '/auth/login') {
      $('input#email').val('dean@finao.com.au');
      $('button[type="submit"]').click();
    }
  }

});
