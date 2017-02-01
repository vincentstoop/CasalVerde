/*global $*/

$(document).on('turbolinks:load', function() {
    $('.carousel').slick({
        dots: true,
        infinite: true,
        lazyLoad: 'progressive',
        cssEase: 'linear'
    });

    $('.bookingtrigger').click(function () {
        $('.bookingmodal').toggleClass('clicked');
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
