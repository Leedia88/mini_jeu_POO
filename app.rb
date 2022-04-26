require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player_1 = Player.new("Marc")
player_2 = Player.new("Guillaume")

# player_1.show_state
# player_2.show_state
# player_1.gets_damage(5)
# player_1.show_state
# player_2.attacks(player_1)
# binding.pry

# partie
# Game.new(player_1,player_2)

while !player_1.is_dead? && !player_2.is_dead?
        puts "voici l'état de nos joueurs :"
        player_1.show_state
        player_2.show_state
        puts
        puts "Passons à la phase d'attaque :"
        player_1.attacks(player_2)
        if player_2.is_dead?
            break
        end
        player_2.attacks(player_1)
        puts
end