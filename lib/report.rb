require 'json'

class Report
  def initialize(args)
    @chart = args['charts']['swell']
    @time = Time.at(args['timestamp']).strftime("%b %-d, %Y %H:%M")
    @components = args['swell']['components']['combined']
  end

  def to_json(*a)
    {
      time: time,
      height: height,
      period: period,
      direction: direction
    }.to_json(*a)
  end

  def time
    @time
  end

  def height
    @components['height']
  end

  def period
    @components['period']
  end

  def direction
    @components['compassDirection']
  end

  def swell_chart
    @chart
  end
end
