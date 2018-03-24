module PatiosHelper

  def render_name patio
    content_tag :h1 do
      concat content_tag :span, patio.name, class: 'patio-name'
      concat fa_icon "star"
    end
  end

  def render_seating_location patio
    unless patio.standard?
      content_tag :span, patio.seating_location.titleize
    end
  end

  def render_is_covered patio
    if patio.is_covered?
      content_tag :span, "Covered seating available"
    end
  end

  def render_has_view patio
    if patio.has_view?
      content_tag :span, "Great view!"
    end
  end

  def render_google_data google_data
    current_day = Time.now.strftime("%A")
    hours_today = google_data['opening_hours']['weekday_text'].reject{ |day| day.exclude?(current_day) }.first
    capture do
      concat content_tag :span, hours_today, class: 'block'
      concat content_tag :span, "Rating: #{google_data['rating']}", class: 'block'
    end
  end

end
