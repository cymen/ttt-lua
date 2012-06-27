require "lib/input"

describe("Input", function()
  local buffer = {}
  local input = Input.create(buffer)

  context("read_line", function()
    it("reads from injected buffer", function()
      table.insert(buffer, "This is a test!")
      assert_equal(input:read_line(), "This is a test!")

      table.insert(buffer, "Another line of input.")
      assert_equal(input:read_line(), "Another line of input.")
    end)
  end)

  context("read number", function()
    it("can inject table for input instead of using system input", function()
      table.insert(buffer, 42)
      assert_equal(input:read_number(), 42)

      table.insert(buffer, 8)
      assert_equal(input:read_number(), 8)
    end)
  end)
end)
