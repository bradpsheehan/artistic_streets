module ArtsHelper

  def art_objects(arts)
    @art_objects ||= arts.map do |art|
      art.to_map_art
    end
  end
end
