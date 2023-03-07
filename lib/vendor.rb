class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item] 
  end

  def stock(item, num)
    @inventory[item] += num
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, num|
      revenue += item.price * num
    end
    revenue
  end
end