/*jslint browser: true, evil: false, plusplus: true, white: true, indent: 2 */
/*global moj, $, Handlebars */

moj.Modules.forms = (function() {
  "use strict";

  var //functions
      init,
      cacheEls,
      bindEvents,
      multiplePanels,
      showMultiples,

      //vars
      multiples;

  init = function() {
    cacheEls();
    bindEvents();

    multiplePanels();
  };

  cacheEls = function() {
    multiples = $( '.has-multiple' );
  };

  bindEvents = function() {
    $( document ).on( 'change', '.multiplePanelSelector', function() {
      var $this = $( this );
      showMultiples( $this.closest( '.has-multiple' ), $this.val() );
    } );
  };



  multiplePanels = function() {
    var x,
        y,
        $panel,
        childItemClass,
        childItems,
        childItemsArray = [],
        source = $( '#multiple-selector' ).html(),
        template = Handlebars.compile( source ),
        context;

    for( x = 0; x < multiples.length; x++ ) {
      $panel = $( multiples[ x ] );
      childItemClass = $panel.data( 'multiple' );
      childItems = $panel.find( '.' + childItemClass );

      showMultiples( $panel, 1 );

      for( y = 0; y < childItems.length; y++ ) {
        childItemsArray[ childItemsArray.length ] = {
          val:    y + 1,
          text:   ( y === 0 ? $panel.data( 'single' ) : $panel.data( 'plural' ) )
        };
      }

      context = {
        id:       $panel.attr( 'id' ),
        caption:  $panel.data( 'caption' ),
        items:    childItemsArray
      };

      $panel.prepend( template( context ) );
    }
  };

  showMultiples = function( $panel, shownum ) {
    var x,
        show = shownum || 1,
        childItemClass,
        childItems;

    childItemClass = $panel.data( 'multiple' );
    childItems = $panel.find( '.' + childItemClass );
    
    for( x = 0; x < childItems.length; x++ ) {
      if( ( x + 1 ) > show ) {
        $( childItems[ x ] ).hide();
        $( childItems[ x ] ).find( 'input[type=text], textarea' ).val( '' );

        $( childItems[ x ] ).prev( '.divider' ).hide();
      } else {
        $( childItems[ x ] ).show();
        $( childItems[ x ] ).prev( '.divider' ).show();
      }
    }
  };

  // public

  return {
    init: init
  };

}());
