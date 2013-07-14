module ArtsHelper

  def art_objects(arts)
    @art_objects ||= arts.map do |art|
      art.to_map_art
    end
  end

  def info_windows_for_arts(arts)
    @info_windows ||= arts.map do |art|
      info_window_content(art)
    end
  end


  def info_window_content(art)
    #art.image_urls
    #art.to_map_art
    #can we rework this method to use the list of image urls and incorporate some carousel?
<<-eos
<div id="content"></div>
<div id="siteNotice">
</div>
<h4>#{t('headings.art_title')}</h4>
<p id="firstHeading" class="firstHeading">#{art.title}</p>
<h4>Artist:</h4>
<p id="secondHeading" class="secondHeading">#{art.artist}</p>
<h4>Location:</h4>
<p id="secondHeading" class="secondHeading">#{art.location[:address]}</p>
<div id="bodyContent" class="row">
<div class="large-11 large-centered columns">
#{art.image_tags}
</div>
</div>
</div>
eos
  end

end
