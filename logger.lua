local colors = {
  [0] = 15,
  [1] = 0,
  [2] = 4,
  [3] = 2,
  [4] = 1,
  [5] = 3,
  [6] = 5,
  [7] = 3,
  [8] = 11,
  [9] = 10,
  [10] = 6,
  [11] = 14,
  [12] = 12,
  [13] = 13,
  [14] = 8,
  [15] = 7
}
local Logger
do
  local _class_0
  local _base_0 = {
    level = {
      error = '\00304',
      reset = '\003',
      warn = '\00308',
      okay = '\00303',
      fatal = '\00305',
      debug = '\00306'
    },
    print = function(line)
      return print(line:gsub('\003(%d%d?),(%d%d?)', function(fg, bg)
        fg, bg = tonumber(fg), tonumber(bg)
        if colors[fg] and colors[bg] then
          return '\27[38;5;' .. colors[fg] .. ';48;5;' .. colors[bg] .. 'm'
        end
      end):gsub('\003(%d%d?)', function(fg)
        fg = tonumber(fg)
        if colors[fg] then
          return '\27[38;5;' .. colors[fg] .. 'm'
        end
      end):gsub('\003', function()
        return '\27[0m'
      end) .. '\27[0m')
    end,
    log = function(line)
      return Logger.print_bare(os.date('[%X]'):gsub('.', function(ch)
        if ch:match('[%[%]:]') then
          return '\00311' .. ch .. '\003'
        else
          return '\00315' .. ch .. '\003'
        end
      end) .. ' ' .. line)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Logger"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Logger = _class_0
end
return Logger
