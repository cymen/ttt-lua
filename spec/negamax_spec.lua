require "lib/negamax"

describe("Negamax", function()
  local negamax

  before(function()
    negamax = Negamax.create()
  end)

  context("create", function()
    it ("can be created", function()
      assert_not_equal(negamax, nil)
    end)
  end)


end)
