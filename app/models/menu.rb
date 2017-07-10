 class Menu
    def self.menu
        puts "MENU"
        puts "===="
        puts "1. New Game"
        puts "2. View Games History"
        puts "3. View Scoreboard"
        puts "4. Exit\n"
        print "Please select an option: "
        option = gets.chomp
    end

    def self.menu_action
        loop do
            system('clear')
            option = menu
            case option
            when "1"
                user = User.start_game
            when "2"
                #user.display_history
            when "3"
                #user.display_scoreboard
            when "4"
                break
            else
                puts "Invalid input"
            end
            #Press ENTER to go back to menu
        end
    end
end