require_relative "card.rb"
require "byebug"

class Board

    def initialize(height, length)
        @height  = height
        @length = length
        area = @height * @length
        error_msg = "Please enter max area of 52 with at least one even dimension"
        raise RuntimeError.new error_msg if area.odd? || area > 52
        @grid = Array.new(@height) { Array.new(@length) }
        populate!
    end

    def populate!
        deck = ("A".."Z").to_a.sample(@height * @length / 2)
        deck += deck
        deck.shuffle!
        (0...deck.length).each do |deck_idx|
            grid_row = deck_idx / @length
            grid_col = deck_idx % @length
            # debugger
            @grid[grid_row][grid_col] = Card.new(deck[deck_idx])
        end

    end

    def render
        puts
        puts "REALLY FUN MEMORY GAME"
        #TopRow: offset + col indices joined on space
        toprow = "  " + (0...@length).to_a.join(" ")
        puts toprow
        #EachRow: row index + card_val joined on space
        @grid.each_with_index do |row, row_idx|
            grid_row = row.join(" ")
            puts "#{row_idx} #{grid_row}"
        end
    end

    def won?
        @grid.all? do |row|
            row.all?(&:face_up?)
        end
    end

    def reveal(guessed_pos)
        self[guessed_pos].reveal
        self[guessed_pos].value
    end

    def hide(guessed_pos)
        self[guessed_pos].hide
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end
end