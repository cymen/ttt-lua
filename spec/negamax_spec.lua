require "lib/negamax"
require "lib/board"

describe("Negamax", function()
  local negamax

  before(function()
    negamax = Negamax.create()
  end)

  context("create", function()
    it("can be created", function()
      assert_not_equal(negamax, nil)
    end)
  end)

  context("is_optimal", function()
    it("odd numbers are optimal", function()
      for i = 1,9,2 do
        assert_true(negamax:is_optimal(i))
      end
    end)
    it("even numbers are not optimal", function()
      for i = 2,8,2 do
        assert_false(negamax:is_optimal(i))
      end
    end)
  end)

  context("compare_optimal", function()
    it("compares an odd number to an even number", function()
      assert_true(negamax:compare_optimal(1, 4))
      assert_true(negamax:compare_optimal(7, 2))
    end)
    it("compares an even number to an odd number", function()
      assert_false(negamax:compare_optimal(8, 1))
      assert_false(negamax:compare_optimal(4, 7))
    end)
    it("compares two odd numbers", function()
      assert_true(negamax:compare_optimal(1, 3))
      assert_false(negamax:compare_optimal(3, 1))
    end)
    it("compares two even numbers", function()
      assert_true(negamax:compare_optimal(2, 4))
      assert_false(negamax:compare_optimal(8, 4))
    end)
  end)

  context("sort_choices_optimally", function()
    it("sorts a list of cell numbers so that the known optimal (odd) are first", function()
      local choices = {1, 2, 3, 4, 5, 6, 7, 8, 9}
      negamax:sort_choices_optimally(choices)

      for i = 1,9 do
        if i < 6 then
          assert_true(choices[i] % 2 == 1)
        else
          assert_true(choices[i] % 2 == 0)
        end
      end
    end)
  end)

  context("run", function()
    it("weights the odd cells as equally optimal on an empty board", function()
      local board = Board.create()
      local weighted_choices = negamax:run(board)

      assert_have_optimal_moves_of(weighted_choices, {1, 3, 5, 7, 9})
    end)

    it("blocks a winning move of the opponent", function()
      local board = Board.create({ 'x', nil, 'x',
                                   nil, nil, nil,
                                   nil, nil, 'o' })
      local weighted_choices = negamax:run(board)

      assert_have_optimal_move_of(weighted_choices, 2)
    end)
  end)

  context("analysis", function()
    it("analyzes a tied game", function()
      local board = Board.create({ 'x', 'o', 'x',
                                   'o', 'x', 'o',
                                   'o', 'x', 'o' })

      assert_equal(negamax:analysis(board, 1), 0)
    end)
  end)

end)
