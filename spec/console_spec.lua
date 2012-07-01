require "lib/console"
require "lib/io/output"
require "lib/io/input"
require "lib/board"
require "lib/player_next_empty"

describe("Console", function()
  local output_buffer, input_buffer, output, input, board

  before(function()
    output_buffer = {}
    input_buffer = {}
    output = Output.create(output_buffer)
    input = Input.create(input_buffer)
    board = Board.create(output, input)
    console = Console.create(output, input)
  end)

  context("create", function()
    it("can be created", function()
      assert_not_equal(console, nil)
    end)
  end)

  context("game", function()
    it("can play a game", function()
      table.insert(input_buffer, 'x')     -- play as x
      table.insert(input_buffer, 1)       -- cell 1, dumb player will then choose 2
      table.insert(input_buffer, 5)       -- cell 5, dumb player then chooses 3
      table.insert(input_buffer, 9)       -- cell 9 and we win
      table.insert(input_buffer, 'n')     -- don't play again

      console:game(PlayerNextEmpty.create())

      assert_equal(console.winner, 'x')
    end)
  end)

end)
