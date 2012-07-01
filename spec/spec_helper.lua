local TableUtil = require "lib/table_util"

telescope.make_assertion(
  "have_optimal_move_of",
  function(message, ...)
    local moves, optimal_move = ...
    local _error = assertion_message_prefix
    _error = _error .. "cell-number -> weighted value map to have optimal move of "
    _error = _error .. optimal_move .. ":\n\t" .. TableUtil.tostring(moves)
    return _error
  end,
  function(moves, optimal_move)
    local move
    local max = TableUtil.max(moves)
    local max_count = 0
    for cell_number, weight in pairs(moves) do
      if max <= weight then
        move = cell_number
        max = weight
        max_count = max_count + 1
        if max_count > 1 then
          return false
        end
      end
    end
    return move == optimal_move
  end
)

telescope.make_assertion(
  "have_optimal_moves_of",
  function(message, ...)
    local moves, optimal_moves = ...
    local max = TableUtil.max(moves)
    local found_optimal_moves = {}
    for cell_number, weight in pairs(moves) do
      if weight == max then
        table.insert(found_optimal_moves, cell_number)
      end
    end
    local _error = assertion_message_prefix
    _error = _error .. "cell-number -> weighted value map to be: "
    _error = _error .. "\n\t" .. TableUtil.tostring(optimal_moves)
    _error = _error .. "\n\t" .. TableUtil.tostring(found_optimal_moves)
    return _error
  end,
  function(moves, optimal_moves)
    local max = TableUtil.max(moves)
    local found_optimal_moves = {}
    for cell_number, weight in pairs(moves) do
      if weight == max then
        table.insert(found_optimal_moves, cell_number)
      end
    end

    return TableUtil.equal(found_optimal_moves, optimal_moves)
  end
)
