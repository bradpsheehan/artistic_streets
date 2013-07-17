$('#go-to-address').click(function() {
  var address = $('#address').val();
  centerMap(address);
  return false;
});


var populateSideBar = function(art_id) {
  //first clear sidebar if theres nothing in it
  $('.side-nav').empty();

  var url = '/arts/'+ art_id + '.json';
  $.getJSON(url, function(data) {
    var art = data.art;
    var imageTags = "";

    $.each(data.images, function(index, value){ return imageTags += '<li><img src="' + value + '"/></li>'; });

    var source   = $("#sidebar-template").html();
    var template = Handlebars.compile(source);
    var context = { art: {id: art.id, title: art.title, artist: art.artist ,comment: art.comment } };

    var html = template(context);
    $('.side-nav').append(html);
    $('ul#carousel').append(imageTags);

    $("#carousel").carouFredSel(
      {
        auto : false,
        circular: false,
        infinite: false,
        width: '100%',
        align: 'center',
        items: { 
                  minimum: 1,
                  visible: 'variable',
                  width: 300,
                  height: 225
                  },
        prev : { 
                button: '#art-prev',
                key: 'left',
               },
        next : {
                button: '#art-next',
                key: 'right'
               }
    });
    //if only one image, hide the prev/next buttons
    // debugger
      var count = data.images.length;
    if (count === 1) {
      $('div #carousel-buttons').hide();
    }
  });
}
