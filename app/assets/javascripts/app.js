$(document).ready(function(){

  //update location
  if($('.users').length == 1 || $('.static_pages.index').length == 1) { getLocation(sendPosition); }

  //build map
  if($('.static_pages.index.current_user').length == 1) {
    getCurrentUserPosition(buildMap);
  }else if($('.static_pages.index.visitor').length == 1) {
    getLocation(buildMap);
  }
})
