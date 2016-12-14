$(document).on('turbolinks:load', function () {

  $('#new_period').submit(function(event) {
    //prevent form from submitting the default way

    event.preventDefault();

    var values = $(this).serialize();

    var posting = $.post('/periods', values);

    posting.done(function(data) {
      var period = data;
      var idi = period["id"];
      var title = period["title"];
      // debugger;
       $("#periodTitle").text(period["title"]);
       $("#periodResult").append(`<a href="/periods/${idi}">${title}</a>`);

      $("#periodExpiration").text(period["expiration"] + " weeks left.");
    });
  });


    $.ajax({
      type: "GET",
      url: "/periods"
    }).then(function(response) {

      for (i=0; i < response.length; i++) {
        var period = response[i];
        $('.adjustedPeriods').append(`<a href="/periods/${period.id}">${period.title}</a><br><br>`);
      };
    });



});
