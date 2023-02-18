---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 18.02.2023 22:29
---
function FishKill(data)
    local sec=data.FishKillPeriod
    TimerStart(CreateTimer(), 1, true, function()
        sec=sec-1
        if sec<=0 then
            local enemy=FindFirstEnemy(data.UnitHero,1000)

            sec=data.FishKillPeriod
            FishEat(data,enemy)
        end
    end)
end

function FishEat(data,enemy)
    local x,y=GetUnitXY(enemy)
    BlzPauseUnitEx(enemy,true)
    local eff=AddSpecialEffect("Fesh_Final",GetUnitXY(enemy))
    BlzSetSpecialEffectZ(eff,-200)
    BlzSetSpecialEffectYaw(eff, math.rad(GetUnitFacing(enemy)-180))
    BlzSetSpecialEffectPitch(eff, math.rad(-90))
    BlzSetSpecialEffectScale(eff,7)
    local z=GetTerrainZ(x,y)-500
    local f=0
    print("цель найдена",z)
    TimerStart(CreateTimer(), TIMER_PERIOD64, true, function()
        f=f+5
        BlzSetSpecialEffectZ(eff,z+f)
        if f>=500 then
            print("укус",f)
            DestroyTimer(GetExpiredTimer())
            UnitDamageArea(data.UnitHero,9999,x,y,100)
            ShowUnit(enemy,false)
            BlzPlaySpecialEffect(eff,ANIM_TYPE_ATTACK)
            TimerStart(CreateTimer(), TIMER_PERIOD64, true, function()
                f=f-5
                BlzSetSpecialEffectZ(eff,z+f)
                if f<=0 then
                    DestroyTimer(GetExpiredTimer())
                end
            end)
        end
    end)
end

