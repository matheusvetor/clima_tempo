class TodayForecast
  def initialize(request)
    @request = request
  end

  def data
    {
      condition: condition,
      min: minimum,
      max: maximum,
      probability_of_precipitation: probability_of_precipitation,
      volume_of_precipitation: volume_of_precipitation
    }
  end

  private
  def condition
    @request.at_css(".left.mobile-columns.top20.small-12.medium-6.top5.normal.font14.txt-black").text.strip
  end

  def minimum
    @request.css(".left.left10.top5.bold.font27.txt-black").last.text
  end

  def maximum
    @request.css(".left.left10.top5.bold.font27.txt-black").first.text
  end

  def probability_of_precipitation
    precipitation.last
  end

  def volume_of_precipitation
    precipitation.first
  end

  def precipitation
    @request.css(".left.small-3").css(".left.text-center.small-12.top5.normal.font12.txt-black").first.inner_html.split("<br>")
  end
end
