class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select { |x| x.name == self }
  end

  def gyms
    memberships.map(&:gym)
  end

  def self.average_lift
    all.map(&:lift_total).reduce(:+) / all.count
  end

  def total_cost
    memberships.map(&:cost).reduce(:+)
  end

  def sign_up(cost, gym_obj)
    Membership.new(self, gym_obj, cost)
    Gym.new(gym_obj.name)
  end
end
