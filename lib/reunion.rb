require './lib/activity'

class Reunion
  attr_reader :activities
  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name, cost)
    activities << Activity.new(name, cost)
  end

  def total_cost
    return 0 if @activities.size.zero?
    @activities.map(&:cost).reduce(:+)
  end

  def total_breakdown
    total_breakdown = Hash.new(0)
    @activities.each do |activity|
      activity.owes.each_pair do |key, value|
        total_breakdown[key] += value
      end
    end
    total_breakdown
  end
end
