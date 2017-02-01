// Showing form partial
$('#show-partial').click(function(){
    $('#partial').toggle();
});

// Updating reviews with ajax
function createReview(name, stars, review) {
  var newReview = {name: name, stars: stars, review: review};
    $.ajax({
      type: "POST",
      url: "/reviews.json",
      data: JSON.stringify({
          review: newReview
      }),
      contentType: "application/json",
      dataType: "json"})
    .done(function(data) {
      var allStars = ""

      for (i = 0; i < stars; i++) {
        allStars += '<img src="http://i.imgur.com/nbis287.png" alt="" height="10px" width="10px"> '
      }
      var reviewList = $('<ul></ul>')
        .append($('<li>').append("<strong>Review by</strong>: " + name))
        .append($('<li>').append("<strong>Stars: </strong>" + allStars))
        .append($('<li>').append("<strong>Review: </strong>" + review));

      $("#reviews").append(reviewList).append("<hr>");
    })


    .fail(function(error) {
      console.log(error);

      if(error.responseJSON.name != undefined) {
        error_message = error.responseJSON.name[0];
        showError("name", error_message)
      }
       if (error.responseJSON.stars != undefined) {
         error_message = error.responseJSON.stars[0];
         showError("stars", error_message)
       }
       if (error.responseJSON.review != undefined) {
         error_message = error.responseJSON.review[0];
         showError("review", error_message)
       }
    });
}

function showError(attr, error_message) {
  var errorHelpBlock = $('<span class="help-block"></span>')
    .attr('id', 'error_message')
    .text(" Please enter " + attr + ". It " + error_message + ".");

  switch(attr) {
    case "name":
      $("#name_label").append(errorHelpBlock);
      $("#review_name").addClass("validationErrorField")
      break;
    case "stars":
      $("#stars_label").append(errorHelpBlock);
      $("#review_stars").addClass("validationErrorField")
      break;
    case "review":
      $("#review_label").append(errorHelpBlock);
      $("#review_review").addClass("validationErrorField")
      break;
  }
}

function resetErrors(attr) {
  switch(attr) {
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
  $("#error_message").remove();
  createReview($("#review_name").val(), $("#review_stars").val(), $("#review_review").val());
  $("#review_name").val(null);
  $("#review_stars").val(5);
  $("#review_review").val(null);
}

$("form").bind('submit', submitReview);
$("#review_name").click(function(){
  resetErrors("name");
});
$("#review_stars").click(function(){
  resetErrors("stars");
});
$("#review_review").click(function(){
  resetErrors("review");
});
