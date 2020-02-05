class Categories
  attr_accessor :name, :facts
  @@all = []

  def initialize
    @facts = []
  end

  def self.all
    @@all
  end

  def self.list_categories
    Categories.all.each.with_index(1) do |category, index|
    puts "#{index} - #{category.name}"
  end
    puts " please enter the number of the selected category "
    input = gets.chomp.to_i - 1
    category = self.all[input]
    Menu.chose_fact(category)
  end
end
