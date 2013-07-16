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
