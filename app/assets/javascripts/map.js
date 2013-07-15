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
