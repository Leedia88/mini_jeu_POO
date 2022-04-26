require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'



################################################
puts "-" * 50
puts "|Bienvenue dans STARDUST VALLEIIII               |"
puts "|Le but du jeu est d'être le dernier survivant ! |"
puts "-"*50

print "quel est ton prénom? >"
player = HumanPlayer.new(gets.chomp)
player_1 = Player.new("Marc")
player_2 = Player.new("Guillaume")
ennemies = [player_1, player_2]


while !player.is_dead? && (!player_1.is_dead? || !player_2.is_dead?)

puts "Quelle action veux-tu effectuer ?"
puts "a - Chercher une meilleure arme"
puts "s - Chercher à se soigner "
puts "Attaquer un joueur en vue :"
print "0 - "
player_1.show_state
print "1 - "
player_2.show_state

loop do
    print ">"
    input = gets.chomp

    case input
    when "a"
        player.search_weapon
        break
    when "s"
        player.search_health_pack
        break
    when "0"
        player.attacks(player_1)
        break
    when "1"
        player.attacks(player_2)
        break
    else
        puts "Je n'ai pas compris ta saisie, merci de recommencer!"        
        next
    end
end

if player_1.is_dead? && player_2.is_dead?
    puts "Tu as gagné la partie!"
else
    puts "Les autres joueurs t'attaquent !!"
    for ennemy in ennemies
        gets
        if !ennemy.is_dead?
            ennemy.attacks(player)
        end
        if player.is_dead?
            puts "Tu as été tué....."
            puts "La partie est terminé, TRY AGAIN !"
            break
        end
    end
end

end