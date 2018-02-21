require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new("Colorado")

    assert_instance_of Reunion, reunion
  end

  def test_can_add_activities
    reunion = Reunion.new("Colorado")

    assert_equal [], reunion.activities

    reunion.add_activity("hiking", 20)
    assert_instance_of Activity, reunion.activities.first
    assert_equal "hiking", reunion.activities.first.name
    assert_equal 20, reunion.activities.first.cost

    reunion.add_activity("kayaking", 50)
    assert_equal 2, reunion.activities.size
    assert_equal "kayaking", reunion.activities.last.name
  end

  def test_can_evaluate_total_cost_of_reunion
    reunion = Reunion.new("Colorado")

    assert_equal 0, reunion.total_cost

    reunion.add_activity("hiking", 20)
    assert_equal 20, reunion.total_cost

    reunion.add_activity("kayaking", 50)
    assert_equal 70, reunion.total_cost
  end

  def test_can_produce_breakdown_by_activity
    reunion = Reunion.new("Colorado")
    reunion.add_activity("hiking", 20)
    reunion.activities.first.add_participant("Andrew", 5)
    reunion.activities.first.add_participant("Biebz", 5)

    reunion.add_activity("kayaking", 20)
    reunion.activities.last.add_participant("Andrew", 5)
    reunion.activities.last.add_participant("Swift", 5)

    assert_instance_of Array, reunion.breakdown_by_activity
    assert_equal 4, reunion.breakdown_by_activity.size
  end

  def test_can_evaluate_total_breakdown
    reunion = Reunion.new("Colorado")
    reunion.add_activity("hiking", 20)
    reunion.activities.first.add_participant("Andrew", 5)
    reunion.activities.first.add_participant("Biebz", 5)

    reunion.add_activity("kayaking", 20)
    reunion.activities.last.add_participant("Andrew", 5)
    reunion.activities.last.add_participant("Swift", 5)

    assert_equal [], reunion.total_breakdown
  end
end
