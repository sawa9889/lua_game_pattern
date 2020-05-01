Images 	= require "resource.images"

local game = {}

function game:enter()
    self.sprite = Images['cow']
	self.sprite:setTag('chew')
	self.sprite:play()
end

function game:mousepressed(x, y)
end

function game:mousereleased(x, y)
end

function game:keypressed( key )
end

function game:draw()
	self.sprite:draw(100, 100, 0, scale, scale)
end

function game:update( dt )
    self.sprite:update(dt)
end

return game