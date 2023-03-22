require_relative "board.rb"

class Game
    def initialize(height, length)
        @previous_guess = nil
        @previous_pos = nil
        @board = Board.new(height, length)
        @guess_count = 0
    end

    def play
        
        until @board.won?
            @board.render
            sleep(1) if @previous_guess == nil

            guess_pos = get_guess
            @board.reveal(guess_pos)
            @board.render
            
            if @previous_guess == nil
            else
                

            end

            #check guess.
            #if first guess, loop
            #if second guess
            #   if match
            #       Immediate show it's a match!
            #       Render
            #   if not match
            #       Render
            #       wait (0.5)
            #       "Try again"
            #       

            # @board.render
            # make_guess(guess_pos)
            # @board.render
            
        end
        puts "Nice. You won in #{@guess_count} tries~!"
        #Stuff that happens when won
    end

    def get_guess
        puts "Current guesses: #{@guess_count}"
        puts "Make a guess: (e.g. '2,3') "
        guess_pos = gets.chomp.split(",").map(&:to_i)
        guess_pos
    end

    def make_guess(guess_pos)
        # persisting_guess = true
        # @guess_count += 1
        # if @previous_guess == nil
        #     @board.reveal(guess_pos)
        #     @previous_guess = @board[guess_pos]
        #     @previous_pos = guess_pos
        # else
        #     if @previous_guess == @board[guess_pos]
        #         @board.reveal(guess_pos)
        #         @previous_guess = nil
        #         @previous_pos = nil
        #     else
        #         #Reveal mismatched second card for 1 sec.
        #         @board.reveal(guess_pos)
        #         @board.hide(guess_pos)
        #         #Hide after revealing for 1 sec.
        #         @board.hide(@previous_pos)
        #         @previous_guess, @previous_pos = nil
        #         persisting_guess = false
        #     end
        # end
        # persisting_guess
    end
end