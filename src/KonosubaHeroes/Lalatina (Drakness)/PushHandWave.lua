---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 18.02.2023 15:47
---
function PushHandWave(data, xEnd, yEnd)
    if not data.PushHandWaveOnCD then
        local damage=100
        StatCDText(3,data.DarkRMB)
        data.PushHandWaveOnCD = true
        local hero = data.UnitHero
        local angle = -180 + AngleBetweenXY(xEnd, yEnd, GetUnitXY(hero)) / bj_DEGTORAD
        CreateAndForceBullet(hero, angle, 30, "Valiant Charge Holy", nil, nil, damage, 500)
        if data.TripleRMB then
            CreateAndForceBullet(hero, angle-15, 30, "Valiant Charge Holy", nil, nil, damage, 500)
            CreateAndForceBullet(hero, angle+15, 30, "Valiant Charge Holy", nil, nil, damage, 500)
        end
        TimerStart(CreateTimer(), 3, false, function()
            data.PushHandWaveOnCD = false
        end)
    end

end

