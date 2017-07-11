 class Menu
    def self.display_welcome_message
      puts "Welcome to Hangman"
    end
    def self.menu
      display_welcome_message
      puts "\nMENU"
      puts "===="
      puts "1. New Easy Game"
      puts "2. New Medium Game"
      puts "3. New Hard Game"
      puts "4. View Games History"
      puts "5. View Leaderboard."
      puts "6. Exit session to change player."
      puts "7. Exit Program."
      print "\nPlease select an option: "
      option = gets.chomp
    end

    def self.menu_action
      user = nil

      loop do
        system('clear')
        option = menu
        case option
        when "1", "2", "3"
          if user == nil
              user = User.get_user
          end
          user.start_game(option)
        when "4"
          if user == nil
              user = User.get_user
          end
          user.display_history
        when "5"
          User.display_leaderboard
        when "6"
          user = nil
        when "7"
          break
        else
          puts "Invalid input"
        end
        puts "\nPress ENTER to return to menu."
        gets.chomp
      end
    end
end
