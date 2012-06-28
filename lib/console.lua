require "lib/output"
require "lib/input"
require "lib/prompter"
require "lib/player_human"
require "lib/player_next_empty"
require "lib/game_loop"

Console = {}
Console.__index = Console

function Console.create(output, input)
  console = {}
  setmetatable(console, Console)
  if output == nil then
    output = Output.create()
  end
  console.output = output
  if input == nil then
    input = Input.create()
  end
  console.input = input
  console.prompter = Prompter.create(output, input)
  return console
end

function Console:greeting()
  self.output:write_line_centered("Tic-Tac-Toe")
end

function Console:game()
  local human_is, human, computer, board, loop
  while true do
    human_is = self.prompter:x_or_o()
    
    human = PlayerHuman.create(self.output, self.input)
    computer = PlayerNextEmpty.create()
    board = Board.create()

    if human_is == 'x' then
      loop = GameLoop.create(board, human, computer)
    else
      loop = GameLoop.create(board, computer, human)
    end

    loop:run()
    self.winner = loop.winner

    if self.prompter:play_again() == 'n' then
      return
    end
  end
end

function Console:run()
  self:greeting()
  self:game()
end
