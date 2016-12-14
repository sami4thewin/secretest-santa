

  $(document).on('turbolinks:load', function () {



    $(".js-get").hide();

    $('.prospectData').hide();

    $('.name').on("click", function() {
      var id = $(this).data("id");
      $(`[data-user=${id}]`).show();

    })


    $(".js-more").on("click", function(event) {

      var id = $(this).data("id");
      var user = $(this).data("type");
      $.ajax({
        type: "POST",
        url: '/period_users',
        data: {'period_id': `${id}`, 'user_id': `${user}`}
      });
    });


    $('.prospectShow').on("click", function() {
      var id = $(this).data("gift");
      $('.prospectData').hide();
      $(`[data-prospect=${id}]`).show();
      $.ajax({
        type: "GET",
        url: `/gifts/${id}`
      }).then(function(response){
        tally = 0;
        for (i=0; i < response.votes.length; i++) {
          var vote = response.votes[i];
          tally = tally + vote.tally
        };

        $(`[data-prospect=${id}]`).prepend(`<a href="${response.link}" target="_blank">Here is a link to ${response.description} which is ${response.price} dollars.</a>`);
        $(`[data-prospect=${id}]`).prepend(`<h4>${response.description} currently has ${tally} vote(s), you can vote or leave a comment below.</h4>`);


        for (i=0; i < response.comments.length; i++) {
          $(`#comments_${id}`).append(`<h5>${response.comments[i].text}</h5>`);
        };

      });

    });

    $('[src="http://www.clipartkid.com/images/721/wrapped-christmas-presents-wrapped-christmas-present-jpg-fy6Ii2-clipart.jpg"]').on("click", function() {
      // debugger;
      var gift = $(this).data("vote");
      var user = $(this).data("img");
      $.ajax({
        type: "POST",
        url: '/votes',
        data: {'gift_id': `${gift}`, 'user_id': `${user}`, 'tally': '1'}
      });
      alert("Successfully upvoted, nice...");
    });

    $('[src="http://thehanovertheatre.org/images/header_image/1440432004_h_grinch900x650.jpg"]').on("click", function() {
      // debugger;
      var gift = $(this).data("vote");
      var user = $(this).data("img");
      $.ajax({
        type: "POST",
        url: '/votes',
        data: {'gift_id': `${gift}`, 'user_id': `${user}`, 'tally': '-1'}
      });
      alert("Successfully downvoted, rude...");
    });

    $('.new_comment').submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var comment = $.post("/comments", values);
      // debugger;
      comment.done(function(response) {
        // debugger;
        t = response.text;
        gift = response.gift_id;
        var guy = $.get(`/users/${response.user_id}`);

        guy.done(function(response) {
          // debugger;
          $(`#comments_${gift}`).append(`<h5>${response.name} says ${t}.</h5>`);
          alert("Added your comment!");
        });


        // $(`#comments_`)
      });
    });

    $(".new_gift").submit(function(event) {
      event.preventDefault();
      var values = $(this).serialize();
      var posting = $.post("/gifts", values);
      posting.done(function(response){
        // debugger;
        var gif = new Gift(response)
        gif.appendToPage()
        // $(`#gifts_${response.recipient_id}`).append(`<button type="button" class="prospectShow" data-gift="${response.id}">${response.description}</button>`);
        alert("Added your gift!");
      });
    });

});

    function Gift (response) {
      this.description = response.description;
      this.id = response.id;
      this.link = response.link;
      this.price = response.price;
      this.recipient_id = response.recipient_id;
      this.user_id = response.user_id;
      this.period_id = response.period_id;
    }

    Gift.prototype.appendToPage = function() {
      $(`#gifts_${this.recipient_id}`).append(`<button type="button" class="prospectShow" data-gift="${this.id}">${this.description}</button>`);
    }

    // class Gift(){
    //   constructor(response){
    //     this.description = response.description;
    //     this.id = response.id;
    //     this.link = response.link;
    //     this.price = response.price;
    //     this.recipient_id = response.recipient_id;
    //     this.user_id = response.user_id;
    //   };
    // }
    //
    // Gift.prototype.appendToPage = function(){
    //   $(`#gifts_${this.recipient_id}`).append(`<button type="button" class="prospectShow" data-gift="${this.id}">${this.description}</button>`);
    // }


  // class Gift(){
  //   constructor(response){
  //     this.description = response.description;
  //     this.id = response.id;
  //     this.link = response.link;
  //     this.price = response.price;
  //     this.recipient_id = response.recipient_id;
  //     this.user_id = response.user_id;
  //   };
  //
  //   appendToPage(){
  //     $(`#gifts_${this.recipient_id}`).append(`<button type="button" class="prospectShow" data-gift="${this.id}">${this.description}</button>`);
  //   };
  // }

  // Gift.prototype.appendToPage = function(){
  //   some stuff
  // }


  // function User (name, email){
  //   this.name = name;
  //   this.email = email;
  //   this.sayHello = function(){
  //     console.log("Hello, my name is " + this.name);
  //   }
  // }
