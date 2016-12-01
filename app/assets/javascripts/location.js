function locateUser(){

  getLocation();

  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(sendPosition);
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
}
