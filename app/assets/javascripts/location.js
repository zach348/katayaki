function getLocation(callback) {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(callback);
    } else {
        return { coords: { longitude: null, latitude: null } }
    }
}
function sendPosition(position) {
  $.ajax({
    method: 'PATCH',
    url: '/location',
    data: { location: { lon: position.coords.longitude, lat: position.coords.latitude  } },
    success: function(data){
      console.log(data);
    }
  });
}
