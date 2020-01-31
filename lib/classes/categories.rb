class Categories
  attr_accessor :name, :facts
  @@all = []

  def initialize
    @facts = []
  end

  def self.all
    @@all
  end

end
