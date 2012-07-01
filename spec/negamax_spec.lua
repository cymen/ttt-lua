require "lib/board"
require "spec/spec_helper"

local TableUtil = require "lib/table_util"
local Negamax = require "/lib/negamax"

describe("Negamax", function()
  
  context("is_optimal", function()
    it("odd numbers are optimal", function()
      for i = 1,9,2 do
        assert_true(Negamax.is_optimal(i))
      end
    end)
    it("even numbers are not optimal", function()
      for i = 2,8,2 do
        assert_false(Negamax.is_optimal(i))
      end
    end)
  end)

  context("compare_optimal", function()
    it("compares an odd number to an even number", function()
      assert_true(Negamax.compare_optimal(1, 4))
      assert_true(Negamax.compare_optimal(7, 2))
    end)
    it("compares an even number to an odd number", function()
      assert_false(Negamax.compare_optimal(8, 1))
      assert_false(Negamax.compare_optimal(4, 7))
    end)
    it("compares two odd numbers", function()
      assert_true(Negamax.compare_optimal(1, 3))
      assert_false(Negamax.compare_optimal(3, 1))
    end)
    it("compares two even numbers", function()
      assert_true(Negamax.compare_optimal(2, 4))
      assert_false(Negamax.compare_optimal(8, 4))
    end)
  end)

  context("sort_choices_optimally", function()
    it("sorts a list of cell numbers so that the known optimal (odd) are first", function()
      local choices = {1, 2, 3, 4, 5, 6, 7, 8, 9}
      Negamax.sort_choices_optimally(choices)

      assert_have_same_key_value_pairs(choices, {1, 3, 5, 7, 9, 2, 4, 6, 8})
    end)
  end)

  context("run", function()
    it("weights the odd cells as equally optimal on an empty board", function()
      local board = Board.create()
      local weighted_choices = Negamax.run(board)

      assert_have_optimal_moves_of(weighted_choices, {1, 3, 5, 7, 9})
    end)

    it("blocks a winning move of the opponent", function()
      local board = Board.create({ 'x', nil, 'x',
                                   nil, nil, nil,
                                   nil, nil, 'o' })
      local weighted_choices = Negamax.run(board)

      assert_have_optimal_move_of(weighted_choices, 2)
    end)
  end)

  context("analysis", function()
    it("analyzes a tied game", function()
      local board = Board.create({ 'x', 'o', 'x',
                                   'o', 'x', 'o',
                                   'o', 'x', 'o' })

      assert_equal(Negamax.analysis(board, 1), 0)
    end)
  end)

end)
