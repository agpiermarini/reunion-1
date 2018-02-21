class Activity
  attr_reader :participants, :name, :cost
  def initialize(name, cost)
    @name = name
    @participants = []
    @cost = cost
  end

  def add_participant(name, paid)
    @participants << {name: name, paid: paid}
  end

  def cost_per_person
    @cost/@participants.size
  end

  def owes
    @participants.map do |person|
      {person[:name] => cost_per_person - person[:paid]}
    end
  end
end
