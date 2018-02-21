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

  # def total_breakdown
  #   total_breakdown = {}
  #   @activities.map do |all_activities|
  #     all_activities.owes.map do |activity|
  #       total_breakdown.merge(activity)
  #     end
  #   end
  # end

  def breakdown_by_activity
    @activities.map do |activity|
      activity.owes
    end.flatten
  end

  def total_breakdown
    total_breakdown = {}
    breakdown_by_activity.map do |person|
      total_breakdown.merge(person)
    end
    total_breakdown
  end
end
