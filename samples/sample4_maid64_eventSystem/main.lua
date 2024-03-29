if arg[2] == "debug" then
    require("lldebugger").start()
end
local maid64 = require "maid64"
local gameManager = require "gameManager"
sceenWidth = 320
screenHeight = 240
local scaleMuliplier = 3
mouseX, mouseY = 0,0

--everything revolving x = ... can be deleted. its just for test/sample purposes
function love.load()
    x = 0
    --optional settings for window
    love.window.setMode(sceenWidth*scaleMuliplier, screenHeight*scaleMuliplier, {resizable=true, vsync=false, minwidth=200, minheight=200})
    love.graphics.setDefaultFilter("nearest", "nearest")
    --initilizing maid64 for use and set to 64x64 mode 
    --can take 2 parameters x and y if needed for example maid64.setup(64,32)
    maid64.setup(sceenWidth, screenHeight)

    --font = love.graphics.newFont('fonts/pico-8-mono.ttf', 12)
    font = love.graphics.newFont('fonts/PressStart2P-Regular.ttf', 8)
    --font:setFilter('nearest', 'nearest')

    love.graphics.setFont(font)

    spr_inLove2d = maid64.newImage("inLove2d_64x64.png")

    rotate = 0
    gameManager.load()
   
end

function love.update(dt)
    x = x + 1
    rotate = rotate + dt
    --print('test' .. x)
    gameManager.update(dt)
end
function love.draw()
    
    maid64.start()--starts the maid64 process

    --draw images here
    
    --can also draw shapes and get mouse position
    love.graphics.circle("fill", maid64.mouse.getX(),  maid64.mouse.getY(), 2)
    --draw x,y cordinates on scren, nice for dev.
    love.graphics.print(maid64.mouse.getX() .. ',' ..  maid64.mouse.getY(), sceenWidth-(8*7),1)
    gameManager.draw()

    love.graphics.draw(spr_inLove2d, sceenWidth/2, screenHeight/2, rotate, 3, 3, spr_inLove2d:getWidth()/2, spr_inLove2d:getHeight()/2)

    maid64.finish()--finishes the maid64 process
end

function love.resize(w, h)
    -- this is used to resize the screen correctly
    maid64.resize(w, h)
end
