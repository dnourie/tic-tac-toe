# Assign each square to a number
# Assign user to a x or o
# Assign computer an x or o
# Ask user to choose a square
# Have computer choose a square that is not taken
# Start back to asking user then computer until 3 in a row, or stale mate
# When game done, ask if user wants to play again
#___________________________________

# Welcome the user to the game
  puts "Wecome to Tic-tac-toe!"
  puts "Do you want to play? (Yes/No)"
  response = gets.chomp.downcase
    until response == "no" do
  #Initialize board positions, so each square has a number
      def initialize_board
      b = {}
      (1..9).each {|square| b[square] = ' '}
      return b
      end

    # Draw board with squares numbered

      def draw_board(b)
        system 'clear'
        puts "\n"
        puts "  #{b[1]}  |  #{b[2]}  |#{b[3]}  "
        puts "__________________"
        puts "  #{b[4]}  |  #{b[5]}  |#{b[6]}  "
        puts "__________________"
        puts "  #{b[7]}  |  #{b[8]}  |#{b[9]}  "
      end

  # Check for empty postions
      def empty_squares(b)
        b.keys.select { |square| b[square] == ' ' }
      end

      # Player picks a square square, marked with an X, but it must be an empty square
      def player_picks_square(b)
        begin
          puts "Pick a square (1 - 9):"
          square = gets.chomp.to_i
        end until empty_squares(b).include?(square)
        b[square] = "X"
      end
  # Computer picks an empty square, marked with an O

      def computer_picks_square(b)
        square = empty_squares(b).sample
        b[square] = "O"
      end

      def check_winner board
        winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], 
                        [3,5,7], [1,4,7], [2,5,8], [3,6,9]]
        winning_lines.each do |line|
          return "Player" if board[line[0]] == "X" and board[line[1]] == "X" and board[line[2]] == "X"
          return "Computer" if board[line[0]] == "O" and board[line[1]] == "O" and board[line[2]] == "O"
        end
        nil
      end

      board = initialize_board
      draw_board(board)

      # Play game and loop until someone wins
      begin
        player_picks_square(board)
        computer_picks_square(board)
        draw_board(board)
        winner = check_winner(board)
      end until winner || empty_squares(board).empty?

      if winner
        puts "#{winner} won!"
      else
        puts "It's a tie!"
      end
      puts "Do you want to play again? (Yes/No)"
      response = gets.chomp.downcase
    end

# Bugs: 
# - (Done!)If square taken, it gets overwritten! Check to be sure player can only select empty positions!
# - (Done!)3 postions in a row does not always win.