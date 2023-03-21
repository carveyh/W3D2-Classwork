require "byebug"

class Card

    attr_reader :value

    def initialize(value)
        @value = value
        @face_up = false
    end

    def ==(other_card) #Custom #== where we compare based on the face val of cards.
        # debugger
        # return false if !other_card.respond_to?(:value)
        return false if other_card.nil?
        self.value == other_card.value
    end

    def to_s
        if face_up?
            self.value.to_s
        else
            " "
        end
    end

    def face_up?
        @face_up
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

end