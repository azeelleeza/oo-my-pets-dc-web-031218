class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []


  def initialize(species)
    @species = species
    @pets = {:fishes=>[], :dogs=>[], :cats=>[]}
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each{|x|x.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each{|x|x.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each{|x|x.mood = "happy"}
  end

  def sell_pets
    @pets.keys.each do |key|
      @pets[key].each do |x|
        x.mood = "nervous"
      end
    end
    @pets = {:fishes=>[], :dogs=>[], :cats=>[]}
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."

  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

end
