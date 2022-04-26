class Game

    attr_accessor :human_player, :ennemies

    def initialize(name)
        @human_player = HumanPlayer.new(name)
        player_1 = Player.new("Guillaume")
        player_2 = Player.new("Fayssal")
        player_3 = Player.new("Tonio")
        player_4 = Player.new("Nathanaël")
        @ennemies = [player_1, player_2, player_3, player_4]
    end

    def kill_player(i)
        @ennemies.delete_at(i)
    end

    def is_still_ongoing?
        return !@ennemies.empty? || !@human_player.is_dead?
    end

    def show_players
        @human_player.show_state
        for ennemy in @ennemies
            ennemy.show_state
        end

    end

    def menu
        puts
        puts "Quelle action veux-tu effectuer ?"
        puts "a - Chercher une meilleure arme"
        puts "s - Chercher à se soigner "
        puts "Ou attaquer un joueur en vue :"
        for ennemy in @ennemies
            print "#{@ennemies.find_index(ennemy)} - "
            ennemy.show_state
        end
        print ">"
        return gets.chomp
    end

    def menu_choice(input)
        if is_still_ongoing?
            case input
            when "a"
                @human_player.search_weapon
            when "s"
                @human_player.search_health_pack 
            when /[0-3]/
                i = input.to_i
                @human_player.attacks(@ennemies[i])
                if @ennemies[i].is_dead?
                    kill_player(i)
                end
            else
                menu_choice(menu)                    
            end
        else
            game_ending
        end
    end

    def enemies_attack
        for ennemy in @ennemies
            ennemy.attacks(@human_player)
            if @human_player.is_dead?
                game_ending
            end
        end
    end

    def game_ending
        if @human_player.is_dead?
            puts "Tu as été tué! La partie est terminée. TRY AGAIN"
        else
            puts "Tu as tué tous les adversaires. La partie est terminée!"
        end
        
    end
end
