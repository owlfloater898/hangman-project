require_relative '../app/models/game.rb'
require_relative '../app/models/user.rb'

user = User.new
game = Game.new(user)
game.play
game.play

user.display_history
#"wanna play again?"