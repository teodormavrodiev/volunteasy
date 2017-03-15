
$(document).ready(function(){
  $(".button-categories").on('click', function(){
    $(".categories").slideToggle();
  });


  var navbar = $('.events-search #navbar-bottom');
  var timing = "0.3s";

  // Logic:
  var adjustNavBar = function(forcingToHideNavbar) {
    var currentPosition = $(window).scrollTop();

    if (currentPosition > 10 && !forcingToHideNavbar) {
      // navbar.css({"opacity":"0.2","transition":"0.5s"});
      navbar.css({"margin-top": -(navbar.height() / 2) - 33,"transition": timing});
    } else {
      // navbar.css({"opacity":"1","transition":"0.5s"});
      navbar.css({"margin-top":"0px","transition": timing});
    }
  };

  // Actions:
  adjustNavBar(false);

  // On scroll up and down.
  $(window).scroll(function() {
    var currentPositionBeforeScroll = $(window).scrollTop();

    setTimeout(function() {
      var currentPositionAfterScroll = $(window).scrollTop();
      var difference = currentPositionAfterScroll - currentPositionBeforeScroll;

      if (difference > 0) {
        // console.log("scroll down");
        adjustNavBar(false);
      }

      if (difference < 0) {
        // console.log("scroll up");
        adjustNavBar(true);
      }

      currentPositionBeforeScroll = $(window).scrollTop();
    }, 333);

  });

  var filters = $('.categories-filter');

    // On scroll up and down.
  $(window).scroll(function() {
    var currentPosition = $(window).scrollTop();

    if (currentPosition > 100) {
      filters.addClass("fixed-categories");
    } else {
      filters.removeClass("fixed-categories");
    }
  });




  $('#iconified').on('keyup', function() {
      var input = $(this);
      if(input.val().length === 0) {
          input.addClass('empty');
      } else {
          input.removeClass('empty');
      }
  });


  // Styling attachinary button on edit my profile page


  $( ".cloudinary-button" ).on("click",function() {
    $(".input-attachinary a").trigger( "click" );
    $( "#user_photo" ).trigger( "click" );
  });

});

