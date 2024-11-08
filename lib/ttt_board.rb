class TicTacToeBoard 
	def initialize
		@board = Array.new(9, ' ')
		@turn = 1
	end

	def show_board
		puts "-------"
		puts "|#{@board[0]}|#{@board[1]}|#{@board[2]}|"
		puts "|#{@board[3]}|#{@board[4]}|#{@board[5]}|"
		puts "|#{@board[6]}|#{@board[7]}|#{@board[8]}|"
		puts "-------"
	end

	def mark_spot(pos)
		if pos.start_with?(/\s*\d+/) and pos.to_i.between?(0,8) and @board[pos.to_i] == ' '
			@turn.odd? ? @board[pos.to_i - 1] = 'X' : @board[pos.to_i - 1] = 'O'
			@turn += 1
		else 
			puts "Invalid selection, try again"
		end
	end

	def play_game
		
		until @turn == 10 do
			puts "-Player #{@turn.odd? ? '1' : '2'}'s Turn-"
			puts "Select a spot from 1 to 9:"
			show_board
			mark_spot(gets.chomp)
		end
	end
end