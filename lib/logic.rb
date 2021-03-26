# frozen_string_literal: true

# Game Logic Class
class Game
  POSSIBLE_WINS = [[0, 1, 2],
                   [3, 4, 5],
                   [6, 7, 8],
                   [0, 3, 6],
                   [1, 4, 7],
                   [2, 5, 8],
                   [0, 4, 8],
                   [6, 4, 2]].freeze
  @@cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  def initialize
    @board_display = " #{@@cells[0]} | #{@@cells[1]} | #{@@cells[2]} ",
                     "\n---+---+---\n",
                     " #{@@cells[3]} | #{@@cells[4]} | #{@@cells[5]} ",
                     "\n---+---+---\n",
                     " #{@@cells[6]} | #{@@cells[7]} | #{@@cells[8]} \n"
  end

  def cel
    @@cells
  end

  def verify
    POSSIBLE_WINS.any? do |arr|
      ((@@cells[arr[0]] == @@cells[arr[1]]) && (@@cells[arr[0]] == @@cells[arr[2]]))
    end
  end

  def full
    @@cells.all?(String)
  end
end
