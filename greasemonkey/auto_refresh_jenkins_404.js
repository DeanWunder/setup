// ==UserScript==
// @name     auto_refresh_jenkins_404
// @version  1
// @grant    none
// @require       http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.js
// ==/UserScript==

$(document).ready(function() {

  if (window.location.hostname.endsWith('jenkins.finao.com.au')) {
    if (document.title.includes("Not Found")) {
      window.setTimeout(function() {
        window.location.reload();
      }, 10000);
    }
  }

});
