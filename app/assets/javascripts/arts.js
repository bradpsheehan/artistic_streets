$('#go-to-address').click(function() {
  var address = $('#address').val();
  centerMap(address);
  return false;
});


var populateSideBar = function(art_id) {
  var url = '/arts/'+ art_id + '.json';
  
  $.getJSON(url, function(data) {
    var art = data.art
    var imageTags = ""

    $.each(data.images, function(index, value){
      return imageTags += '<li><img src="' + value + '"/></li>'
    });

    var addPhotoButton = "<form enctype='multipart/form-data' method='post' action='/images'><input type='file' name='image' id='add-photo-image'><input type='hidden' name='art_id' value='" + art.id +"id='add-photo-artid'><input type='submit' id='add-photo'></form>"
    var sideBarHTML = '<h4><em>Title:</em> '+ art.title +'</h4><h5><em>Artist: </em>'+ art.artist+'</h5><p id="art-comment"><em>Comment:</em> '+ art.comment+'</p><div class="image_carousel"><ul id="carousel">' + imageTags + '</ul><div class="clearfix"></div><div id="carousel-buttons"><a class="prev custom-button" id="art-prev" href="#"><span>prev</span></a><a class="next custom-button" id="art-next" href="#"><span>next</span></a></div></div>' +addPhotoButton;

    $('.side-nav').append(sideBarHTML);
    $("#carousel").carouFredSel({
        auto : false,
        items: { minimum: 1, start: "random", width: 200, height: 200 },
        prev : "#art-prev",
        next : "#art-next"
    });
  });
}
