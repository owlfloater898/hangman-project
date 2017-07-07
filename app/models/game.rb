class Game
    attr_accessor :user
    attr_reader :name

    @@all = []
    
    def initialize(user)
        @user = user
        @name = get_random_word
        @@all << self
    end

    def get_random_word
        "RANDOM"
    end

    def display_board
        "_A_N_D_M"
    end
    
    def guess_letter
        letter = ask_for_input
        if letter.class != String || letter.length != 1
            puts "Invalid Letter"
            guess_letter
        end
    end

    def ask_for_input
    end

end