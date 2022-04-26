class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name)
        @weapon_level = 1
        super(name)
        @life_points = 100
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    end
    
    def search_weapon
        de = rand(1...6)
        puts "Tu as trouvé une arme de niveau #{de}"
        if @weapon_level < de
            @weapon_level = de
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            gets
        else
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
            gets
        end
    end

    def search_health_pack
        de = rand(1...6)
        case de
        when 1
            puts "Tu n'as rien trouvé... "
            gets
        when 6
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points < 20 ? @life_points += 80 : @life_points = 100
            gets
        else
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points < 50 ? @life_points += 50 : @life_points = 100
            gets
        end
    end

end