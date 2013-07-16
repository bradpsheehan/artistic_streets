$('#go-to-address').click(function() {
  var address = $('#address').val();
  centerMap(address);
  return false;
});


var populateSideBar = function(art_id) {
  var url = '/arts/'+ art_id + '.json';
  $.getJSON(url, function(data) {
    var art = data.art;
    var imageTags = "";

    $.each(data.images, function(index, value){ return imageTags += '<li><img src="' + value + '"/></li>'; });

    var source   = $("#sidebar-template").html();
    var template = Handlebars.compile(source);
    var context = { art: {id: art.id, title: art.title, artist: art.artist ,comment: art.comment }, imageTags: imageTags };

    var html = template(context);
    $('.side-nav').append(html);

   $("#carousel").carouFredSel(
      {
        auto : false,
        items: { 
                  minimum: 1,
                  visible: 'variable,
                  start: "random",
                  width: 200,
                  height: 200
                  },
        prev : "#art-prev",
        next : "#art-next"
      });
  });
}
