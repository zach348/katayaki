$(document).ready(function(){
  if($('.users.show').length == 1) { getLocation(sendPosition); }
  if($('.static_pages.index').length == 1) { getUserPosition(buildMap); }
})
