#!/usr/bin/env ruby

require_relative '../lib/user'
require_relative '../lib/board'
require_relative '../lib/logic'

turn = true

puts "Welcome to Tic-Tac-Toe\n\n"
puts ' X | X |   '
puts '---+---+---'
puts ' O | O | O '
puts '---+---+---'
puts '   | O | X '
answer = ''
board = Board.new
until answer == 'y'
  puts "\nWould you like to play a game of Tic-Tac-Toe? Write \"y\" to continue"

  answer = gets.chomp.downcase
end

puts "\nGame Instructions"
puts '-----------------'
puts "\n  1)The game is played on a grid that's 3 squares by 3 squares.\n"
puts "\n  2)Write a number between 1 and 9\n
  to select the row and column respectively that you want to play on.\n"
puts "\n  3)Once a player gets 3 marks in a row\n
  (up, down, across, or diagonally) is the winner.\n"
puts "\n  4)If all 9 squares are full the game is over.\n"

player2name = ''
player1name = ''
puts "\nPlayerOne\n"
while player1name.empty?
  puts 'Enter name:'
  player1 = User.new(gets.chomp.capitalize)
  player1name = player1.name
  break unless player1name.empty?

  puts 'Name can\'t be blank!'

end

until player1.mark == 'x' || player1.mark == 'o'
  puts "\nChoose between X and O"
  player1.marker = gets.chomp.downcase
end
if player1.name[-2] == "\'"
  puts "\nPlayerOne\nYour name is #{player1.name[0..-3]}
and your marker is #{player1.mark}"
else
  puts "\nPlayerOne\nYour name is #{player1.name}
and your marker is #{player1.mark}"
end
puts "\nPlayerTwo\n"
while player2name.empty?
  puts 'Enter name:'
  player2 = User.new(gets.chomp.capitalize)
  player2name = player2.name
  break unless player2name.empty?

  puts 'Name can\'t be blank!'

end
player2.marker = player1.mark == 'x' ? 'o' : 'x'
if player2.name[-2] == "\'"
  puts "\nPlayerOne\nYour name is #{player2.name[0..-3]}
  and your marker is #{player2.mark}"
else
  puts "\nPlayerOne\nYour name is #{player2.name}
  and your marker is #{player2.mark}"
end
print " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"

winning = false
until winning

  if board.verify && turn
    puts "#{player2.name} has won the game!!!"
    break
  elsif board.verify
    puts "#{player1.name} has won the game!!!"
    break
  elsif board.full
    puts "It's a draw!!!!"
    break
  elsif turn
    puts "\nIt is #{player1.name} turn"
    puts 'Enter a value between 1-9.'
    inp = gets.chomp.to_i

    if board.valid(inp)
      board.update(inp, player1.mark)
      puts board.display
      turn = false

    else
      puts 'invalid input'
    end
  else
    puts "\nIt is #{player2.name} turn"
    puts 'Enter a value between 1-9'
    inp = gets.chomp.to_i

    if board.valid(inp)
      board.update(inp, player2.mark)
      puts board.display
      turn = true

    else
      puts 'invalid input'
    end

  end
end
