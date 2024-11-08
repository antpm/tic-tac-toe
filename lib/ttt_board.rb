class TicTacToeBoard 
	def initialize
		@board = Array.new(9, ' ')
		@turn = 1
		@win = false
	end

	def show_board
		puts "-------"
		@board.length.times do |i|
            (i+1) % 3 == 0 ? puts("|#{@board[i]}|") : print("|#{@board[i]}")
        end
		puts "-------"
	end

	def mark_spot(pos)
		if pos.start_with?(/\s*\d+/) and pos.to_i.between?(1,9) and @board[pos.to_i - 1] == ' '
			@turn.odd? ? @board[pos.to_i - 1] = 'X' : @board[pos.to_i - 1] = 'O'
            winner? ? @win = true : @turn += 1
		else 
			puts "Invalid selection, try again"
		end
	end

	def play_game
		
		until @turn == 10 or @win do 
			puts "-Player #{@turn.odd? ? '1' : '2'}'s Turn-"
			puts "Select a spot from 1 to 9:"
			show_board
			mark_spot(gets.chomp)
		end
        puts "--Game Over--"
        show_board
        @win ? puts("Winner is Player #{@turn.odd? ? '1' : '2'}") : puts("No Winner")
        puts "Play again? Y/N"
        gets.chomp.downcase == 'y' ? reset : puts('Goodbye!')
	end

    def winner? 
        lines = [
        {:a => 0, :b => 1, :c => 2},
        {:a => 3, :b => 4, :c => 5},
        {:a => 6, :b => 7, :c => 8},
        {:a => 0, :b => 3, :c => 6},
        {:a => 1, :b => 4, :c => 7},
        {:a => 2, :b => 5, :c => 8},
        {:a => 0, :b => 4, :c => 8},
        {:a => 2, :b => 4, :c => 6}
        ];

        lines.length.times do |i|
            line = lines[i]
            if @board[line[:a]] != ' ' and @board[line[:a]] == @board[line[:b]] and @board[line[:a]] == @board[line[:c]]
                return true
            end
        end
        false
    end

    def reset
        initialize
        play_game
    end
end