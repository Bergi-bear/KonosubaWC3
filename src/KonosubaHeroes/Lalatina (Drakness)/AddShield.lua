---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 18.02.2023 16:4820
---
ShieldHP={}
function AddShield(data)
    local heroes={
        HeroKazuma,
        HeroAqua,
        HeroDarkness,
        HeroMegumin,
    }
    if not data.ShieldOnCD then
        data.ShieldOnCD = true
        for i=1,4 do
            ShieldHP[GetHandleId(heroes[i])]={}
            ShieldHP[GetHandleId(heroes[i])].hp=200
            local eff = AddSpecialEffectTarget("Effect\\SC2ForceField_ByEpsilon.mdl", heroes[i], "origin")
            ShieldHP[GetHandleId(heroes[i])].eff=eff
            TimerStart(CreateTimer(), 10, false, function()
                DestroyEffect(eff)
                ShieldHP[GetHandleId(heroes[i])].hp=0
            end)
        end
        TimerStart(CreateTimer(), 20, false, function()
            data.ShieldOnCD = false
        end)

    end
end