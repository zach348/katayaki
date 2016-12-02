function placeMap(){

 getOrigin();

  function getOrigin() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(buildMap);
      } else {
          return { coords: { longitude: null, latitude: null } }
      }
  }

  function buildMap(origin){
    debugger;
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers([
        {
          "lat": origin.coords.latitude,
          "lng": origin.coords.longitude,
          "picture": {
            "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
            "width":  32,
            "height": 32
          },
          "infowindow": "hello!"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }
}
