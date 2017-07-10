class User
    attr_accessor :history, :name
    #attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @history = []
        @@all << self
    end

    def display_history
        puts "Here's your history:"
        history.each do |game_data|
            output = game_data.map do |key, value|
                "#{key}: #{value}"
            end
            puts output.join(", ")
        end
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|user| user.name.downcase == name.downcase}
    end

    def self.get_user
        print "\nPlease enter your name: "
        name = gets_name
        user = find_by_name(name)
        if user == nil
            user = User.new(name)
        end
    end

    def self.start_game
        self.get_user
        
        #continue = "Y"
        #until continue.upcase == "N"
        loop do
            new_game = Game.new(user)
            new_game.play
            #print "\nPress Y to continue or N to exit: "
            #continue = gets.chomp.upcase
            Menu.menu_action
        end
        user
    end

    def self.gets_name
        gets.chomp.upcase
    end
    
end