Class = require "lib.hump.class"

EventManager = Class {
	init = function(self)
		self.objects = {}
    end
}

function EventManager:registerObject(object)
	table.insert(self.objects, object)
end

function EventManager:update()
	local currentCursor = {
		x = (love.mouse.getX()) and love.mouse.getX() or 0,
		y = (love.mouse.getY()) and love.mouse.getY() or 0
	}
	for _, object in pairs(self.objects) do
		if object:getCollision( currentCursor.x, currentCursor.y ) then
			object:setSelected(true)
	    else
			object:setSelected(false)
		end
	end
end

function EventManager:mousepressed()
	for _, object in pairs(self.objects) do
		if object:selected then
			if object:mousepressed() then
				object:mousepressed()
			end 	    
		end
	end
end

function EventManager:mousereleased()
	for _, object in pairs(self.objects) do
		if object:mousereleased() then
			object:mousereleased()
		end 
	end
end

return EventManager