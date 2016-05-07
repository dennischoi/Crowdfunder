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
});
