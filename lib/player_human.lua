require "lib/output"
require "lib/input"
require "lib/prompter"
require "lib/board_printer"

PlayerHuman = {}
PlayerHuman.__index = PlayerHuman

function PlayerHuman.create(output, input)
  player = {}
  setmetatable(player, PlayerHuman)
  if output ~= nil then
    player.output = output
  else
    player.output = Output.create()
  end
  if input ~= nil then
    player.input = input
  else
    player.input = Input.create()
  end
  player.prompter = Prompter.create(player.output, player.input)
  player.board_printer = BoardPrinter.create(player.output)
  return player
end

function PlayerHuman:play(board)
  self.board_printer:print(board)
  return self.prompter:int_in_list(board:empty_cell_numbers())
end
