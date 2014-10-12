# Welcome the user to the game
  puts "Wecome to Tic-tac-toe!"
#Initialize board positions, so each square has a number
  def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  return b
  end
# Draw board with positions numbered

  def draw_board(b)
    system 'clear'
    puts "  #{b[1]}  |  #{b[2]}  |#{b[3]}  "
    puts "__________________"
    puts "  #{b[4]}  |  #{b[5]}  |#{b[6]}  "
    puts "__________________"
    puts "  #{b[7]}  |  #{b[8]}  |#{b[9]}  "
  end

# Make sure any choice is an empty square

def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

# Player picks a square position, marked with an X

def player_picks_square(b)
  puts "Pick a square position (1-9)."
  position = gets.chomp.to_i
  b[position] = "X"
end

# Computer picks a square position, marked with an O

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end

board = initialize_board
draw_board(board)
# Play game
begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
end until empty_positions(board).empty?



# Start back to asking user then computer until 3 in a row, or stale mate



