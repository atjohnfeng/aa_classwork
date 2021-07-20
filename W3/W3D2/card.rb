class Card 

    POSSIBLE_CARDS = ('a'..'z').to_a

    def initialize(face_value)
        @hidden = true 
        @face_value = face_value
    end

end 