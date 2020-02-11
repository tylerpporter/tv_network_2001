class Character

  def initialize(character_info)
    @character_info = character_info
  end

  def name
    @character_info[:name]
  end

  def actor
    @character_info[:actor]
  end

  def salary
    @character_info[:salary].to_i
  end

end
