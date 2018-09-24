function req(list)
  for i, v in pairs(list) do require(v) end
end

function int(bool)
  return bool and 1 or 0
end

function round (n)
  return n < .5 and math.floor(n) or math.floor(n)
end

function max (val1, val2)
  return val1 >= val2 and val1 or val2
end

function sign (val)
  return val >= 0 and 1 or - 1
end

function tern (cond, exp1, exp2)
  if cond then return exp1 end
  return exp2
end

function py (x, y)
  return (x ^ 2 + y ^ 2) ^ .5
end

function keyCalc(key1, key2)
  return int(Key:isDown(key1)) - int(Key:isDown(key2))
end

function keyPad (up, down, left, right)
  return keyCalc(down, up), keyCalc(right, left)
end

function void (expr) end

function draw_sqrs(n, x, y, w, h)
  w = w or 6
  h = h or 6
  gap = 2
  span = w + gap
  x_val = 0
  y_val = 0
  for i = 1, n do
    love.graphics.rectangle('fill', x + x_val, y + y_val, w, h)
    x_val = x_val + span
    if x_val + span > window.w - x then
      x_val = 0
      y_val = y_val + h + gap
    end
  end
end

-- function approach1(start, fin, inc)
--  if inc > 0 and start + inc > fin then
--      return fin
--  elseif inc < 0 and start + inc < fin then
--    return fin
--  end
--  return start + inc
-- end

function approach (start, fin, inc)
  if fin < start - inc then
    return start - inc
  elseif start + inc < fin then
    return start + inc
  end
  return fin
end

function drawSqrs(n, nMax, x, y, w, h, span, gap)
  w = w or 2
  h = h or 2
  span = span or (w + (gap or 2)) * nMax
  local div = math.ceil(span / nMax)
  for i = 0, n - 1, 1 do
    love.graphics.rectangle('fill', x + i * div + (div / 2 - w / 2), y, w, h)
  end
end
