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
<h1 id="firstHeading" class="firstHeading">#{art.title}</h1>
<h3 id="secondHeading" class="secondHeading">#{art.artist}</h3>
<div id="bodyContent">
<img src="#{art.image.url}">
</div>
</div>
eos
  end

end
