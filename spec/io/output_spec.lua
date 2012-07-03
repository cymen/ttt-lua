require "lib/io/output"

describe("Output", function()
  local buffer, output

  before(function()
    buffer = {}
    output = Output.create(buffer)
  end)

  context("write", function()
    it("writes to injected buffer", function()
      output:write("Would you like to be x or o (x always goes first)? ")

      assert_equal(buffer[1], "Would you like to be x or o (x always goes first)? ")
    end)

    it("converts non-strings to strings for output", function()
      output:write(100)

      assert_equal(buffer[1], "100")
    end)
  end)

  context("write_line_centered", function()
    local StringUtil = require "lib/util/string_util"

    it("centers line of text", function()
      output:write_line_centered("abcd", 20)

      assert_equal(buffer[1], StringUtil.center("abcd", 20) .. "\n")
    end)


    it("can handle numbers", function()
      output:write_line_centered(42, 8)
      
      assert_equal(buffer[1], StringUtil.center(42, 8) .. "\n")
    end)
  end)

end)
