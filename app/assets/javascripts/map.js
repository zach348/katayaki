function buildMap(origin){
  handler = Gmaps.build('Google');
  var map = handler.buildMap({ provider: { zoom: 12, center: { lat: origin.coords.latitude, lng: origin.coords.longitude }},
                    internal: {id: 'map'}}, function(){

    markers = handler.addMarkers([ //data//
      {
        "lat": origin.coords.latitude,
        "lng": origin.coords.longitude,
        "picture": {
          "width":  32,
          "height": 32
        },
        "infowindow": `<div class='row'>
                        <h5 class='orange-shadow'>Aspiration</h5>
                       </div>`
      }
    ]);
    handler.bounds.extendWith(markers);
    // handler.fitMapToBounds();
  });
  return map
}

function getCurrentUserPosition(callback){
  $.ajax({
    method: 'GET',
    url: '/location.json',
    contentType: 'application/json',
    success: function(data) {
      callback(data);
    }
  });
}

function getUsersWithinBounds(bounds){

}
