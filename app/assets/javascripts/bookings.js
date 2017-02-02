$(document).on('turbolinks:load', function() {
    $('#new_booking').bind('submit', submitBooking);
});

function submitBooking(event) {
    event.preventDefault();
    cleanUpErrors(this);
    var startDate = $("#booking_check_in").val();
    var endDate = $("#booking_check_out").val();
    var firstName = $("#booking_first_name").val();
    var lastName = $("#booking_last_name").val();
    var title = $("#booking_title").val();
    var phone = $("#booking_phone").val();
    var email = $("#booking_email").val();
    var streetName = $("#booking_street_name").val();
    var streetNumber = $("#booking_street_number").val();
    var city = $("#booking_city").val();
    var zipCode = $("#booking_zip_code").val();
    var people = $("#booking_people").val();
    createBooking(startDate, endDate, firstName, lastName, title, phone, email,
        streetName, streetNumber, city, zipCode, people);
}

function createBooking(startDate, endDate, firstName, lastName, title, phone, email,
    streetName, streetNumber, city, zipCode, people) {
    var newBooking = {
        check_in: startDate,
        check_out: endDate,
        first_name: firstName,
        last_name: lastName,
        title: title,
        phone: phone,
        email: email,
        street_name: streetName,
        street_number: streetNumber,
        city: city,
        zip_code: zipCode,
        people: people
    }

    $.ajax({
            type: "POST",
            url: "/bookings/",
            data: JSON.stringify({
                booking: newBooking
            }),
            contentType: "application/json",
            dataType: "json"
        })
        .fail(function(errors) {
            showErrors(errors);
        })

    function showErrors(errors) {
        var errorObject = errors.responseJSON.errors;
        $.each(errorObject, function(key, value) {
            var errorMessages = $('<ul></ul>')
                .addClass('errorList');
            var errorMessage = $('<li></li>')
                .html(capitalizeFirstLetter(key).split('_').join(' ') + '  ' + value);
            errorMessages.append(errorMessage);
            $(errorMessages).insertAfter('#booking_' + key);
            $('#booking_' + key).addClass('validationErrorField');
        });
    }
}

function capitalizeFirstLetter(str) {
    return str.replace(str.charAt(0), str.charAt(0).toUpperCase());
};

function cleanUpErrors() {
  $('ul.errorList').remove();
  $('.validationErrorField').removeClass('validationErrorField');
}
