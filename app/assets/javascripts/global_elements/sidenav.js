// Initial variables

$(document).ready(function() {

  var mainSideNavTrigger = $('#mainSideNavTrigger');
  var mainSideNav = $('#mainSideNav');
  var mainContentContainer = $('#mainContentContainer');
  var mainSideNavOpen = false;

  // Listeners
  mainSideNavTrigger.on('click', function() {

    if (mainSideNavOpen === false) {
      mainContentContainer.animate({
        right: mainSideNav.width()
      }, 'slow', function() {
        mainSideNav.fadeIn('slow');
      });

      mainSideNavOpen = true;

    } else {

      mainSideNav.fadeOut('slow', function() {
        mainContentContainer.animate({
          right: '0'
        }, 'slow' );
      });

      mainSideNavOpen = false;

    } // End If Else Statement for open/close
  }); // End SideNavBar Functions

});
