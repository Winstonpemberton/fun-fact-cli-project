class Menu
  def self.start
    Scraper.scrape_main_page
    puts " welcome to the Fun Fact Generator, if you want to see all the categories enter 1 if you
    just want a random fact press 2 and if you want to exit the program enter exit"
    input = gets.chomp
    until input == "1" || input == "2" || input == "exit"
      case input
        when "1"
          Categories.list_categories
        when "2"
          Facts.random_fact
        when "exit"
          break
        else
        puts " invalid input, please try again "
      end
    end
  end

  def self.chose_fact(category)
    category.facts.each_with_index do |fact, index|
      counter += 1
      fact = category.facts[index]
      fact.display_facts
      # puts "would you like to open the source page, [Y/N]"
      # input = gets.chomp.lowercase
      # if input == "y"6
      #   fact.open_source
      # end
      input = gets.chomp
      until input == "1" || input == "2" || input == "3"
      if counter > category.facts.size
        puts "sorry that's all the facts in this category please choose another one or go to menu [1/2]"
        case input
          when "1"
            Categories.list_categories
          when "2"
            Menu.start
        else
          puts " invalid input, please try again "
        end
      else
        puts "would you like to get another fact from this category, choose another category or go back to menu. Enter [1,2,3]"
        case input
          when "1"
            break
          when "2"
            Categories.list_categories
          when "3"
            Menu.start
          else puts " invalid input, please try again "
        end
      end
    end
  end
end
end
