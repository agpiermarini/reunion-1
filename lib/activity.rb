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
    each_owes = Hash.new(0)
    @participants.each do |person|
      each_owes[person[:name]] += (cost_per_person - person[:paid])
    end
    each_owes
  end
end
