class Membership
  attr_reader :cost, :name, :gym

  ALL = []
  
  def initialize(name, gym, cost)
    @cost = cost
    @name = name
    @gym = gym
    ALL << self
  end

  def self.all 
    ALL 
  end
end
