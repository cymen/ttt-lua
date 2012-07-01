require "lib/player_human"
require "lib/io/output"
require "lib/io/input"
require "lib/board"

describe("PlayerHuman", function()

  context("create", function()
    it("can be created", function()
      local player = PlayerHuman.create()
      assert_not_equal(player, nil)
    end)
  end)

  context("play", function()
    local output_buffer, input_buffer, output, input, board, player
    before(function()
      output_buffer = {}
      input_buffer = {}
      output = Output.create(output_buffer)
      input = Input.create(input_buffer)
      board = Board.create()
      player = PlayerHuman.create(output, input)
    end)


    it("it displays the board", function()
      table.insert(input_buffer, 1)
      player:play(board)

      assert_equal(output_buffer[1], "_, _, _\n")
      assert_equal(output_buffer[2], "_, _, _\n")
      assert_equal(output_buffer[3], "_, _, _\n")
      assert_equal(output_buffer[#(output_buffer)], "Choose a space from 1, 2, 3, 4, 5, 6, 7, 8, 9: ")
    end)
  end)
end)
