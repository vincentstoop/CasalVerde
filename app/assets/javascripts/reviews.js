/*global $*/
// Showing form partial


// Updating reviews with ajax
function createReview(name, stars, review) {
    var newReview = {
        name: name,
        stars: stars,
        review: review
    };
    $.ajax({
            type: "POST",
            url: "/reviews.json",
            data: JSON.stringify({
                review: newReview
            }),
            contentType: "application/json",
            dataType: "json"
        })
        .done(function() {
            var allStars = "";

            for (var i = 0; i < stars; i++) {
                allStars += '<img src="assets/full_star.svg" alt="full star" class="star"> ';
            }
            for (var z = 0; i < (stars - 5); z++) {
                allStars += '<img src="assets/empty_star.svg" alt="full star" class="star"> ';
            }

            var reviewitem = $('<div>').attr('class', 'reviews-all-item')
                .append($('<div>').attr('class', 'reviews-all-header').append("<p>" + name + "</p>"))
                .append($('<div>').attr('class', 'reviews-all-body')
                    .append("<p><strong>Stars:</strong>" + allStars + "</p>")
                    .append("<p>" + review + "</p>"));

            $('#reviews-all-wrapper').append(reviewitem);
            $("#review_name").val('');
            $("#review_stars").val(5);
            $("#review_review").val('');
        })


        .fail(function(error) {

            if (error.responseJSON.name != undefined) {
                var error_message = error.responseJSON.name[0];
                showError("name", error_message);
            }
            if (error.responseJSON.stars != undefined) {
                var error_message2 = error.responseJSON.stars[0];
                showError("stars", error_message2);
            }
            if (error.responseJSON.review != undefined) {
                var error_message3 = error.responseJSON.review[0];
                showError("review", error_message3);
            }
        });
}

function showError(attr, error_message) {
    var errorHelpBlock = $('<p>')
        .attr('class', 'error-message')
        .text(" Please enter " + attr + ". It " + error_message + ".");

    switch (attr) {
        case "name":
            $("#name_label").parent().append(errorHelpBlock);
            break;
        case "stars":
            $("#stars_label").parent().append(errorHelpBlock);
            break;
        case "review":
            $("#review_label").parent().append(errorHelpBlock);
            break;
    }
}

function resetErrors(attr) {
    switch (attr) {
        case "name":
            $("#review_name").removeClass("validationErrorField");
            break;
        case "stars":
            $("#review_stars").removeClass("validationErrorField");
            break;
        case "review":
            $("#review_review").removeClass("validationErrorField");
            break;
    }
}

function submitReview(event) {
    event.preventDefault();
    $(".error-message").remove();
    createReview($("#review_name").val(), $("#review_stars").val(), $("#review_review").val());
}

$(document).on('turbolinks:load', function() {
    $("#new_review").bind('submit', submitReview);
    $("#review_name").click(function() {
        resetErrors("name");
    });
    $("#review_stars").click(function() {
        resetErrors("stars");
    });
    $("#review_review").click(function() {
        resetErrors("review");
    });
    $('#show-partial').click(function() {
        $('#partial').toggle();
    });

});
