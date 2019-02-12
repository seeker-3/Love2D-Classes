HealthBar = class(BasicObject)

HealthBar.h = 5

function HealthBar:init (max, width)
  self.max = max
  self.current = max
  self.width = width
  self.drawWidth = width
end

function HealthBar:draw (x, y)
  love.graphics.rectangle('fill', x, y, self.drawWidth, self.h)
end

function HealthBar:update (dmg)
  self.current = self.current - dmg
  if self.current < 0 then self.current = 0 end
  self.drawWidth = self.width / self.max * self.current
end

function HealthBar:set (val)
  self.current = val
  self.drawWidth = self.width / self.max * self.current
end
