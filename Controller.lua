function love.gamepadaxis(joystick, axis, value)
  Controller.axes[axis] = value
end

function love.gamepadpressed(joystick, btn)
  Controller.btns[btn] = 'p'
end

function love.gamepadreleased(joystick, btn)
  Controller.btns[btn] = 'r'
end

Controller = Input()

Controller.axes = setmetatable({}, {__index = function () return 0 end})

function Controller:update ()

  Input.update(self)

  if math.abs(self.axes.leftx) < .2 and math.abs(self.axes.lefty) < .2 then
    self.axes.leftx = 0
    self.axes.lefty = 0
  end

  if math.abs(self.axes.rightx) < .2 and math.abs(self.axes.righty) < .2 then
    self.axes.rightx = 0
    self.axes.righty = 0
  end

end
