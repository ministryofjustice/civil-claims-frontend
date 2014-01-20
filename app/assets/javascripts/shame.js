/*jslint browser: true, evil: false, plusplus: true, white: true, indent: 2 */
/*global moj, $ */

moj.Modules.shame = (function() {
  "use strict";

  var init,
      cacheEls,
      bindEvents,
      duffLinks;

  init = function() {
    cacheEls();
    bindEvents();

    duffLinks();
  };

  cacheEls = function() {
    
  };

  bindEvents = function() {
    
  };

  duffLinks = function() {
    $( 'a[href="#"]' ).on( 'click', function( e ) {
      e.preventDefault();
      this.blur();
    } );
  };

  // public

  return {
    init: init
  };
}());
