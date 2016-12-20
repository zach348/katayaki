$(document).ready(function(){

  //update location
  getLocation(sendPosition);

  //build map
  if($('.static_pages.index.current_user').length == 1) {
    getCurrentUserPosition(buildMap);
  }else if($('.static_pages.index.visitor').length == 1) {
    var timer;
    timer = setTimeout(function(){
      buildMap(undefined, {zoom: 2, refreshAspirations: true, timer: timer });
    }, 100);
  }
})
