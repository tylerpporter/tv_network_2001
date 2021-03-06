require_relative 'test_helper.rb'
require './lib/network.rb'
require './lib/show.rb'
require './lib/character.rb'

class NetworkTest < Minitest::Test

  def setup
    @nbc = Network.new("NBC")
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
    @mitch = Character.new({name: "Mitch Buchannon", actor: "David Hasselhoff", salary: 1_200_000})
    @baywatch = Show.new("Baywatch", "Gregory Bonann", [@mitch])
  end

  def test_it_exists_with_attributes

    assert_instance_of Network, @nbc
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal 2, @nbc.shows.size
    assert_equal Show, @nbc.shows[0].class
  end

  def test_it_can_return_main_characters
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal Array, @nbc.main_characters.class
    assert_equal "KITT", @nbc.main_characters[0].name
  end

  def test_it_can_sort_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    assert_equal Hash, @nbc.actors_by_show.class
    assert_equal Show, @nbc.actors_by_show.keys[0].class

    actual = @nbc.actors_by_show.values.any? {|values| values == ["Amy Poehler", "Nick Offerman"]}

    assert actual

  end

  def test_it_can_sort_shows_by_actor
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@baywatch)
    expected = {
                "David Hasselhoff" => [@knight_rider, @baywatch],
                "William Daniels" => [@knight_rider],
                "Amy Poehler" => [@parks_and_rec],
                "Nick Offerman" => [@parks_and_rec]
                }


    assert_equal expected, @nbc.shows_by_actor
  end

  def test_it_can_return_prolific_actors
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    @nbc.add_show(@baywatch)

    assert_equal ["David Hasselhoff"], @nbc.prolific_actors

  end

end
