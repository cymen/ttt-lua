require "lib/io/output"
require "lib/io/input"
require "lib/prompter"
require "lib/player/player_human"
require "lib/player/player_computer"
require "lib/game_loop"

Console = {}
Console.__index = Console

function Console.create(output, input)
  local console = {}
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
  self.output:write("\n")
  self.output:write_line_centered("Tic-Tac-Toe")
  self.output:write("\n")
end

function Console:game(computer)
  local human_is, human, board, loop
  while true do
    human_is = self.prompter:x_or_o()
    
    human = PlayerHuman.create(self.output, self.input)
    if computer == nil then
      computer = PlayerComputer.create()
    end
    board = Board.create()

    if human_is == 'x' then
      loop = GameLoop.create(board, human, computer)
    else
      loop = GameLoop.create(board, computer, human)
    end

    self.winner = loop:run()

    if self.prompter:play_again() == 'n' then
      return
    end
  end
end

function Console:run()
  self:greeting()
  self:game()
end
