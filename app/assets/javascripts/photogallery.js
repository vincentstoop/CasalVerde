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

Instagram.init({
    client_id: 'd9a164a2fb55430db9e8091fb3b0e16d',
    access_token: '2a02d690081e4c89ada3d2be2f72b9e4',
});


$( document ).ready(function() {

    Instagram.popular(function( response ) {
        var $instagram = $( '#instagram' );
        for ( var i = 0; i < response.data.length; i++ ) {
            imageUrl = response.data[i].images.low_resolution.url;
            $instagram.append( '<img src="' + imageUrl + '" />' );
        }
    });

});
