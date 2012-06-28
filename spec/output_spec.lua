require "lib/output"

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
  end)

  context("write_line_centered", function()
    it("centers line of text", function()
      output:write_line_centered("abcd", 20)

      assert_equal(buffer[1], "        abcd\n")
    end)

    it("prints without padding if string is longer than width", function()
      output:write_line_centered("abcd", 2)

      assert_equal(buffer[1], "abcd\n")
    end)

    it("default to width of 80 if none provided", function()
      output:write_line_centered("abcd")

      assert_equal(buffer[1], "                                      abcd\n")
    end)

    it("on odd length lines it 'floats' to the left by one column off center", function()
      output:write_line_centered("abc", 8)
      
      assert_equal(buffer[1], "  abc\n")
    end)
  end)

end)
