// Showing form partial
$('#show-partial').click(function(){
    $('#partial').show();
});

// Updating reviews with ajax
function createReview(name, stars, review) {
  var liName = $('<ul></ul>')

}

function submitReview(event) {
  event.preventDefault();
  createReview($("").val());
  $("").val(null);
  console.log("I am submitted");
}

$("form").bind('commit', submitTodo);
