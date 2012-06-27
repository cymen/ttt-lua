require "lib/prompter"
require "lib/output"
require "lib/input"

describe("Prompter", function()

  context("create", function()
    it("can be created", function()
      local prompter = Prompter.create()
      assert_not_equal(prompter, nil)
    end)
  end)


  context("x_or_o", function()
    local buffer_output, buffer_input, output, input, prompter
    before(function()
      buffer_output = {}
      buffer_input = {}
      output = Output.create(buffer_output)
      input = Input.create(buffer_input)
      prompter = Prompter.create(output, input)
    end)

    it("asks if player wants to be x or o", function()
      table.insert(buffer_input, "x")
      assert_equal(prompter:x_or_o(), "x")
      assert_equal(buffer_output[1], "Would you like to be x or o (x always goes first)? ")
    end)

    it("is case-insensitive to answer", function()
      table.insert(buffer_input, "X")
      assert_equal(prompter:x_or_o(), "x")
    end)

    it("continues to ask until correct response is given", function()
      table.insert(buffer_input, "z")
      table.insert(buffer_input, "q")
      table.insert(buffer_input, "o")
      assert_equal(prompter:x_or_o(), "o")
    end)
  end)

end)
