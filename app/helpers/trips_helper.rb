module TripsHelper
  def link_to_new_point(name, f)
    html = render :partial => 'trips/point', :locals => {
        :object => Point.new, :index => 'to_replace', :f => f, :delete => true }
    link_to_function name, %{
      var new_object_id = new Date().getTime();
      var html = '#{escape_javascript html}'.replace(/to_replace/g, new_object_id);
      $('#points').append(html);
      addMarker("trip_points_attributes_" + new_object_id);
    }
  end

  def map_tag(lat, lng, options = {})
    sensor = options[:sensor] || false
    size   = options[:size] || "200x200"
    zoom   = options[:zoom] || 11
    image_tag "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=#{zoom}&size=#{size}&sensor=#{sensor}"
  end
end
