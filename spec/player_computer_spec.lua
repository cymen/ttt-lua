require "lib/player_computer"
require "lib/board"

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
    it("choose a cell number on an empty board", function()
      local board = Board.create()
      
      local result = pc:play(board)
      assert_greater_than(result, 0)
      assert_less_than(result, 10)
    end)
  end)

end)
