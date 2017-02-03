/*global $*/

$(document).on('turbolinks:load', function() {
    $('.carousel').slick({
        dots: true,
        infinite: true,
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
        if ($('#ui-datepicker-div').css('display') == 'none') {
            $('.bookingmodal').removeClass('clicked');
        }
    });

    $('.bookingmodal').bind('click', function(e) {
        e.stopPropagation();
    });

    $('#readmore').bind('click', function(e) {
        e.preventDefault();
        if ($('#home-text-wrapper').hasClass('home-text-hidden')) {
            setTimeout(function() {
                $('#readmore').text('< show less');
            }, 200);
            $('#home-text-wrapper').removeClass('home-text-hidden');
        } else {
            setTimeout(function() {
                $('#readmore').text('read more >');
            }, 200);
            $('#home-text-wrapper').addClass('home-text-hidden');

        }
    });
});
