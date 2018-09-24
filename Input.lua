Input = class()

function Input:init ()
  self.btns = {}
end

function Input:update (dt)
  for key, state in pairs(self.btns) do
    if     state == 'p'        then Key[key] = 'pressed'
    elseif state == 'r'        then Key[key] = 'released'
    elseif state == 'pressed'  then Key[key] = 'down'
    elseif state == 'released' then Key[key] = 'up' end
  end
end

function Input:pressed(btn)
  return self.btns[btn] == 'pressed'
end

function Input:released(btn)
  return self.btns[btn] == 'released'
end

function Input:isDown(btn)
  return self.btns[btn] == 'down' or self.btns[btn] == 'pressed'
end
