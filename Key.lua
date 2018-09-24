function love.keyreleased(key)
  Key[key] = 'r'
end

function love.keypressed(key)
  Key[key] = 'p'
  if key == 'return' then paused = not paused
  elseif key == 'escape' then love.event.quit()
  elseif key == 'rshift' and paused then frame = true
  end
end

keymethods = Object()
Key = keymethods:replace({})

function keymethods:update (dt)
  for key, state in pairs(self) do
    if     state == 'p'        then Key[key] = 'pressed'
    elseif state == 'r'        then Key[key] = 'released'
    elseif state == 'pressed'  then Key[key] = 'down'
    elseif state == 'released' then Key[key] = 'up' end
  end
end

function keymethods:pressed(key)
  return self[key] == 'pressed'
end

function keymethods:released(key)
  return self[key] == 'released'
end

function keymethods:isDown(key)
  return self[key] == 'down' or self[key] == 'pressed'
end
