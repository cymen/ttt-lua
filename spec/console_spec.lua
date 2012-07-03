require "lib/console"
require "lib/io/output"
require "lib/io/input"
require "lib/board"
require "lib/player/player_next_empty"

describe("Console", function()
  local output_buffer, input_buffer, output, input, board

  before(function()
    output_buffer = {}
    input_buffer = {}
    output = Output.create(output_buffer)
    input = Input.create(input_buffer)
    board = Board.create(output, input)
  end)

  context("create", function()
    it("can be created", function()
      local console = Console.create(output, input)

      assert_not_equal(console, nil)
    end)
  end)

  context("run", function()
    it("calls greeting() and game()", function()
      local console = Console.create(output, input)
      local greeting_called = false
      local game_called = false

      console.greeting = function() greeting_called = true end
      console.game = function() game_called = true end

      assert_false(greeting_called)
      assert_false(game_called)

      console:run()

      assert_true(greeting_called)
      assert_true(game_called)
    end)
  end)

  context("game", function()
    it("can play a game", function()
      local console = Console.create(output, input)

      table.insert(input_buffer, 'x')     -- play as x
      table.insert(input_buffer, 1)       -- cell 1, dumb player will then choose 2
      table.insert(input_buffer, 5)       -- cell 5, dumb player then chooses 3
      table.insert(input_buffer, 9)       -- cell 9 and we win
      table.insert(input_buffer, 'n')     -- don't play again

      local winner = console:game(PlayerNextEmpty.create())

      assert_equal(winner, 'x')
    end)
  end)

  context("over", function()
    local StringUtil = require "lib/util/string_util"

    it("displays the board and says who won the game", function()
      local console = Console.create(output, input)

      console:over(board, 'x')

      assert_equal(output_buffer[1], tostring(board))
      assert_equal(output_buffer[2], StringUtil.center("x won!", 80) .. "\n")
    end)
    
    it("when tied, shows board and displays tied message", function()
      local console = Console.create(output, input)

      console:over(board)

      assert_equal(output_buffer[1], tostring(board))
      assert_equal(output_buffer[2], StringUtil.center("Tied!", 80) .. "\n")
    end)
  end)

end)
