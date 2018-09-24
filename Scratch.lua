p1 = {x = 1}
p2 = {y = 2}

t = setmetatable({}, {__index = function (self, key)
  for i, super in ipairs(self.supers) do
    if super[key] then return super[key] end
  end
end})

t.supers = {p1, p2}

print(t.y)
