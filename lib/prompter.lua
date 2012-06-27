require "lib/output"
require "lib/input"

Prompter = {}
Prompter.__index = Prompter

function Prompter.create(output, input)
  prompter = {}
  setmetatable(prompter, Prompter)
  if output ~= nil then
    prompter.output = output
  else
    prompter.output = Output.create()
  end
  if input ~= nil then
    prompter.input = input
  else
    prompter.input = Input.create()
  end
  return prompter
end

function Prompter:x_or_o()
  while true do
    self.output:write("Would you like to be x or o (x always goes first)? ")
    answer = self.input:read_line()
    answer = answer:lower()

    if answer == 'x' or answer == 'o' then
      return answer
    end
  end
end

function Prompter:int_in_list(list)
  local prompt = "Choose a space from " .. table.concat(list, ", ") .. ": "
  local valid_answers = {}
  for _, value in pairs(list) do
    valid_answers[value] = true
  end

  while true do
    self.output:write(prompt)
    answer = self.input:read_line()
    if valid_answers[answer] then
      return answer
    end
  end
end
