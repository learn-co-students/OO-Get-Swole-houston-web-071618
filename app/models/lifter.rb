class Lifter
  attr_reader :name, :lift_total

  ALL = []
  
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def all
    ALL 
  end

  def memberships
    Membership.all.select {|membership_obj|
      membership_obj.name == self}
  end
  
  def gyms
    self.memberships.map {|membership_obj| membership_obj.gym}
  end
  
  def self.average_lift
    total = self.all.reduce(0) do |lift_total, lifter_obj|
      lift_total += lifter_obj.lift_total
    end
    
    total / self.all.count
  end
  
  def total_cost
    self.memberships.reduce(0) do |gym_total, membership_obj| 
      gym_total += membership_obj.cost
    end
  end
  
  def sign_up(cost, gym_obj)
    Membership.new(self, gym_obj, cost)
    Gym.new(gym_obj.name)
  end
  
  def self.all 
    ALL 
  end
end
