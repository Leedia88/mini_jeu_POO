class Player

    attr_accessor :name, :life_points

    def initialize (name)
        @name = name
        @life_points = 10
        @alive = true
    end

    def show_state
        if !@alive
            puts "RIP #{name}"
        else
            puts "#{name} a #{life_points} points de vie"
        end
    end

    def gets_damage(points)
        @life_points -= points
        if @life_points <= 0
            puts "le joueur #{@name} a été tué !"
            @alive = false
        end
    end

    def attacks(player)
        puts "#{@name} attaque #{player.name} : "
        damage = compute_damage
        puts " " * 10  + "==> #{@name} lui inflige #{damage} points de dommages"
        player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end

    def is_dead?
        return !@alive
    end
end

# binding.pry