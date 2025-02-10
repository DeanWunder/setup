// ==UserScript==
// @name     Unnamed Script 333923
// @version  1
// @grant    none
// @require       http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js
// ==/UserScript==

$(document).ready(function() {

  if (window.location.host.endsWith('.test')) {
    if (window.location.pathname == '/auth/login') {
      $('input#email').val('admin@finao.com.au');
      $('input#password').val('password');
      $('button[type=submit]').click();
    }
  }

});
