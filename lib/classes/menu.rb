class Menu
  def self.start
    Scraper.scrape_main_page
    self.menu
  end

  def self.menu
    puts "\nWelcome to the Fun Fact Generator"
    input = 0
    until input == 1 || input == 3
      puts "\nIf you want to see all the categories enter 1, if you just want a random fact press 2 and if you want to exit the program enter 3"
      input = gets.chomp.to_i
      if input == 1
        Categories.list_categories
      elsif input == 2
        Facts.random_fact
      elsif input == 3
        exit!
      else
         puts " Invalid input, please try again "
      end
    end
  end

  def self.chose_fact(category)
    counter = 1
    category.facts.each_with_index do |fact, index|
      fact = category.facts[index]
      fact.display_fact
      puts "would you like to open the source page, and read more about this fact [Y/N]"
      input = gets.chomp.downcase
      if input == "y"
        fact.open_source_info
      end
      input = 0
      puts "\nwould you like to get another fact from this category, choose another category or go back to menu. Enter [1,2,3]"
      until input == 1 || input == 2 || input == 3
        counter += 1
        input = gets.chomp.to_i
        if counter >= category.facts.size
          puts "sorry that's actually all the facts in this category going back to category list"
          if input == 1
            Categories.list_categories
          else
            puts " \ninvalid input, please try again "
          end
        else
          if input == 1
          elsif input == 2
            Categories.list_categories
          elsif input == 3
            self.menu
          else
              puts " invalid input, please try again "
            end
          end
        end
    end
  end
end
