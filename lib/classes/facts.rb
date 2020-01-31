class Facts
  attr_accessor :name, :date, :description, :source_info

  @@all = []

  def initialize(name,date,description,source_info)
    @name = name
    @date = date
    @description = description
    @source_info = source_info
  end

  def self.all
    @@all
  end

end
