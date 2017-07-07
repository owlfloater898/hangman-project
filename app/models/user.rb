class User
    attr_reader :history

    def initialize()
        @history = []
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
end