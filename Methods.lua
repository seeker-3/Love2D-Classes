function table.contains(tbl, val)
  for k, v in pairs(tbl) do
    if v == val then
      return true
    end
  end
  return false
end

function table.hasKey (tbl, key)
  for k, v in pairs(tbl) do
    if k == key then return true end
  end
  return false
end

function table.repr (tbl)
  local repr = ''
  for k, v in pairs(tbl) do
    if repr ~= '' then repr = repr .. ' ' end
    repr = repr .. string.format(
      '%s = %s', k,
      type(v) == 'table' and table.repr(v) or v
    )
  end
  return '{' .. repr .. '}\n'
end

function table.print (tbl)
  print(table.repr(tbl))
end

function table.delete(tbl, val)
  for k, v in pairs(tbl) do
    if v == val then
      table.remove(tbl, k)
    end
  end
end

function table.copy(tbl)
  local copy = {}
  for k, v in pairs(tbl) do copy[k] = v end
  return copy
end

function table.count (tbl)
  local i = 0
  for k, v in pairs(tbl) do
    i = i + 1
  end
  return i
end

function table.keys (tbl)
  local list = {}
  local i = 1
  for k, v in pairs(tbl) do
    list[i] = k
    i = i + 1
  end
  return list
end

list = {}

function list.max (tbl, func)
  func = func or function(v) return v end
  local max = -math.huge
  for i, v in ipairs(tbl) do
    if max < v then max = v end
  end
  return max
end

function list.min (tbl, func)
  func = func or function(v) return v end
  local min = math.huge
  for i, v in ipairs(tbl) do
    if func(min) > func(v) then min = v end
  end
  return min
end

function list.map (tbl, func)
  local map = {}
  for i, v in ipairs(tbl) do
    map[i] = func(v)
  end
  return map
end

function list.filter (tbl, func)
  local filt = {}
  for i, v in ipairs(tbl) do
    if func(v) then table.insert(filt, v) end
  end
  return filt
end

function list.evens (tbl)
  return coroutine.wrap(function ()
    for i=2, #tbl, 2 do
      coroutine.yield(i, tbl[i])
    end
  end)
end
