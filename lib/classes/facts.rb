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

  def display_fact
    puts "#{self.name}"
    puts "#{self.date}"
    puts "#{self.description}"
    puts "#{self.source_info}"
  end

  def random_fact
    Facts.all.sample
  end

  def open_source_info
    system("open #{self.source_info}")
  end


end
