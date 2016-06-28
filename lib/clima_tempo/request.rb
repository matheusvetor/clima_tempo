class Request
  def initialize(code)
    @code = code
  end

  def now
    @now ||= Now.new(request).data
  end

  def today_forecast
    @today_forecast ||= TodayForecast.new(request).data
  end

  private
  def request
    @request ||= Nokogiri::HTML(open(url))
  end

  def url
    "http://www.climatempo.com.br/previsao-do-tempo/cidade/#{@code}"
  end
end
