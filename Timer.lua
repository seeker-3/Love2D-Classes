Timer = Object()
Timer.alarms = {}

function Timer:set(t, f)
  table.insert(self.alarms, {time = t, func = f})
end

function Timer:setTime(t, obj, var)
  obj[var] = true
  Timer:set(t, function()
    obj[var] = false
  end)
end

function Timer:flip(t, spd, obj, var)
  if t >= 0 then
    obj[var] = not obj[var]
    Timer:set(spd, function()
      Timer:flip(t - spd, spd, obj, var)
    end)
  else obj[var] = false end
end

function Timer:update(dt)
  for i, obj in ipairs(self.alarms) do
    if obj.time <= 0 then
      obj.func()
      table.remove(self.alarms, i)
    else
      obj.time = obj.time - 1 * dt
    end
  end
end