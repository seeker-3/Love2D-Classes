BasicObject = setmetatable({
  init = function(self, ...) end,

  extend = function(self)
    return setmetatable({super = self}, {
      __index = self,
      __call = getmetatable(BasicObject).__call
    })
  end,
},
{
  __call = function(self, ...)
    local inst = setmetatable({}, {__index = self})
    inst:init(...)
    return inst
  end,
})
