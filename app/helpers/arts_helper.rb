module ArtsHelper

  def art_with_valid_location(arts)
    arts.find_all{|art| art.location.latitude && art.location.longitude }
  end

  def art_objects(arts)
    @art_objects ||= art_with_valid_location(arts).map do |art|
      { title: art.title,
        lat: art.location.latitude,
        long: art.location.longitude,
        image: art.image.url,
        artist: art.artist,
         }
    end
  end

  def info_window_for_art(arts)
    @info_windows ||= art_objects(arts).map do |art|
<<-eos
<div id="content"></div>
<div id="siteNotice">
</div>
<h1 id="firstHeading" class="firstHeading">#{art[:title]}</h1>
<h3 id="secondHeading" class="secondHeading">#{art[:artist]}</h3>
<div id="bodyContent">
<img src="#{art[:image]}">
</div>
</div>
eos
    end
  end

end
