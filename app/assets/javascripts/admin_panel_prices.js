$(document).on('turbolinks:load', function() {
  $("#add-form-button").bind('click', submitPrice);
});

function submitPrice() {
  alert("WOOHOOOOOO");
}
