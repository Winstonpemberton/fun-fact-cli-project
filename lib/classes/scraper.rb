require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper

  def self.scrape_main_page
    scrape_catagories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_catagories.css("ul li.cat-item a").text.split /(?=[A-Z])/

    #scrape_catagories.css("ul li.cat-item").collect do |categories|
    scrape_catagories.css("ul li.cat-item").each_with_index do |category, index|
      #categories = category_names
      category = Categoreies.new
      category.name = category_names[index]
      binding.pry
      #fact_page_url =
      # categories.each_with_index do |category, index|
      #   #category = Categoreies.new
      #   category.name = category_names[index]
      #   binding.pry
      # end
    end
  end

end
