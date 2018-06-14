# Understands whether it is working or docked
class Bike
  def working?
    true
  end

  def broken?
    broken = true
    if broken = true
      report_broken_bike
    end
  end

  def report_broken_bike
    "Broken!"
  end
end
