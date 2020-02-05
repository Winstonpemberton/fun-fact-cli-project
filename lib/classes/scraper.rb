require 'open-uri'
# require "Nokogiri"
require 'pry'

class Scraper

  def self.scrape_main_page
    scrape_catagories = Nokogiri::HTML(open("https://wtffunfact.com/"))
    category_names = scrape_catagories.css("ul li.cat-item a").text.split /(?=[A-Z])/

    fact_page_urls = ["https://wtffunfact.com/animal-facts/","https://wtffunfact.com/awesome-facts/","https://wtffunfact.com/food-facts/",
    "https://wtffunfact.com/gaming-facts/","https://wtffunfact.com/history-facts/","https://wtffunfact.com/laws-facts/",
    "https://wtffunfact.com/movie-facts/","https://wtffunfact.com/people-facts/","https://wtffunfact.com/places-facts/","https://wtffunfact.com/sports/",
    "https://wtffunfact.com/tech-facts/","https://wtffunfact.com/uncategorized/","https://wtffunfact.com/weird-facts/"]
    #,"https://wtffunfact.com/health-facts/"
    scrape_catagories.css("ul li.cat-item a").each_with_index do |category, index|
      category = Categories.new
      name = category_names[index]
      category.name = name.to_s
      category.facts = scrape_fact_info(fact_page_urls[index])
      Categories.all << category
      #binding.pry
    end
  end

  def self.scrape_fact_info(url)
    scrape_facts = Nokogiri::HTML(open(url))
    facts = []

    scrape_facts.css("article").collect do |fact|

      name = fact.css("h2.entry-title").text.split(" – ")[1]
      name.to_s
      date = fact.css("time.entry-date").text
      date.to_s
      description_source_url = fact.css("div p a").attribute("href").value
      description_source_info = Nokogiri::HTML(open(description_source_url))
      description = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[0] #if !nil
      description.to_s
      #source_info = description_source_info.css("div.inside-article p").text.split(" – WTF Fun Facts Source: ")[1] unless !nil
      fact_object = Facts.new(name, date, description)

      facts << fact_object
      Facts.all << fact_object
    end
    facts
  end
end
