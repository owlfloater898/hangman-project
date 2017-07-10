 class Menu
    def self.display_welcome_message
      puts "Welcome to Hangman"
    end
    def self.menu
      display_welcome_message
      puts "\nMENU"
      puts "===="
      puts "1. New Game"
      puts "2. View Games History"
      puts "3. View Leaderboard."
      puts "4. Exit session to change player."
      puts "5. Exit Program."
      print "\nPlease select an option: "
      option = gets.chomp
    end

    def self.menu_action
      user = nil

      loop do
        system('clear')
        option = menu
        case option
        when "1"
          if user == nil
              user = User.get_user
          end
          user.start_game
        when "2"
          if user == nil
              user = User.get_user
          end
          user.display_history
        when "3"
          User.display_leaderboard
        when "4"
          user = nil
        when "5"
          break
        else
          puts "Invalid input"
        end
        puts "\nPress ENTER to return to menu."
        gets.chomp
      end
    end
end
