function Animation(file, width, height, duration)

    local image = love.graphics.newImage(file)

    local quads = {}
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    local animation = {
        spriteSheet = image,
        quads = quads,
        duration = duration or 1,
        currentTime = 0,
    }

    function animation:update(dt)
        self.currentTime = self.currentTime + dt
        if self.currentTime >= self.duration then
            self.currentTime = self.currentTime - self.duration
        end
    end

    function animation:draw(x, y)
        local spriteNum = math.floor(self.currentTime / self.duration * #self.quads) + 1
        love.graphics.draw(self.spriteSheet, self.quads[spriteNum], x, y, 0, 4)
    end
        
        
 
    return animation
end

