Class = require "lib.hump.class"
EventManager = require "game.ui.event_manager"

WindowManager = Class {
	init = function(self, x ,y, width, height, background)
		self.objects = {}
		self.x = x
		self.y = y
		self.width = width
		self.height = height
		self.background = background and background or nil -- Сюда можно впихнуть базовый бэк
		self.EventManager = EventManager()
    end
}

function WindowManager:registerObject(object)
	table.insert(self.EventManager.objects, object)
end

function WindowManager:update(dt)
	for _, object in pairs(self.EventManager.objects) do
		object:update(dt)
	end
end

function WindowManager:draw()
	for _, object in pairs(self.EventManager.objects) do
		if object.position == 'relative' then
			local xPos =  (object.right and ((self.x + self.width) - object.right) or (object.left and (self.x + object.left) or self.x))
			local yPos =  (object.down and ((self.y + self.height) - object.down) or (object.up and (self.y + object.up) or self.y))
			drawObject( object, 
			 			xPos, 
			 			yPos, 
			 			object.angle, 
			 			object.width, 
			 			object.heigth)
		elseif object.position == 'fixed' then
			drawObject( object, 
			 			object.x, 
			 			object.y, 
			 			object.angle, 
			 			object.width, 
			 			object.heigth)
		end
	end
end

function WindowManager:mousepressed()
	for _, object in pairs(self.EventManager.objects) do
		if object:isSelected() then
			object:mousepressed()
	    end
	end
end

function WindowManager:mousereleased()
	for _, object in pairs(self.EventManager.objects) do
		object:mousereleased()
	end
end

return WindowManager