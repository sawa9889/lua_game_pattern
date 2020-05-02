Class = require "lib.hump.class"
Peachy = require "lib.peachy.peachy"

CheckBox = Class {
    init = function(self, x, y, spriteName)
        self.x = x
        self.y = y
        self.sprite = Images[spriteName]
        self.sprite:setTag('off')
        self.sprite:play()
        self.enabled = false
        self.selected = false
    end
}

function CheckBox:setSelected( selected )
    if selected ~= self.selected then
        if selected then
            self.sprite:setTag("selected")
        else
            self.sprite:setTag("unselected")
        end
        self.selected = selected
    end
end

function CheckBox:getCollision(x, y)
    return 	self.x < x and
            (self.x + self.sprite:getWidth()*scale) > x and
            self.y < y and
            (self.y + self.sprite:getHeight()*scale) > y
end

function CheckBox:mousepressed()
    self.sprite:setTag((self.sprite.tag == "off") and "on" or "off")
end

function CheckBox:draw()
    drawObject( object, 
                object.x, 
                object.y, 
                object.angle, 
                object.width, 
                object.heigth)
end

function CheckBox:update(dt)
    self.sprite:update(dt)
end

return CheckBox