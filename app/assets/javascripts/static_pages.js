$(document).ready(function() {

  // Initial variables

  var mainSideNavTrigger = $('#mainSideNavTrigger');
  var mainSideNav = $('#mainSideNav');
  var mainContentContainer = $('#mainContentContainer');
  var mainSideNavOpen = false;

  // Listeners
  mainSideNavTrigger.on('click', function() {
    if (mainSideNavOpen == false) {
      mainContentContainer.animate({
        right: mainSideNav.width
      }, 'slow', 'linear', function() {

        mainSideNav.fadeIn();

      });


    } else {


    }

  });


});
