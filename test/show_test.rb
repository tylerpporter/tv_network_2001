require_relative 'test_helper.rb'
require './lib/character.rb'
require './lib/show.rb'

class ShowTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exists_with_attributes

    assert_instance_of Show, @knight_rider
    assert_equal "Knight Rider", @knight_rider.name
    assert_equal "Glen Larson", @knight_rider.creator
    assert_equal Array, @knight_rider.characters.class
    assert_equal Character, @knight_rider.characters[0].class
  end

  def test_it_can_calculate_total_salary

    assert_equal 2600000, @knight_rider.total_salary
  end

  def test_it_can_calculate_highest_paid_actor

    assert_equal "David Hasselhoff", @knight_rider.highest_paid_actor
  end

end
