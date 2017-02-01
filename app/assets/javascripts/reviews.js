// Showing form partial
$('#show-partial').click(function(){
    $('#partial').toggle();
});

// Updating reviews with ajax
function createReview(name, stars, review) {
  console.log("Create review is called!");
  var allStars = ""

  for (i = 0; i < stars; i++) {
    allStars += '<img src="http://i.imgur.com/nbis287.png" alt="" height="10px" width="10px"> '
  }
  var reviewList = $('<ul></ul>')
    .append($('<li>').append("<strong>Review by</strong>: " + name))
    .append($('<li>').append("<strong>Stars: </strong>" + allStars))
    .append($('<li>').append("<strong>Review: </strong>" + review));

  $("#reviews").append(reviewList);

}

function submitReview(event) {
  event.preventDefault();
  createReview($("#review_name").val(), $("#review_stars").val(), $("#review_review").val());
  $("#review_name").val(null);
  $("#review_stars").val(null);
  $("#review_review").val(null);
}

$("form").bind('submit', submitReview);
