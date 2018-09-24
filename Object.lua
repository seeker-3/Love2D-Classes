Object = setmetatable({
  init = function(self, ...) end,
  update = function(self, dt) end,
  draw = function(self) end,
  insts = {},
  dcnts = {},

  find = function(self)
    for i, v in ipairs(self.insts) do
      if v == self then return i end
    end
  end,

  destroy = function(self)
    table.remove(self.insts, self:find())
  end,

  replace = function(self, tbl)
    self.insts[self:find()] = tbl
    return setmetatable(tbl, {__index = self})
  end,

  extend = function(self)

    local meta = {}
    for k, v in pairs(getmetatable(Object)) do meta[k] = v end
    meta.__index = self

    local cls = {}
    for k, v in pairs(self) do cls[k] = v end
    cls.super = self
    cls.insts = {}
    cls.dcnts = {}
    table.insert(self.dcnts, cls)
    return setmetatable(cls, meta)

  end,

  gen = function(self)
    for i, inst in pairs(self.insts) do coroutine.yield(inst) end
    for i, cls in pairs(self.dcnts) do cls:gen() end
  end,

  iter = function(self)
    return coroutine.wrap(function()self:gen()end)
  end,
},
{
  __call = function(self, ...)
    local inst = setmetatable({}, #self.insts ~= 0 and
      getmetatable(self.insts[1]) or {__index = self})
    for k, v in pairs(self) do inst[k] = v end
    inst:init(...)
    table.insert(self.insts, inst)
    return inst
  end,
})

function class(super)
  super = super or Object
  return super:extend()
end

function updateAll(dt)
  for inst in Object:iter() do inst:update(dt) end
end

function drawAll()
  for inst in Object:iter() do inst:draw() end
end
