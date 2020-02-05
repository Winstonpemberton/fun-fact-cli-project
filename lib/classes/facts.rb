class Facts
  attr_accessor :name, :date, :description

  @@all = []

  def initialize(name,date,description)
    @name = name
    @date = date
    @description = description
  end

  def self.all
    @@all
  end

  def display_fact
    puts "#{self.name}"
    puts "#{self.date}"
    puts "#{self.description}"
  end

  def self.random_fact
    Facts.all.sample
  end

  # def open_source_info
  #   system("open #{self.source_info.url}") if !nil
  # end
  #

end
