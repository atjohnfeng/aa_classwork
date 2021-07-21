class Card 

    POSSIBLE_CARDS = ('a'..'z').to_a

    attr_reader :face_value, :hidden

    def initialize
        @hidden = true 
        @face_value = POSSIBLE_CARDS.sample
    end

    def reveal
        @hidden = false
    end

    def generate_second_card(value)
        Card.new
        @face_value = value
    end


end 