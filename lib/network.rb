class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    main_characters = []
    @shows.each do |show|
      show.characters.each do |char|
        if (char.name == char.name.upcase) && (char.salary > 500_000)
          main_characters << char
        end
      end
    end
    main_characters
  end

  def actors_by_show
    by_show = {}
    @shows.each {|show| by_show[show] = show.actors}
    by_show
  end

  def shows_by_actor
    by_actor = {}
    @shows.each do |show|
      show.actors.each do |actor|
        if by_actor[actor].nil?
          by_actor[actor] = [show]
        else
          by_actor[actor] << show
        end
      end
    end
    by_actor
  end

end
