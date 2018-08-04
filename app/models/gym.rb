class Gym
  ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end
  
  def memberships
    Membership.all.select do |membership_obj|
      membership_obj.gym == self
    end
  end

  def lifters
    self.memberships.map {|membership_obj| membership_obj.name}
  end
  
  def lifter_names
    self.lifters.map {|lifter_obj| lifter_obj.name}
  end
  
  def lift_total_for_gym
    self.lifters.reduce(0) do |lift_total, lifter_obj|
      lift_total += lifter_obj.lift_total
    end
  end
end
