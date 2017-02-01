/*global $*/

$(document).on('turbolinks:load', function() {
    $('.carousel').slick({
        dots: true,
        infinite: true,
        lazyLoad: 'progressive',
        cssEase: 'linear'
    });

    $('#bookingtrigger').bind('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        if ($('.bookingmodal').hasClass('clicked')) {
            $('.bookingmodal').removeClass('clicked');
        } else {
            $('.bookingmodal').addClass('clicked');
        }
    });

    $('body').click(function() {
        $('.bookingmodal').removeClass('clicked');
    });

    $('.bookingmodal').bind('click', function(e) {
        e.stopPropagation();
    });

    $('#readmore').bind('click', function(e) {
        e.preventDefault();
        if ($('#home-text-wrapper').hasClass('home-text-hidden')) {
            $('#home-text-wrapper').removeClass('home-text-hidden');
            setTimeout(function() {
                $('#readmore').text('< show less');
            }, 1000);
        } else {
            $('#home-text-wrapper').addClass('home-text-hidden');
            setTimeout(function() {
                $('#readmore').text('read more >');
            }, 1000);

        }
    });
});
