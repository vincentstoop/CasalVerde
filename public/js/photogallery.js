window.Instagram = {
    /**
     * Store application settings
     */
    config: {
      access_token: '3223134563.e4be9ab.5af267e110e24c2b947ad31e2c8c86e1'
    },

    SELF_URL: 'https://api.instagram.com/v1/users/self/media/recent/?access_token=',

    init: function( opt ) {
        opt = opt || {};

        this.config.client_id = opt.client_id;
    },

    /**
     * Get a list of popular media.
     */
    popular: function( callback ) {
        var endpoint = this.SELF_URL + this.config.access_token;
        this.getJSON( endpoint, callback );
    },

    getJSON: function( url, callback ) {
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'jsonp',
            success: function( response ) {
                if ( typeof callback === 'function' ) callback( response );
            }
        });
    }
};

$( document ).on('turbolinks:load', function() {

    Instagram.popular(function( response ) {
        var instagram = $( '#instagram' );
        for ( var i = 0; i < response.data.length; i++ ) {
            imageUrl = response.data[i].images.low_resolution.url;
            instagram.append( imgHelper(imageUrl, response.data[i].images.standard_resolution.url) );
        }
        // $('img').each(function(index) {
        //   $(index).bind('click', alerrt);
        // });
    });



    // var clickableImgs = $('img.ig-image');
    // for ( var i = 0; i < clickableImgs.length; i++) {
    //   clickableImgs[i].bind('click');
    // }

  });

function imgHelper(url, index) {
  var link = $('<a></a>')
  .attr('href', index)
  .addClass('ig-image')
  .magnificPopup({type:'image'});
  var image = $('<img />')
  .attr('src', url)
  link.append(image);
  return link;
}
