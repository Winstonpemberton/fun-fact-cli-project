class Facts
  attr_accessor :name, :date, :description,:source_info

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
    puts "\n#{self.name}"
    puts "\n#{self.date}"
    puts "#{self.description}"
  end

  def self.random_fact
    self.all.sample.display_fact
  end

  def open_source_info
  #system("open -a Google Chrome #{self.source_info}")
  #Launchy::Browser.run(self.source_info)
    # browser = Watir::Browser.new
    # browser.goto(self.source_info)
    link = self.source_info.chomp
      if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
        system "start #{link}"
      elsif RbConfig::CONFIG['host_os'] =~ /darwin/
        system "open #{link}"
      elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
        system "xdg-open #{link}"
      end
  end
end
