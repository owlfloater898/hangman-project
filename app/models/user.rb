class User
    attr_accessor :history, :name, :user_data
    #attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
      @name = name
      @history = []
      @user_data = {}
      @user_data[:streak] = 0
      @user_data[:wins] = 0
      @user_data[:losses] = 0
      @user_data[:longest_win_streak] = 0
      @user_data[:longest_loss_streak] = 0
      @user_data[:ratio] = 0.0
      @user_data[:streak] = 0
      @@all << self
    end

    def display_history
      system('clear')
      puts "Here's your history:"
      history.each do |game_data|
        output = game_data.map do |key, value|
            "#{key}: #{value}"
        end
        puts output.join(", ")
      end
    end

    def self.display_win_loss_ratio
      puts "Win/Loss Ratio"
      puts "=============="
      ratios = self.all.map do |user|
          user.user_data[:ratio]
      end
      ratios = ratios.sort.reverse[0...5]
      self.all.each.with_index do |user, index|
        if ratios.include?(user.user_data[:ratio])
          puts "#{index+1}. #{user.name} :: Ratio: #{user.user_data[:ratio]}, Longest Streak: #{user.user_data[:longest_win_streak]}"
        end
      end
    end

    def self.display_longest_streaks
      puts "\nLongest Streaks"
      puts "==============="
      streaks = self.all.map do |user|
        user.user_data[:longest_win_streak]
      end
      streaks = streaks.sort.reverse[0...5]
      self.all.each.with_index do |user, index|
        if streaks.include?(user.user_data[:longest_win_streak])
          puts "#{index+1}. #{user.name} :: Longest Streak: #{user.user_data[:longest_win_streak]}, Ratio: #{user.user_data[:ratio]}"
        end
      end
    end

    def self.display_leaderboard
      system('clear')
      self.display_win_loss_ratio
      self.display_longest_streaks
    end

    def self.ask_for_name
      print "\nPlease enter your name: "
    end

    def self.get_name
      gets.chomp.upcase
    end

    def self.find_by_name(name)
      self.all.find {|user| user.name.downcase == name.downcase}
    end

    def self.get_user
      self.ask_for_name
      name = get_name
      user = find_by_name(name)
      if user == nil
          user = User.new(name)
      end
      user
    end

    def start_game(difficulty)
      new_game = Game.new(self, difficulty)
      new_game.play
    end



end
