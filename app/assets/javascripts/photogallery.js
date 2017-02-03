/*global $*/

var Instagram = {
    config: {
        access_token: '3223134563.588b0fe.851ad0bd859c452b814dcfabbd56df15'
    },
    SELF_URL: 'https://api.instagram.com/v1/users/self/media/recent/?access_token=',


    init: function(opt) {
        opt = opt || {};
        this.config.client_id = opt.client_id;
    },

    popular: function(callback) {
        var endpoint = this.SELF_URL + this.config.access_token;
        this.getJSON(endpoint, callback);
    },
    getJSON: function(url, callback) {
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'jsonp',
            success: function(response) {
                if (typeof callback === 'function') callback(response);
            }
        });
    }
};


function imgHelper(url, index) {
    var link = $('<a></a>')
        .attr('href', index)
        .addClass('ig-image');
    var image = $('<img />')
        .attr('src', url);
    link.append(image);
    return link;
}
