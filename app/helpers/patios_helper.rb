module PatiosHelper

  def render_weather_info weather_datum
    capture do
      if weather_datum.present?
        concat content_tag :span, "#{weather_datum.temperature}&deg;".html_safe, class: 'left weather'
        concat content_tag :span, weather_datum.conditions, class: 'left weather'
        concat content_tag :span, weather_datum.message, class: 'left weather'
      end
    end
  end

  def render_name patio
    content_tag :h1 do
      concat content_tag :span, patio.name, class: 'patio-name'
      if patio.is_recommended?
        concat fa_icon "star", class: 'recommended'
      end
    end
  end

  def render_location patio
    capture do
      concat content_tag :span, patio.neighborhood
    end
  end

  def render_special_notes patio
    content_tag :span, patio.special_notes
  end

  def render_extra_attributes patio
    strings = []
    capture do
      [:is_bougie, :more_bar_than_restaurant, :on_rooftop,
       :is_small, :is_covered, :has_view, :on_street].each do |attribute|
        if patio.public_send(attribute)
          strings << t(attribute)
        end
      end
    end
    content_tag :span, strings.join(" + ")
  end

  def render_google_data google_data
    current_day = Time.now.strftime("%A")
    all_hours = google_data.dig('opening_hours', 'weekday_text')
    hours_today = ""
    if all_hours
      hours_today = all_hours.reject{ |day| day.exclude?(current_day) }.first
    end

    price = google_data["price_level"].to_i
    price = "$"*price

    capture do
      concat content_tag :span, price, class: 'block' if price.present?
      concat content_tag :span, hours_today, class: 'block patio-attribute'
    end
  end

  def render_external_google_info_link google_place_id
    api_uri = URI("https://www.google.com/maps/search/")
    params = {api: 1, query: 'Google', query_place_id: google_place_id}
    api_uri.query = URI.encode_www_form(params)
    link_to "Click here for more info", api_uri.to_s, target: "_blank"
  end

  def render_patio_link patio
    content_tag :span do
      concat link_to "#{patio.name}", patio, class: 'patio-name'
      concat fa_icon "star", class: 'recommended' if patio.is_recommended?
    end
  end

  def render_patios scoped_patios
    capture do
      scoped_patios.each do |patio|
        wrap = content_tag :div, nil, class: 'index-patio-container' do
          render_patio_link(patio)
        end
        concat wrap
      end
    end
  end

end
