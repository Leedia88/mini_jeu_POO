class Game

    attr_accessor :human_player, :ennemies
    

    def initialize(name)
        @wanted = ["Quinten", "Léo", "Rayan", "John", "Jean", "Jarett", "Pipo", "Ali", "Marc", "Renaud"]
        @human_player = HumanPlayer.new(name)
        player_1 = Player.new("Guillaume")
        player_2 = Player.new("Fayssal")
        player_3 = Player.new("Tonio")
        player_4 = Player.new("Nathanaël")
        @ennemies_in_sight = [player_1,player_2, player_3, player_4]
    end

    def kill_player(i)
        @ennemies_in_sight.delete_at(i)
    end

    def is_still_ongoing?
        return !@ennemies_in_sight.empty? || !@human_player.is_dead?
    end

    def show_players
        @human_player.show_state
        for ennemy in @ennemies_in_sight
            ennemy.show_state
        end
    end

    def menu
        puts
        puts "Quelle action veux-tu effectuer ?"
        puts "a - Chercher une meilleure arme"
        puts "s - Chercher un kit de survie"
        puts "Ou attaquer un ennemi en vue :"
        for ennemy in @ennemies_in_sight
            print "#{@ennemies_in_sight.find_index(ennemy)} - "
            ennemy.show_state
        end
        print ">"
        return gets.chomp
    end

    def menu_choice(input)
            case input
            when "a"
                @human_player.search_weapon
            when "s"
                @human_player.search_health_pack 
            else
                i = input.to_i
                case i
                when  0..20
                @human_player.attacks(@ennemies_in_sight[i])
                    if @ennemies_in_sight[i].is_dead?
                        kill_player(i)
                    end
                else
                    puts "Euuuuh.. je n'ai pas compris!"
                    menu_choice(menu)
                end                 
            end
    end

    def enemies_attack
        for ennemy in @ennemies_in_sight
            ennemy.attacks(@human_player)
            if @human_player.is_dead?
                game_ending
                break
            end
        end
    end

    def game_ending
        if @human_player.is_dead?
            puts "Tu as été tué! La partie est terminée. TRY AGAIN"
        elsif @ennemies_in_sight == []
            puts "Bien ouéj :) Tu as tué tous tes ex, la partie est terminée!"
        end
    end

    def new_players_in_sight
        if @wanted != []
            de = rand(1..6)
            case de
            when 1
                puts "Ouf, pas de nouveau relou en vue!"
                puts ""
            when 2..5
                @ennemies_in_sight << Player.new(@wanted.pop)
                puts "Oulaaa, un amant du passé a ressurgi ..."
            else
                @ennemies_in_sight << Player.new(@wanted.pop)
                @ennemies_in_sight << Player.new(@wanted.pop)
                puts "Attention, deux nouveaux prédateurs en vue!!"
            end
        end
    end
end

