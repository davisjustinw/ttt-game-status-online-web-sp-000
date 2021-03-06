require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all? {|item| board[item] == board[combo.first]} && (board[combo.first] == 'X' || board[combo.first] == 'O')
  end
end

def full?(board)
  board.all? { |square| !(square.nil? || square == " ")}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won?(board) ? board[won?(board).first] : nil
end