require "lib/prompter"
require "lib/io/output"
require "lib/io/input"

describe("Prompter", function()

  context("create", function()
    it("can be created", function()
      local prompter = Prompter.create()
      assert_not_equal(prompter, nil)
    end)
  end)

  local buffer_output, buffer_input, output, input, prompter
  before(function()
    buffer_output = {}
    buffer_input = {}
    output = Output.create(buffer_output)
    input = Input.create(buffer_input)
    prompter = Prompter.create(output, input)
  end)

  context("x_or_o", function()
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

  context("int_in_list", function()
    it("asks player to choose an integer from a supplied list", function()
      local list = {1, 2, 3}
      table.insert(buffer_input, 2)

      assert_equal(prompter:int_in_list(list), 2)
      assert_equal(buffer_output[1], "Choose a space from 1, 2, 3: ")
    end)

    it("continues to ask until an integer in the list is given", function()
      local list = {1, 2, 3}
      table.insert(buffer_input, 0)
      table.insert(buffer_input, 10)
      table.insert(buffer_input, 42)
      table.insert(buffer_input, 3)

      assert_equal(prompter:int_in_list(list), 3)
    end)
  end)

  context("play_again", function()
    it("asks player if they would like to play again", function()
      table.insert(buffer_input, 'n')

      assert_equal(prompter:play_again(), 'n')
      assert_equal(buffer_output[1], "Play again (y/n)? ")
    end)

    it("is case insensitive", function()
      table.insert(buffer_input, 'N')
      
      assert_equal(prompter:play_again(), 'n')
    end)

    it("continues to prompt until correct answer given", function()
      table.insert(buffer_input, 'z')
      table.insert(buffer_input, 'q')
      table.insert(buffer_input, '?')
      table.insert(buffer_input, 'N')
      
      assert_equal(prompter:play_again(), 'n')
    end)
  end)

end)
