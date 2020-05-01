Peachy = require "lib.peachy.peachy"

local Images = {}
local dir = "/resource/images"

function recursimeImport( path, sprites )
    local lfs = love.filesystem
    local filesTable = lfs.getDirectoryItems(path)
    for i,file in ipairs(filesTable) do
        local path_to_file = path..'/'..file
        if love.filesystem.getInfo( path_to_file).type == 'file' then
            local extension = string.sub(file, string.find(file, "[.]")+1 )
            local name = string.sub(file,1, string.find(file, "[.]")-1)
            if extension == 'json' then
                local image = love.graphics.newImage(path..'/'..name..'.png') -- добавить расширение 
                image:setFilter("nearest", "nearest")
                Images[name] = Peachy.new(path_to_file, image)
            elseif extension == 'png' and not Images[name] then
                Images[name] = love.graphics.newImage(path_to_file)
                Images[name]:setFilter("nearest", "nearest")
            end
        elseif love.filesystem.getInfo( path_to_file).type == 'directory'  then
            if file == 'sprites' then
                sprites = true
            end
            recursimeImport(path_to_file, sprites)
        end
    end
end

recursimeImport(dir, false)


-- for index, obj in pairs(love.filesystem.getInfo( path_to_file)) do 
--     print(index, obj)
-- end
return Images