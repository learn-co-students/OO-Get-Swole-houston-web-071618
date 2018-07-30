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
  
  def membership_list
    Membership.all.select {|membership_obj| membership_obj.gym == self}
  end

  def lifter_list
    self.membership_list.map {|membership_obj| membership_obj.lifter}
  end
  
  def lifter_name_list
    self.lifter_list.map {|lifter_obj| lifter_obj.name}
  end
  
  def gym_lift_total
    self.lifter_list.reduce(0) do |lift_total, lifter_obj|
      lift_total += lifter_obj.lift_total
    end
  end
end
