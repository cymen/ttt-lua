require "lib/output"


describe("Output", function()

  context("write", function()
    it("can inject table for output instead of using system output", function()
      local buffer = {}
      local output = Output.create(buffer)

      output:write("Would you like to be x or o (x always goes first)? ")
      assert_equal(buffer[#(buffer)], "Would you like to be x or o (x always goes first)? ")
    end)
  end)

end)
