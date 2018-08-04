class Membership
  attr_reader :cost, :name, :gym
  @@all = []

  def initialize(name, gym, cost)
    @cost = cost
    @name = name
    @gym = gym
    @@all << self
  end

  def self.all
    @@all
  end
end
