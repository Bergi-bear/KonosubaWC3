---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 08.03.2021 21:07
---
do
    local InitGlobalsOrigin = InitGlobals
    function InitGlobals()
        InitGlobalsOrigin()
        TimerStart(CreateTimer(), 1, false, function()
            InitDeathEvent()
            DestroyTimer(GetExpiredTimer())
        end)
    end
end
function InitDeathEvent()
    local this = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(this, EVENT_PLAYER_UNIT_DEATH)
    TriggerAddAction(this, function()
        local u = GetTriggerUnit() --тот кто умер
        local killer = GetKillingUnit()
        local xu, yu = GetUnitXY(u)

        if IsUnitEnemy(u, GetOwningPlayer(killer)) then
            if HERO[GetPlayerId(GetOwningPlayer(killer))].UnitHero then
                --print("Есть герой")

                if killer then
                    --print(GetUnitName(killer),GetUnitName(u))
                    local exp = BlzGetUnitMaxHP(u) / 10
                    --AddExp(GetUnitData(killer), exp)
                    --EffectFromUnit2Unit(nil,"Firebrand Shot Yellow", GetUnitData(killer).UnitHero, u,"add gold")
                    --print("создать сферу?")
                    local new = CreateUnit(Player(10), FourCC("e000"), xu, yu, GetRandomInt(0,360))
                    CurrentCreepCount=CurrentCreepCount-1
                    UnitAddAbility(new,FourCC("Avul"))
                end
            else
                --print("нет героя")
            end
            if IsUnitType(killer,UNIT_TYPE_HERO) then
                local data=GetUnitData(killer)
                if killer==HeroDarkness then

                    if data.HasBloodBlade then
                        HealUnit(killer,data.HasBloodBlade)
                    end
                end
            end



            if GetUnitTypeId(u) == FourCC("n005") then

            end
        end
    end)
end