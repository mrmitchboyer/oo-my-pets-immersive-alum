require 'pry'
class Owner
  attr_accessor :name
  attr_reader :species, :pets

  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def pets=(hash)
    @pets = hash
  end

  def say_species
    "I am a #{self.species}."
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

  def feed_fish
    @pets[:fishes].each { |f| f.mood = "happy" }
  end

  def play_with_cats
    @pets[:cats].each { |c| c.mood = "happy" }
  end

  def walk_dogs
    @pets[:dogs].each { |d| d.mood = "happy" }
  end

  def sell_pets
    @pets.values.flatten.each { |f| f.mood="nervous" }
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
