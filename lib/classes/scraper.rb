require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper

  def self.scrape_main_page
    scrape_catagories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_catagories.css("ul li.cat-item a").text.split /(?=[A-Z])/
    fact_page_urls = ["https://wtffunfact.com/animal-facts/","https://wtffunfact.com/awesome-facts/","https://wtffunfact.com/food-facts/",
    "https://wtffunfact.com/gaming-facts/","https://wtffunfact.com/health-facts/","https://wtffunfact.com/history-facts/","https://wtffunfact.com/laws-facts/",
    "https://wtffunfact.com/movie-facts/","https://wtffunfact.com/people-facts/","https://wtffunfact.com/places-facts/","https://wtffunfact.com/sports/",
    "https://wtffunfact.com/tech-facts/","https://wtffunfact.com/uncategorized/","https://wtffunfact.com/weird-facts/"]
    #scrape_catagories.css("ul li.cat-item").collect do |categories|
    scrape_catagories.css("ul li.cat-item a").each_with_index do |category, index|
      #categories = category_names
      category = Categoreies.new
      category.name = category_names[index]
      binding.pry
      # since it's not letting me see all the urls
      #fact_page_url = scrape_catagories.css("ul li a").attribute("href").value
      #scrape_catagories.css("ul li.cat-item").attribute("href").value
      #scrape_catagories.css("ul li.cat-item a").text
      #scrape_catagories.css("ul li").text
      #student_profile_url = scrape_catagories.css("ul li a").attribute("href").value
      # categories.each_with_index do |category, index|
      #   #category = Categoreies.new
      #   category.name = category_names[index]
      #   binding.pry
      # end
    end
  end

  def scrape_fact_info(url)

  end

end
