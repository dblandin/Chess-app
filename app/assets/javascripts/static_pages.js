$(document).ready(function() {

  // Initial variables
  var mainSideNavOpen = false;
  var mainSideNavTrigger = document.getElementById('mainSideNavTrigger');
  var mainSideNav = document.getElementById('mainSideNav');
  var mainContentContainer = document.getElementById('mainContentContainer');

  // Listeners
  mainSideNavTrigger.addEventListener('click', toggleMainSideNav);

  // Event Functions
  function toggleMainSideNav() {

    if (mainSideNavOpen === false) {

      var offsetWidth = String(mainSideNav.clientWidth) + 'px';
      mainContentContainer.style.right = offsetWidth;
      mainSideNav.style.opacity = 1;
      mainSideNavOpen = true;
    }

    else {

      mainContentContainer.style.right = 0;
      mainSideNav.style.opacity = 0;
      mainSideNavOpen = false;
    }
  }






});
