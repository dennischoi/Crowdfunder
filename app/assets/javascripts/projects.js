// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//

$(document).on('ready page:load', function() {
  $('#search-form').submit(function(ev) {
    ev.preventDefault();

    var searchValue = $('#search').val();

    $.ajax({
      url: '/projects?search=' + searchValue,
      type: 'GET',
      dataType: 'html'
    }).done(function(data) {
      $('#projects').html(data);
    });
  });

  $('.new-pledge').on('click', function(eventObject) {
    eventObject.preventDefault();
    eventObject.stopPropagation(); // Not sure why this is needed, but if I don't include it, the link is still followed

    var url = $(this).attr('href');

    $.ajax({
      url: url,
      type: 'POST',
      success: function(data) {
        $('#project-funding-status').html(data);
        $('#project-backed').html("<h3>You've backed this project!</h3>").css('color', 'tomato');

        // Scroll to top of the page to show call attention to 'You've backed this project!' message and new total money amount
        $("html, body").scrollTop(0);
        // $('#project-total-money').animate({ backgroundColor: "#ff0000", color: "black" }, 5000, 'swing');
        $("#project-total-money").css('backgroundColor', 'tomato');
      }
    });
  })
});
