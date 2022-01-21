---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 18.12.2021 22:35
---
function CatchItem(data)
    --local tempTable = AllItemsTable
    local k = #AllItemsTable
    if k > 0 then
        while true do
            --print(i,#AllItemsTable)
            local dataItems = AllItemsTable[k]
            local x, y = dataItems[3], dataItems[4]
            local d = DistanceBetweenXY(x, y, GetUnitXY(data.UnitHero))
            if d <= 150 then
                if AddItem2Hero(data, dataItems[2]) then
                    --DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt", x, y))
                    normal_sound("Sound\\Interface\\PickUpItem", GetUnitXY(data.UnitHero))
                    DestroyEffect(dataItems[1])
                    table.remove(AllItemsTable, k)
                end
                --приходится обрывать цикл чтобы не было проблем
            end
            k = k - 1
            if k <= 0 then
                --  print("перебор предметов окончен")
                break
            end
        end
    end
end

function CatchItemFor(data)
    --local tempTable = AllItemsTable
    for i = 1, #AllItemsTable do
        if i <= #AllItemsTable then
            --print(i,#AllItemsTable)
            local dataItems = AllItemsTable[i]
            local x, y = dataItems[3], dataItems[4]
            local d = DistanceBetweenXY(x, y, GetUnitXY(data.UnitHero))
            if d <= 150 then
                if AddItem2Hero(data, dataItems[2]) then
                    --DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt", x, y))
                    normal_sound("Sound\\Interface\\PickUpItem", GetUnitXY(data.UnitHero))
                    DestroyEffect(dataItems[1])
                    table.remove(AllItemsTable, i)
                end
                --приходится обрывать цикл чтобы не было проблем
                break
            end
        end
    end
end

function GetRandomItemInRangeByName(xf, yf, range, name)
    --local tempTable = AllItemsTable
    local k = #AllItemsTable
    local itemEff=nil
    local x, y=0,0
    if k > 0 then
        while true do
            --print(i,#AllItemsTable)
            local dataItems = AllItemsTable[k]
            x, y = dataItems[3], dataItems[4]
            local d = DistanceBetweenXY(x, y, xf, yf)
            if name==dataItems[2] then
                if d <= range then
                    --DestroyEffect(dataItems[1])
                    table.remove(AllItemsTable, k)
                    --print("предмет захвачен", name,x,y)
                    itemEff=dataItems[1]
                    break
                end
            end
            k = k - 1
            if k <= 0 then
                --  print("перебор предметов окончен")
                break
            end
        end
    end
    return itemEff,x,y
end