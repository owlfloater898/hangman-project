class Game
    attr_accessor :user, :outs, :guesses
    attr_reader :solution, :board, :game_data

    @@all = []

    def initialize(user)
        @user = user
        @solution = get_random_word
        @board = self.solution.length.times.map{"_"}.join("")
        @outs = 0
        @guesses = []
        @game_data = {}
        @@all << self
    end

    def get_random_word
        "RANDOM".upcase
    end

    ## Methods for gameplay

    def display_board
        puts "#{board.chars.join(" ")}"
    end

    def wrong_letters
        guesses.select{|letter| !solution.include?(letter) }.join(", ")
    end

    def display_wrong_letters
        puts "Used letters: #{wrong_letters}"
    end

    def add_out
        self.outs += 1
    end

    def display_game_status
      system('clear')
      Drawing.draw_outs(outs)
      display_wrong_letters
      display_board
    end
    
    def display_end_game
      system('clear')
      if win?
        Drawing.draw_free
      else
        Drawing.draw_hanged
      end
      display_wrong_letters
      display_board
    end

    def ask_for_letter
        print "\nEnter a letter: "
    end

    def get_guess
        gets.chomp.upcase
    end

    def is_a_letter(letter)
      /[a-zA-Z]/.match(letter) != nil && letter.length == 1
    end

    def repetitive?(letter)
      guesses.include?(letter)
    end

    def repetitive_or_is_not_a_letter?(letter)
      if !is_a_letter(letter)
        puts "A letter would be better."
        true
      elsif repetitive?(letter)
        puts "You have already used that letter"
        true
      end
    end

    def update_board(letter)
        solution.chars.each.with_index do |letter_in_solution, index|
            if letter == letter_in_solution
                board[index] = letter
            end
        end
    end

    def get_letter(letter)
      guesses << letter
      if solution.include?(letter)
        update_board(letter)
      else
        add_out
      end
    end

    def ask_for_and_get_letter
      ask_for_letter
      letter = get_guess
      if repetitive_or_is_not_a_letter?(letter)
        ask_for_and_get_letter
      else
        get_letter(letter)
      end
    end

    def turn
      display_game_status
      ask_for_and_get_letter
    end

    #methods for end_game

    def win?
        board == solution
    end

    def lose?
        outs == 6
    end

    def display_outcome
      if win?
        puts "You won!"
      else
        puts "Sorry the word was #{solution}. Try again."
      end
    end

    def set_game_outcome
      if win?
        game_data[:outcome] = "Win"
      else
        game_data[:outcome] = "Loss"
      end
    end

    def set_game_data
        game_data[:board] = board
        game_data[:wrong_letters] = wrong_letters
        set_game_outcome
        user.history << game_data
    end

    def set_streak_wins
      if user.user_data[:streak] >= 1
          user.user_data[:streak] += 1
      else
          user.user_data[:streak] = 1
      end
      user.user_data[:wins] += 1
      if user.user_data[:streak] > user.user_data[:longest_win_streak]
          user.user_data[:longest_win_streak] = user.user_data[:streak]
      end
    end

    def set_streak_losses
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

    def set_ratio
      if user.user_data[:losses] == 0
          user.user_data[:ratio] = 1.0
      else
          user.user_data[:ratio] = user.user_data[:wins].to_f / user.user_data[:losses].to_f
          user.user_data[:ratio] = user.user_data[:ratio].round(3)
      end
    end

    def set_user_data
      if win?
        self.set_streak_wins
      else
        self.set_streak_losses
      end
      self.set_ratio
    end

    def end_game
      set_game_data
      set_user_data
      display_end_game
      display_outcome
    end

#####
    def play
      until win? || lose?
        self.turn
      end
      end_game
    end

end
