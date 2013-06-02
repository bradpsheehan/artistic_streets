module ArtsHelper

  def art_with_valid_location(arts)
    arts.find_all{|art| art.location.latitude && art.location.longitude }
  end

  def art_objects_to_js_objects(arts)
    art_with_valid_location(arts).map do |art|
      { title: art.title, lat: art.location.latitude, long: art.location.longitude }
    end.to_json
  end

end
