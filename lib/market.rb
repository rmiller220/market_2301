class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
    # @total_inventory = Hash.new(0)
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    v_names = []
    @vendors.each do |vendor|
      v_names << vendor.name
    end
    v_names
  end

  
  def vendors_that_sell(item)
    v_sell_item = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        v_sell_item << vendor
      end
    end
    v_sell_item
  end
  
  def total_inventory
    inventory = Hash.new { |hash, key| hash[key] = { quantity: 0, vendors: [] } }
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        inventory[item][:quantity] += quantity
        inventory[item][:vendors] << vendor
      end
    end
    inventory
  end
  def overstocked_items
    overstocked = []
    total_inventory.each do |item, data|
      if data[:quantity] > 500 && data[:vendors].size > 1
        overstocked << item
      end
    end
    overstocked
  end

  def sorted_item_list
    items = @vendors.flat_map { |vendor| vendor.inventory.keys.map(&:name) }
    items.uniq.sort
  end
end