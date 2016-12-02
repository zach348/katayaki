function buildMap(origin){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([
      {
        "lat": origin.latitude,
        "lng": origin.longitude,
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

function getUserPosition(callback){
  $.ajax({
    method: 'GET',
    url: '/location.json',
    contentType: 'application/json',
    success: function(data) {
      callback(data);
    }
  });
}
