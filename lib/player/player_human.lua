require "lib/io/output"
require "lib/io/input"
require "lib/prompter"

PlayerHuman = {}
PlayerHuman.__index = PlayerHuman

function PlayerHuman.create(output, input)
  local player = {}
  setmetatable(player, PlayerHuman)
  if output == nil then
    output = Output.create()
  end
  player.output = output
  if input == nil then
    input = Input.create()
  end
  player.input = input
  player.prompter = Prompter.create(output, input)
  return player
end

function PlayerHuman:play(board)
  self.output:write(board)
  return self.prompter:int_in_list(board:empty_cell_numbers())
end
