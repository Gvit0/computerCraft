local chest = peripheral.wrap("minecraft:chest")
local m = peripheral.wrap("top")
rednet.open("back")

m.setBackgroundColor(colors.orange)
m.setTextColour(colors.blue)
m.clear()
m.setCursorPos(1,1)

function card()
    m.clear()
    m.setCursorPos(1,1)
    local keyboard = {
        {"1","2","3"},
        {"4","5","6"},
        {"v","0","x"}
    }
    for i, row in ipairs(keyboard) do
        for j, key in ipairs(row) do
            m.write(key)
            for _s = 1,(m.getSize()-3)/2 do
                m.write(" ")
            end 
        end
        print(i)
        m.setCursorPos(1,i+1 ) 
    end
    local diskName = disk.getLabel("front")
    disk.eject("front")
end



m.write("card")


while true do
    if disk.hasData("front") then
        print("hi")
        card() 
    end
    os.sleep(1)
end
