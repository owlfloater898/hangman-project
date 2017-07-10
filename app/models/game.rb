class Game
    attr_accessor :user, :outs, :guesses
    attr_reader :solution, :board, :game_data

    @@all = []
    
    def initialize(user)
        @user = user
        @solution = get_random_word
        @board = get_random_word.length.times.map{"_"}.join("")
        @outs = 0
        @guesses = []
        @game_data = {}
        @@all << self
    end

    def get_random_word
        "RANDOM".upcase
    end

    def display_board
        puts "#{board.chars.join(" ")}"
    end

    def wrong_letters
        guesses.select{|letter| !solution.include?(letter) }.join(", ")
    end

    def display_wrong_letters
        puts "Used letters: #{wrong_letters}"
    end

    def end_game
        if win?
            puts "You won!"
            game_data[:outcome] = "Win"
            if user.user_data[:streak] >= 1
                user.user_data[:streak] += 1
            else 
                user.user_data[:streak] = 1
            end
            user.user_data[:wins] += 1
            if user.user_data[:streak] > user.user_data[:longest_win_streak]
                user.user_data[:longest_win_streak] = user.user_data[:streak] 
            end
        else
            puts "Sorry the word was #{solution}. Try again"
            game_data[:outcome] = "Loss"
            if user.user_data[:streak] <= -1
                user.user_data[:streak] -= 1 
            else 
                user.user_data[:streak] = -1
            end
            user.user_data[:losses] += 1
            if user.user_data[:streak] < user.user_data[:longest_loss_streak]
                user.user_data[:longest_loss_streak] = user.user_data[:streak] 
            end
        end
        if user.user_data[:losses] == 0
            user.user_data[:ratio] = 1.0
        else
            user.user_data[:ratio] = user.user_data[:wins].to_f / user.user_data[:losses].to_f
            user.user_data[:ratio] = user.user_data[:ratio].round(3)
        end
    end

    def win?
        board == solution
    end

    def lose?
        outs == 6
    end

    def set_game_data
        game_data[:board] = board
        game_data[:wrong_letters] = wrong_letters

        user.history << game_data
    end

    def play
        system('clear')
        until win? || lose?
            puts Drawing.draw(outs)
            display_wrong_letters
            display_board
            guess_letter
            system('clear')
        end
        set_game_data
        puts Drawing.draw(outs)
        display_board
        end_game
    end

    def check_for_repeat?(letter)
        guesses.include?(letter)
    end

    def is_a_letter(letter)
        /[a-zA-Z]/.match(letter) != nil
    end
    
    def guess_letter
        ask_for_letter
        letter = gets_guess
        if !is_a_letter(letter) || letter.length != 1
            puts "Invalid Input"
            guess_letter
        elsif check_for_repeat?(letter)
            puts "You have already used that letter"
            guess_letter
        else            
            guesses << letter
            if solution.include?(letter) 
                #The player is correct
                update_board(letter)
            else
                add_out           
            end
        end
    end

    def ask_for_letter
        print "\nEnter a letter: "
    end

    def gets_guess
        gets.chomp.upcase
    end

    def update_board(letter)
        solution.chars.each.with_index do |letter_in_solution, index|
            if letter == letter_in_solution
                board[index] = letter
            end
        end
    end
    
    def add_out
        self.outs += 1
    end
end