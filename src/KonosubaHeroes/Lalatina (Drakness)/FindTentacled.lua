---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 19.02.2023 19:59
---
function FindTentacled(data)
    TimerStart(CreateTimer(), 1, true, function()
        local x, y = GetUnitXY(HeroDarkness)
        TimerStart(CreateTimer(), 0.5, true, function()
            local e = nil
            local k = 0
            --print("ищем")
            x, y = GetUnitXY(HeroDarkness)
            GroupEnumUnitsInRange(perebor, x, y, 500, nil)
            while true do
                e = FirstOfGroup(perebor)

                if e == nil then
                    break
                end
                if UnitAlive(e) and GetUnitAbilityLevel(e, FourCC("Btsp")) >= 1 or GetUnitAbilityLevel(e, FourCC("Btsa")) >= 1 then
                    --print("найден юнит поднятый тентаклей", GetUnitName(e))
                    SetUnitLifePercentBJ(e,GetUnitLifePercent(e)-data.DarkTentacles)
                end
                GroupRemoveUnit(perebor, e)
            end

        end)
    end)
end