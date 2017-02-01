/* global $ */

$(document).on('turbolinks:load', function() {
  $('.toggle_confirm').bind('click', toggleConfirm);
  $('.toggle_paid').bind('click', togglePaid);
});

// Mario wrote this while cooking spaghetti.
function toggleConfirm(event) {
  event.preventDefault();
  var curr_link = this;
  var current_status = $(this).data("confirmed");
  var booking_id = $(this).parent().parent().parent().parent().data("id");

  $.ajax({
    type: "PUT",
    url: "/admin/bookings/" + booking_id + ".json",
    dataType: "json",
    contentType: "application/json",
    data: JSON.stringify({
      confirmed: !current_status
    })
  })
  .done(function(data) {
    $(curr_link).data("confirmed", data.confirmed_status);
    $(curr_link).html(data.confirmed_text);
    if (data.confirmed_status === true) {
      var human_text = "yes";
    } else {
      var human_text = "no";
    }
    $("#confirm-" + data.id).html(human_text);
  });
}

function togglePaid(event) {
  event.preventDefault();
  var curr_link = this;
  var current_status = $(this).data("paid");
  var booking_id = $(this).parent().parent().parent().parent().data("id");

  $.ajax({
    type: "PUT",
    url: "/admin/bookings/" + booking_id + ".json",
    dataType: "json",
    contentType: "application/json",
    data: JSON.stringify({
      paid: !current_status
    })
  })
  .done(function(data) {
    $(curr_link).data("paid", data.paid_status);
    $(curr_link).html(data.paid_text);
    if (data.paid_status === true) {
      var human_text = "yes";
    } else {
      var human_text = "no";
    }
    $("#pay-" + data.id).html(human_text);
  });
}
