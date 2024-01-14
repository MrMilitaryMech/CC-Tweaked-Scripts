print("Floor placer script started")
print("Checking fuel...")
shell.run("refuel all")
fuel_level = turtle.getFuelLevel()
print("How far do you want to replace?")
blocks = tonumber(read())
isBlock, data = turtle.inspectDown()
block = data.name

function selectItem(itemName)
    print("Attempting to select item "..itemName.."...")
    for i = 1, 16 do
        print("Checking slot "..tostring(i).."...")
        local itemInfo = turtle.getItemDetail(i, false)
        if itemInfo then
            if itemInfo.name == itemName then
                turtle.select(i)
                break
            end
        else
            print("Error Getting Detail")
        end
    end
end

if isBlock then
    print("The Block Below is "..data.name)
    selectItem(data.name)
    
else
    print("No block below the turtle!")
end


if blocks <= fuel_level then
    print("Enough Fuel!")
    for i = 1, blocks do
        turtle.digDown()
        selectItem(block)
        turtle.placeDown()
        if not turtle.forward() then
            turtle.dig()
            turtle.forward()
        end
    end
else
    print("Not Enough Fuel!")
end

