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

function getAspirationsWithinBounds(){
  let swBound = [ handler.getMap().getBounds().getSouthWest().lat(),
                  handler.getMap().getBounds().getSouthWest().lng() ]
  let neBound = [ handler.getMap().getBounds().getNorthEast().lat(),
                  handler.getMap().getBounds().getNorthEast().lng() ]
  let app = this;

  $.ajax({
    method: 'GET',
    url: '/markers.json',
    contentType: 'application/json',
    data: { bounds: {
                      SW: swBound,
                      NE: neBound
                    }
          },
    success: function(aspirations) {
      app.addMarkers(aspirations);
    }
  });
}



function addMarkers(aspirations) {
  var map = handler.getMap();
  handler.markers = aspirations.markers.map(function(aspiration){
    var marker = new google.maps.Marker({
        map: map,
        animation: google.maps.Animation.DROP,
        position: { lat: aspiration.lat, lng: aspiration.lng },
        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
    });
    var infowindow = new google.maps.InfoWindow({
      content: `<div class="row">`+
                  `<h5 class="orange-shadow">${aspiration.title}</h5>`+
               `</div>`
    });
    marker.addListener('click', function(){
      infowindow.open(map, marker);
    });
    return { marker: marker, infowindow: infowindow }
  })
  openInfoBoxes();
}

function openInfoBoxes(){
  handler.markers.forEach(function(marker){
    marker.infowindow.open(handler.getMap(), marker.marker )
  })
}
