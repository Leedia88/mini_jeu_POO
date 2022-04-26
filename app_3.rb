require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

#####################  GAME  #####################
puts "-" * 50
puts "|Bienvenue dans STARDUST VALLEIIII               |"
puts "|Le but du jeu est d'être le dernier survivant ! |"
puts "-"*50
print "quel est ton prénom? >"
my_game = Game.new(gets.chomp)

while my_game.is_still_ongoing?
    my_game.menu_choice(my_game.menu)
    puts "Les autres joueurs t'attaquent !!"
    gets
    my_game.enemies_attack
    gets
    my_game.show_players
end