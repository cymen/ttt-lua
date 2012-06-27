require "lib/board"
require "lib/scorer"

describe("Scorer", function()

  context("create", function()
    it("can create a scorer with board reference", function()
      local board = Board.create()
      local scorer = Scorer.create(board)
      assert_equal(scorer.board, board)
    end)
  end)

  context("incomplete unwon game", function()
    local board = Board.create({ 'x', 'o', 'x',
                                 'x', 'o', 'x',
                                 'o', 'x', nil})
    local scorer = Scorer.create(board)

    it("not tied, won nor over", function()
      assert_false(scorer:is_tie())
      assert_false(scorer:is_won())
      assert_false(scorer:is_over())
    end)
  end)

  context("complete unwon game", function()
    local board = Board.create({ 'x', 'o', 'x',
                                 'x', 'o', 'x',
                                 'o', 'x', 'o'})
    local scorer = Scorer.create(board)

    it("is tied and over but not won", function()
      assert_true(scorer:is_tie())
      assert_false(scorer:is_won())
      assert_true(scorer:is_over())
    end)
  end)
  context("won game", function()
    local board = Board.create({ 'x', 'o', nil,
                                 nil, 'x', 'o',
                                 nil, nil, 'x'})
    local scorer = Scorer.create(board)

    it("is won and over but not tied", function()
      assert_false(scorer:is_tie())
      assert_true(scorer:is_won())
      assert_true(scorer:is_over())
    end)
  end)

end)
