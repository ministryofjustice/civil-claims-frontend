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
      setupAddressBoxes,
      manualAddressFields,
      getAddresses,
      addressDropdownFromPostcode,
      concatAddress,

      //vars
      multiples,
      addressBoxes
      ;

  init = function() {
    cacheEls();
    bindEvents();

    multiplePanels();
    setupAddressBoxes();
  };

  cacheEls = function() {
    multiples = $( '.has-multiple' );
    addressBoxes = $( '.js-address' );
  };

  bindEvents = function() {
    $( document ).on( 'change', '.multiplePanelSelector', function() {
      var $this = $( this );
      showMultiples( $this.closest( '.has-multiple' ), $this.val() );
    } );

    $( document ).on( 'click', '.js-manual-address', function( e ) {
      e.preventDefault();
      manualAddressFields( $( e.target ) );
    } );

    $( document ).on( 'click', '.js-find-address', function( e ) {
      e.preventDefault();
      addressDropdownFromPostcode( $( e.target ) );
    } );

    $( document ).on( 'change', '.addressDropdown', function( e ) {
      // TODO: write this
    } );
  };



  multiplePanels = function() {
    var x,
        y,
        $panel,
        childItemClass,
        childItems,
        childItemsArray = [],
        source,
        template,
        context;

    if( multiples.length > 0 ) {
      source = $( '#multiple-selector' ).html();
      template = Handlebars.compile( source );

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

  setupAddressBoxes = function() {
    var x,
        $this,
        $postcode,
        source,
        template;

    for( x = 0; x < addressBoxes.length; x++ ) {
      $this = $( addressBoxes[ x ] );
      $postcode = $this.find( 'input.smalltext' );
      $this.find( '.street, .town' ).hide();

      source = $( '#postcode-button' ).html();
      template = Handlebars.compile( source );
      $postcode.addClass( 'has-button' ).after( template( {} ) );

      source = $( '#manual-postcode-link' ).html();
      template = Handlebars.compile( source );
      $postcode.closest( '.row' ).after( template( {} ) );
    }
  };

  manualAddressFields = function( $el ) {
    var $panel = $el.closest( '.sub-panel' ),
        $pcRow = $el.closest( '.row' ).prev();

    $panel.find( '.row.street, .row.town' ).show();
    $pcRow.addClass( 'rel' );
    // $pcRow.addClass( 'highlight' ).find( 'input[type="text"]' ).val( '' );
    $el.closest( '.row' ).remove();

    // moj.Modules.effects.highlights();
  };

  addressDropdownFromPostcode = function( $el ) {
    var x,
        addressArray = [],
        source,
        template,
        context;

    getAddresses( function( data ) {
      source = $( '#address-dropdown' ).html();
      template = Handlebars.compile( source );
      for( x = 0; x < data.length; x++ ) {
        addressArray[ addressArray.length ] = {
          id:       data[ x ].id,
          address:  concatAddress(data[ x ].address)
        };
      }
      $el.closest( '.row' ).after( template( {
        addresses: addressArray
      } ) );
    } );
  };

  getAddresses = function( callback ) {
    $.getJSON( '/data/test-postcode-data.json', function( data ) {
      callback( data );
    } );
  };

  concatAddress = function( address ) {
    var x,
        arr = [];

    for( x in address ) {
      if( address[ x ] !== '' ) {
        arr[ arr.length ] = address[ x ];
      }
    }

    return arr.join( ', ' );
  };

  // public

  return {
    init: init
  };

}());
