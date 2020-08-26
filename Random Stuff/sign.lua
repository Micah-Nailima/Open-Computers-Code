local com = require('component')
local gpu = com.gpu
local screen = com.screen

gpu.setResolution(28, 4)
os.execute("cls")
local width, height = 30, 4
local text = "Manufacturing and Storage"

while true do
    os.execute("cls")  
    gpu.set(width / 2 - #text / 2, height / 2, text)
    os.sleep(100)
end