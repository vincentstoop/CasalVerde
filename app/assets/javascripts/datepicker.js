/* global $ jQuery */


function call_takend_dates() {
    $.ajax({
            type: 'GET',
            url: '/bookings/taken'
        })
        .done(function(data) {
            var array = data.dates;
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd',
                minDate: 0,
                beforeShowDay: function(date) {
                    var string = jQuery.datepicker.formatDate('yy-mm-dd', date);
                    return [array.indexOf(string) == -1];
                }
            });
            init_pickers();
        })

        .fail(function() {
            $.datepicker.setDefaults({
                minDate: 0,
                dateFormat: 'yy-mm-dd'
            });
            init_pickers();
        });
}

function init_pickers() {
    $('#checkin').datepicker();
    $('#checkout').datepicker();
    $('#booking_check_in').datepicker();
    $('#booking_check_out').datepicker();
    $('#admin-calendar').datepicker({
      numberOfMonths: 3,
      showButtonPanel: true
    });
}

$(document).on('turbolinks:load', function() {
    call_takend_dates();
});
