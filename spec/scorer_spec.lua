require "lib/board"
local Scorer = require "/lib/scorer"

describe("Scorer", function()

  context("turn", function()
    local board
    before(function()
      board = Board.create()
    end)

    it("is x for an empty board", function()
      assert_equal('x', Scorer.turn(board))
    end)
    
    it("is o when x has played once", function()
      board:set(1, 'x')

      assert_equal('o', Scorer.turn(board))
    end)
  end)

  context("is_tie", function()
    it("returns false if the game has been won", function()
      local board = Board.create({ 'x', 'o', 'o',
                                   'o', 'x', 'x',
                                   'x', 'o', 'x'})

      assert_false(Scorer.is_tie(board))
    end)
  end)

  context("incomplete unwon game", function()
    local board = Board.create({ 'x', 'o', 'x',
                                 'x', 'o', 'x',
                                 'o', 'x', nil})
    
    it("not tied, won nor over", function()
      assert_false(Scorer.is_tie(board))
      assert_false(Scorer.is_won(board))
      assert_false(Scorer.is_over(board))
    end)
  end)

  context("complete unwon game", function()
    local board = Board.create({ 'x', 'o', 'x',
                                 'x', 'o', 'x',
                                 'o', 'x', 'o'})

    it("is tied and over but not won", function()
      assert_true(Scorer.is_tie(board))
      assert_false(Scorer.is_won(board))
      assert_true(Scorer.is_over(board))
    end)
  end)

  context("won game", function()
    local board = Board.create({ 'x', 'o', nil,
                                 nil, 'x', 'o',
                                 nil, nil, 'x'})

    it("is won by 'x' and over but not tied", function()
      assert_true(Scorer.is_won(board))
      assert_equal(Scorer.winner(board), 'x')
      assert_true(Scorer.is_over(board))
      assert_false(Scorer.is_tie(board))
    end)
  end)

end)
