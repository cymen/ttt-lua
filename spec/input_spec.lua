require "lib/io/input"

describe("Input", function()
  local buffer, input

  before(function()
    buffer = {}
    input = Input.create(buffer)
  end)

  context("read_line", function()
    it("reads from injected buffer", function()
      table.insert(buffer, "This is a test!")
      assert_equal(input:read_line(), "This is a test!")

      table.insert(buffer, "Another line of input.")
      assert_equal(input:read_line(), "Another line of input.")
    end)

    it("reads lines from beginning to end of injected buffer", function()
      table.insert(buffer, "line #1")
      table.insert(buffer, "line #2")
      table.insert(buffer, "line #3")

      assert_equal(input:read_line(), "line #1")
      assert_equal(input:read_line(), "line #2")
      assert_equal(input:read_line(), "line #3")
    end)

    it("read returns nil when end of injected buffer reached", function()
      table.insert(buffer, "The Mole had been working very hard all the morning...")
      assert_equal(input:read_line(), "The Mole had been working very hard all the morning...")
      assert_equal(input:read_line(), nil) 
    end)
  end)

  context("read number", function()
    it("reads from injected buffer", function()
      table.insert(buffer, 42)
      assert_equal(input:read_number(), 42)

      table.insert(buffer, 8)
      assert_equal(input:read_number(), 8)
    end)
  end)

end)
