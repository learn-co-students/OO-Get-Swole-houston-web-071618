
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

  def all_memberships
    Membership.all.select {|membership_obj| membership_obj.lifter == self}
  end
  
  def all_gyms
    self.all_memberships.map {|membership_obj| membership_obj.gym}
  end
  
  def self.average_lift
    total = self.reduce(0) do |lift_total, lifter_obj|
      lift_total += lifter_obj.lift_total
    end
    
    total / self.all.count
  end
  
  def total_gym_cost
    self.all_memberships.reduce(0) do |gym_total, membership_obj| 
      gym_total += membership_obj.cost
    end
  end
  
  def gym_signup(gym_obj, cost)
    Membership.new(cost, self, gym_obj)
  end
end
