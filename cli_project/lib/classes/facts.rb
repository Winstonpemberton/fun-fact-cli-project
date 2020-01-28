class Facts
  attr_accessor :name, :date, :description, :source

  @@all = []

  def initialize
    @@all << self
  end

end
