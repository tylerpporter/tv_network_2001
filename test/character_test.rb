require_relative 'test_helper.rb'
require './lib/character.rb'

class CharacterTest < Minitest::Test

  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
  end

  def test_it_exists

    assert_instance_of Character, @kitt
  end

  def test_it_can_return_character_info

    assert_equal "KITT", @kitt.name
    assert_equal "William Daniels", @kitt.actor
    assert_equal 1000000, @kitt.salary 
  end

end
