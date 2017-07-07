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

    def display_end_message
        if win?
            puts "You won!"
            game_data[:outcome] = "Win"
        else
            puts "Sorry the word was #{solution}. Try again"
            game_data[:outcome] = "Loss"
        end
    end

    def display_welcome_message
        puts "Welcome to Hangman"
    end
    
    def win?
        board == solution
    end

    def lose?
        outs == 7
    end

    def play
        system('clear')
        display_welcome_message
        until win? || lose?
            display_wrong_letters
            display_board
            guess_letter
            system('clear')
        end
        game_data[:board] = board
        game_data[:wrong_letters] = wrong_letters
        user.history << game_data
        display_board
        display_end_message
    end

    def check_for_repeat?(letter)
        guesses.include?(letter)
    end

    def is_a_letter(letter)
        /[a-zA-Z]/.match(letter) != nil
    end
    
    def guess_letter
        ask_for_input
        letter = gets_input
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

    def ask_for_input
        print "\nEnter a letter: "
    end

    def gets_input
        guess = gets.chomp.upcase
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