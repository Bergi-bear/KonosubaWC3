---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 01.12.2021 19:34
---
---

function DetectShape(angles, sides, data)
    local sum = 0
    for i = 1, #angles do
        sum = sum + angles[i]
    end

    for i = 1, #Shapes do --перебор всех возможных фигур
        if (Shapes[i]:check(sum, angles, sides, data)) then
            --print("проверка фигур ",i)
            --UnitAddMana(data.UnitHero,30)
            return
        else
            --print("ни 1 фигура не была найдена")
            if #data.Points >1 then
                UnitAddMana(data.UnitHero,-1)
            end
        end
    end
end

function ShapeDetectorAdd(current, previous, data)

    if (current == 0 or previous == 0) then
        return
    end

    local sensitivity = 15 -- degrees
    local minimumDistanceForSide = 1 * 128

    local direction = VectorSubtract(current, previous)

    if (data.previousDirection == 0) then
        table.insert(data.sides, Side:new(current))
        data.previousDirection = direction
    else
        local angle = math.deg(direction:differenceRegardingUp(data.previousDirection))

        if (angle < sensitivity) then
            data.sides[#data.sides]:changeEnd(current)

        else
            if (data.sides[#data.sides]:length() > minimumDistanceForSide) then
                table.insert(data.sides, Side:new(current))
                table.insert(data.AnglePoints,current)
                --print("найден угол или сторона",#data.Points)
            else
                data.sides[#data.sides] = Side:new(current)
            end
            data.previousDirection = direction
        end
    end
end

function ShapeDetectorClear(data)


    for i = 1, 20 do
        --print("  ")
    end

    for i = 1, #data.sides do
        --print(i.. ". ( ".. sides[i].start.x.. ", ".. sides[i].start.x.. " ) ; (".. sides[i].en.x.. ", ".. sides[i].en.y.. ")")
    end

    -- angles
    local angles = { }
    function getAngle(i, j)
        return math.deg(data.sides[i]:getVector():angleBetween(data.sides[j]:getVector()))
    end

    for i = 1, #data.sides do
        if (i < #data.sides) then
            table.insert(angles, getAngle(i, i + 1))
            --local x,y=
        else
            table.insert(angles, getAngle(1, #data.sides))
        end
    end

    anglePrint = ""
    for i = 1, #angles do
        anglePrint = anglePrint .. "; " .. i .. " - " .. angles[i]
    end
    --print(anglePrint)
    --print("Count: ".. #Points)

    --


    DetectShape(angles, data.sides, data)

    data.sides = {}
    data.previousDirection = 0
end

function GetCenterFigure(data)
    local center = Vector:new(0, 0, 0)
    for i = 1, #data.Points do
        center.x = center.x + data.Points[i].x
        center.y = center.y + data.Points[i].y
    end
    center.x = center.x / #data.Points
    center.y = center.y / #data.Points
    return center.x,center.y
end
