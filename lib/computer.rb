# frozen_string_literal: true

require_relative 'board'
class Computer < Board
  attr_reader :name

  attr_writer :marke
  def initialize
    @name = 'Terminator'
  end

  def mark
    @marke
  end

  def cells
    @@cells
  end

  def possible
    POSSIBLE_WINS.any? do |arr|
      ((@@cells[arr[0]] == @@cells[arr[1]]) && @@cells[arr[2]].class != String) || ((@@cells[arr[0]] == @@cells[arr[2]]) && @@cells[arr[1]].class != String) || ((@@cells[arr[1]] == @@cells[arr[2]]) && @@cells[arr[0]].class != String)
    end
  end

  def play
    if @@cells[4].class != String
      5
    elsif possible

      POSSIBLE_WINS.each do |arr|
        if (@@cells[arr[0]] == @@cells[arr[1]]) && (@@cells[arr[2]].class != String)

          return (arr[2] + 1)
        elsif @@cells[arr[0]] == @@cells[arr[2]] && (@@cells[arr[1]].class != String)

          return (arr[1] + 1)
        elsif @@cells[arr[1]] == @@cells[arr[2]] && (@@cells[arr[0]].class != String)

          return (arr[0] + 1)

        end
      end
    else

      @@cells.each_with_index do |n, i|
        next unless n.class != String

        return i + 1

        break
      end
    end
  end
end
