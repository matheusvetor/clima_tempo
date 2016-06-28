class Now
  def initialize(request)
    @request = request
  end

  def data
    {
      temperature: temperature,
      thermal_sensation: thermal_sensation,
      # wind: wind,
      condition: condition,
      pressure: pressure,
      intensity: intensity,
      moisture: moisture
    }
  end

  private
  def temperature
    prepared_data.at_css("#momento-temperatura").text.match(/\d+/).to_s
  end

  def thermal_sensation
    prepared_data.at_css("#momento-sensacao").text.match(/\d+/).to_s
  end

  # def wind
  #   Wind.new(prepared_data[0].text)
  # end

  def condition
    prepared_data.at_css("#momento-condicao").text.strip
  end

  def pressure
    prepared_data.at_css("#momento-pressao").text.strip
  end

  def intensity
    prepared_data.at_css("#momento-vento").text.strip.delete!("\n").squeeze(" ")
  end

  def moisture
    prepared_data.at_css("#momento-humidade").text.strip
  end

  def prepared_data
    @prepared_data ||= @request.css(".bg-box-prev-topo")
  end
end
