#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/user'
require_relative '../lib/board'
require_relative '../lib/logic'
require_relative '../lib/computer'

computer = false
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
until answer == 'computer'
  puts "\nWould you like to play against the computer? Write \"yes\" or \"no\""
  answer = gets.chomp.downcase
  if answer == 'yes'
    computer = true
    break
  elsif answer == 'no'
    computer = false
    break
  end
end
comp = Computer.new
inpp = ""
if computer
puts "\n\nChoose difficulty!!!\n"
puts "\nBeginner/Easy press \'e\'\n"
puts "\nAdvanced/Medium press \'m\'\n"
puts "\nNightmare/Hard press \'h\'\n\n\n"

until inpp == "y"
inpp = gets.chomp
if inpp == "e" || inpp == "m" || inpp == "h"
  comp.difficulty(inpp)
  break
end
puts "Choose between \'e\' or \'m\' or \'h\'"
end
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

if computer == false
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
    puts "\nPlayerTwo\nYour name is #{player2.name[0..-3]}
  and your marker is #{player2.mark}"
  else
    puts "\nPlayerTwo\nYour name is #{player2.name}
  and your marker is #{player2.mark}"
  end
else
  puts "\n\n You will have to destroy the terminator before he destroys all humankind!!!\n\n"
  sleep 2
end

comp.marke = player1.mark == 'x' ? 'o' : 'x'
print " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"

winning = false
until winning
  if winning
      break 
    
  elsif board.verify && turn
    if computer
      puts 'The Terminator has destroyed all humankind and has won the game!!!'
    else
      puts "#{player1.name} has won the game!!!"
    end
    sleep 2
    puts "Do you want to play again? write \"y\" or \"n\""
    answer = ""
    until answer == "y"
      answer = gets.chomp.downcase
      if answer == "y"
        board = Board.new
        puts board.display
        sleep 1
        break
      elsif answer =="n"
        winning = true
        break
      end
      puts "Write \'y\' to play again or \'n\' to stop playing."
    end
  elsif board.verify
    if computer
      puts 'You have destroyed the Terminator and saved the world by winning the game!!!'
    else
      puts "#{player2.name} has won the game!!!"
    end     
    sleep 2
    puts "Do you want to play again? write \"y\" or \"n\""
    answer = ""
    until answer == "y"
      answer = gets.chomp.downcase
      if answer == "y"
        board = Board.new
        puts board.display
        sleep 1
        break
      elsif answer =="n"
        winning = true
        break
      end
      puts "Write \'y\' to play again or \'n\' to stop playing."
    end
  elsif board.full
    puts "It's a draw!!!!"
    sleep 2
    puts "Do you want to play again? write \"y\" or \"n\""
    answer = ""
    until answer == "y"
      answer = gets.chomp.downcase
      if answer == "y"
        board = Board.new
        puts board.display
        sleep 1
        break
      elsif answer =="n"
        winning = true
        break
      end
      puts "Write \'y\' to play again or \'n\' to stop playing."
    end
   
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
    if computer
      sleep 1
      inp = comp.play
      board.update(inp, comp.mark)
      puts "\nThe Terminator strikes square #{inp}"
      puts board.display
      turn = true
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
end
