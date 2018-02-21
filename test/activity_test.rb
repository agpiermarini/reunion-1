require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("hiking", 30)
    assert_instance_of Activity, activity
  end

  def test_participants_hash
    activity = Activity.new("hiking", 30)
    assert_instance_of Array, activity.participants
  end

  def test_can_add_participants_to_hash
    activity = Activity.new("hiking", 30)
    assert_nil activity.participants.first

    activity.add_participant("Andrew", 5)
    assert_equal "Andrew", activity.participants.first[:name]
    assert_equal 5, activity.participants.first[:paid]
  end

  def test_can_add_participants_to_hash
    activity = Activity.new("hiking", 30)
    assert_nil activity.participants.first

    activity.add_participant("Andrew", 5)
    assert_equal "Andrew", activity.participants.first[:name]
    assert_equal 5, activity.participants.first[:paid]
  end

  def test_can_evaluate_total_cost
    activity = Activity.new("hiking", 30)

    assert_equal 30, activity.cost
  end

  def test_can_split_cost_of_activity
    activity = Activity.new("hiking", 30)

    activity.add_participant("Andrew", 5)
    assert_equal 30, activity.cost_per_person

    activity.add_participant("Biebz", 5)
    assert_equal 15, activity.cost_per_person
  end

  def test_can_determine_who_owes_what
    activity = Activity.new("hiking", 30)

    activity.add_participant("Andrew", 5)
    assert_equal 25, activity.owes.first["Andrew"]

    activity.add_participant("Biebz", 5)
    assert_equal 10, activity.owes.first["Andrew"]
    assert_equal 10, activity.owes.last["Biebz"]

    activity.add_participant("Swift", 20)
    assert_equal -10, activity.owes.last["Swift"]
  end
end
