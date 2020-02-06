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
    puts "\n#{self.name}"
    puts "\n#{self.date}"
    puts "#{self.description}"
  end

  def self.random_fact
    self.all.sample.display_fact
  end

  # def open_source_info
  #   system("open #{self.source_info.url}") if !nil
  # end
  #

end
