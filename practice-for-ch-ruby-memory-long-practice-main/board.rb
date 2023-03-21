require_relative "card.rb"

class Board

    def initialize(width, length)
        @width  = width
        @length = length
        area = @width * @length
        error_msg = "Please enter max area of 52 with at least one even dimension"
        raise RuntimeError.new error_msg if area.odd? && area > 52
        @grid = Array.new(width) { Array.new(length) }
        populate!
    end

    def populate!
        #Based on a "deck"
        #We need to generate a list of n unique cards,
        #n == @grid (length * height) / 2,
        #then for each card, fill in random positions in @grid twice.
        deck = ("A".."Z").to_a.sample(@width * @length / 2)

        #Rather than rolling the dice and hoping to hit a blank each time,
        #this will introduce a lot of un-useful iterations, towards the end,
        #we will have a higher chance of rolling an occupied spot, until we roll
        #an unoccupied spot.
        deck.each do |card_val| #Per unique card, fill 2 random spots in @grid
            2.times do 
                rand_row = rand(0...@width)
                rand_col = rand(0...@length)
                #BUG BELOW - FIXED --------------##
                #We defined Card#== to check equivalency based on value.
                #Here we check if a space in grid is empty: nil at first. 
                #However once it's filled, Card == nil will cause this to
                #Check for #value in both sides, and there is no nil#value method.
                #Accounted for this using duck typing, by adding to our method Card#==:
                #return false if !other_card.respond_to?(:value) - basically if
                #other card does not have a #value getter method.
                #Checked using pry#wtf to locate below line calling it!
                until @grid[rand_row][rand_col] == nil # Card == nil
                    rand_row = rand(0...@width)
                    rand_col = rand(0...@length)
                end
                @grid[rand_row][rand_col] = Card.new(card_val)
            end
        end
        

    end

    def random_position
        rand_row = rand(0...@width)
        rand_col = rand(0...@length)
        [rand_row, rand_col]
    end


end