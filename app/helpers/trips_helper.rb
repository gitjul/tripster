module TripsHelper
  def link_to_new_point(name, f)
    html = render :partial => 'trips/point', :locals => {
        :object => Point.new, :index => 'to_replace', :f => f, :delete => true }
    link_to_function name, %{
      var new_object_id = new Date().getTime();
      var html = '#{escape_javascript html}'.replace(/to_replace/g, new_object_id);
      $('#points').append(html);
    }
  end
end
