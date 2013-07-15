var centerMap = function() {
  var address = document.getElementById("address").value;
  geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
    }
    else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}

var resetMarkerIcons = function() {
  //  reset all the icons back to normal except the one you clicked
  for (var i = 0; i < markersArray.length; i++) {
      markersArray[i].setIcon(pinImage);
  }
}

var saveIconState = function(marker) {
  clickedMarkerTitle = marker.title;
}

var createMarker = function(art) {
  var pinColor = "2980b9";
  var pinColor2 = "65ba4a";
  var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
    new google.maps.Size(21, 34),
    new google.maps.Point(0,0),
    new google.maps.Point(10, 34));

  var pinImage2 = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor2,
    new google.maps.Size(50, 75),
    new google.maps.Point(0,0),
    new google.maps.Point(10, 34));

  var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
    new google.maps.Size(40, 37),
    new google.maps.Point(0, 0),
    new google.maps.Point(12, 35));

  var marker = new google.maps.Marker({
     position: new google.maps.LatLng(art.lat, art.long),
     map: map,
     icon: pinImage,
     shadow: pinShadow,
     title: art.title,
     art_id: art.id,
     optimized: false,
     art: art
  });
  return marker;
}
