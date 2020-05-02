Class = require "lib.hump.class"
Peachy = require "lib.peachy.peachy"

Button = Class {
    init = function(self, x, y, spriteName, callback)
        self.x = x
        self.y = y
        self.selected = false
        self.callback = callback
        self.sprite = Images[spriteName]
        self.sprite:setTag('up')
        self.sprite:play()
    end
}

function Button:setSelected(selected)
    if selected ~= self.selected then
        if selected then
            self.sprite:setTag("selected")
        else
            self.sprite:setTag("up")
        end
        self.selected = selected
    end
end

function Button:getCollision(x, y)
    return 	self.x < x and
            (self.x + self.sprite:getWidth()*scale) > x and
            self.y < y and
            (self.y + self.sprite:getHeight()*scale) > y
end

function Button:mousepressed()
    self.sprite:setTag("down")
end

function Button:mousereleased()
    self.sprite:setTag("up")
    if self.selected then
        self.callback()
    end
end

function Button:draw()
    drawObject( object, 
                object.x, 
                object.y, 
                object.angle, 
                object.width, 
                object.heigth)
end

function Button:update(dt)
    self.sprite:update(dt)
end

return Button