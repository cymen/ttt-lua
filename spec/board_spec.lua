require "lib/board"

describe("Board", function() 
  it("can be created", function()
    b = Board.create()
    assert_not_equal(b, nil)
  end)
end)
