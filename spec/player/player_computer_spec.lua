require "lib/player/player_computer"
require "lib/board"
require "lib/player/player_next_empty"

describe("PlayerComputer", function()
  local pc

  before(function()
    pc = PlayerComputer.create()
  end)

  context("create", function()
    it("can be created", function()
      assert_not_equal(pc, nil)
    end)
  end)

  context("play", function()
    local board = Board.create()

    it("chooses a cell number on an empty board", function()
      local result = pc:play(board)

      assert_greater_than(result, 0)
      assert_less_than(result, 10)
    end)

    it("uses Negamax to choose another cell number", function()
      local pne = PlayerNextEmpty.create()
      local other_side_played = pne:play(board)
      board:set(other_side_played, 'o')

      local result = pc:play(board)
      
      assert_greater_than(result, 0)
      assert_less_than(result, 10)
    end)
  end)

  context("max_value_from_table", function()
    it("returns the largest value present in the table", function()
      local choices = {}
      choices[1] = 100
      choices[2] = 50
      choices[3] = 25
      choices[4] = 100

      assert_equal(pc:max_value_from_table(choices), 100)
    end)
  end)

  context("best_choices", function()
    it("filters the choices of a table that is keyed by weight to the best", function()
      local choices = {}
      choices[1] = 100
      choices[2] = 50
      choices[3] = 25
      choices[4] = 100

      local result = pc:best_choices(choices)
      assert_equal(#(result), 2)
      assert_equal(result[1], 1)
      assert_equal(result[2], 4)
    end)
  end)

  context("random_value_from_table", function()
    it("chooses on of the values from a table", function()
      local choices = { 1, 5, 9 }

      local result = pc:random_value_from_table(choices)
      assert_true(result == 1 or result == 5 or result == 9)
    end)
  end)

end)
