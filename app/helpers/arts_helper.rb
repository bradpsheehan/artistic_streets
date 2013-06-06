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
<<-eos
<div id="content"></div>
<div id="siteNotice">
</div>
<h4>Title:</h4>
<p id="firstHeading" class="firstHeading">#{art.title}</p>
<h4>Artist:</h4>
<p id="secondHeading" class="secondHeading">#{art.artist}</p>
<div id="bodyContent" class="row">
<div class="large-11 large-centered columns">
<img src="#{art.image.url(:medium)}">
</div>
</div>
</div>
eos
  end

end
