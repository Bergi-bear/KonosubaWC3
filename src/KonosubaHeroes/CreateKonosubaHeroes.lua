---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 22.01.2022 4:50
---
function CreateKonosubaHeroes()
    local data = HERO[0]
    KazumaID = FourCC("H003")
    AquaID = FourCC("H000")
    DarknessID = FourCC("H002")
    MeguminID = FourCC("H001")

    local x, y = GetPlayerStartLocationX(Player(0)), GetPlayerStartLocationY(Player(0))

    HeroKazuma = CreateUnit(Player(0), KazumaID, x, y, 0)
    HeroAqua = CreateUnit(Player(0), AquaID, x, y, 0)
    HeroDarkness = CreateUnit(Player(0), DarknessID, x, y, 0)
    HeroMegumin = CreateUnit(Player(0), MeguminID, x, y, 0)

    InitActiveSpellPanel(data)
    --скрываем изначально
    BlzPauseUnitEx(HeroAqua, true)
    ShowUnit(HeroAqua, false)
    BlzPauseUnitEx(HeroDarkness, true)
    ShowUnit(HeroDarkness, false)
    BlzPauseUnitEx(HeroMegumin, true)
    ShowUnit(HeroMegumin, false)
    StunUnit(HeroAqua,0.1)
    StunUnit(HeroDarkness,0.1)
    StunUnit(HeroMegumin,0.1)

    UnitAddAbility(HeroKazuma,FourCC("Abun"))
    UnitAddAbility(HeroAqua,FourCC("Abun"))
    UnitAddAbility(HeroDarkness,FourCC("Abun"))
    UnitAddAbility(HeroMegumin,FourCC("Abun"))

    SuspendHeroXP(HeroKazuma,true)
    SuspendHeroXP(HeroAqua,true)
    SuspendHeroXP(HeroDarkness,true)
    SuspendHeroXP(HeroMegumin,true)

    data.UnitHero = HeroKazuma
    SelectOnceHero(data, KazumaID)

    InitWASD(data.UnitHero)

    local xh, yh = -0.07, 0.596
    local step = 0.13
    CreateHudForHero(HeroKazuma, xh + step * 0, yh)
    CreateHudForHero(HeroAqua, xh + step * 1, yh)
    CreateHudForHero(HeroDarkness, xh + step * 2, yh)
    CreateHudForHero(HeroMegumin, xh + step * 3, yh)


end

function SelectOnceHero(data, id)
    local x, y = GetUnitXY(data.UnitHero)
    local angle = GetUnitFacing(data.UnitHero)
    if GetUnitTypeId(data.UnitHero) ~= id then
        DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl", x, y))

        if id == KazumaID then
            --print(1)
            BlzFrameSetVisible(data.ContainerSpellKazuma,true)
            BlzFrameSetVisible(data.ContainerSpellAqua,false)
            BlzFrameSetVisible(data.ContainerSpellDarkness,false)
            data.UnitHero = HeroKazuma
            BlzPauseUnitEx(data.UnitHero, false)
            ShowUnit(data.UnitHero, true)

            BlzPauseUnitEx(HeroAqua, true)
            BlzPauseUnitEx(HeroDarkness, true)
            BlzPauseUnitEx(HeroMegumin, true)

            ShowUnit(HeroAqua, false)
            ShowUnit(HeroDarkness, false)
            ShowUnit(HeroMegumin, false)
        elseif id == AquaID then
            BlzFrameSetVisible(data.ContainerSpellKazuma,false)
            BlzFrameSetVisible(data.ContainerSpellAqua,true)
            BlzFrameSetVisible(data.ContainerSpellDarkness,false)
            data.UnitHero = HeroAqua
            BlzPauseUnitEx(data.UnitHero, false)
            ShowUnit(data.UnitHero, true)

            BlzPauseUnitEx(HeroKazuma, true)
            BlzPauseUnitEx(HeroDarkness, true)
            BlzPauseUnitEx(HeroMegumin, true)

            ShowUnit(HeroKazuma, false)
            ShowUnit(HeroDarkness, false)
            ShowUnit(HeroMegumin, false)
        elseif id == DarknessID then
            BlzFrameSetVisible(data.ContainerSpellKazuma,false)
            BlzFrameSetVisible(data.ContainerSpellAqua,false)
            BlzFrameSetVisible(data.ContainerSpellDarkness,true)
            data.UnitHero = HeroDarkness
            BlzPauseUnitEx(data.UnitHero, false)
            ShowUnit(data.UnitHero, true)

            BlzPauseUnitEx(HeroKazuma, true)
            BlzPauseUnitEx(HeroAqua, true)
            BlzPauseUnitEx(HeroMegumin, true)

            ShowUnit(HeroKazuma, false)
            ShowUnit(HeroAqua, false)
            ShowUnit(HeroMegumin, false)
        elseif id == MeguminID then
            BlzFrameSetVisible(data.ContainerSpellKazuma,false)
            BlzFrameSetVisible(data.ContainerSpellAqua,false)
            BlzFrameSetVisible(data.ContainerSpellDarkness,false)
            data.UnitHero = HeroMegumin
            BlzPauseUnitEx(data.UnitHero, false)
            ShowUnit(data.UnitHero, true)

            BlzPauseUnitEx(HeroKazuma, true)
            BlzPauseUnitEx(HeroAqua, true)
            BlzPauseUnitEx(HeroDarkness, true)

            ShowUnit(HeroKazuma, false)
            ShowUnit(HeroAqua, false)
            ShowUnit(HeroDarkness, false)
        end
    else
        return
        -- print("не нуждается в смене персонажа")
    end
    SetUnitPositionSmooth(data.UnitHero, x, y)
    BlzSetUnitFacingEx(data.UnitHero, angle)
    SelectUnitForPlayerSingle(data.UnitHero, Player(data.pid))
    SetUnitTimeScale(data.UnitHero,1)
    InitAnimations(nil, data)
    if data.IsMoving then
        --print("walk")
        SetUnitAnimationByIndex(data.UnitHero, data.IndexAnimationWalk)
    else
        --print("simple reset")
        ResetUnitAnimation(data.UnitHero)
    end

end

function CreateHudForHero(hero, x, y)
    CreateHeroPortrait(hero, x - GNext, y)
    CreateHPBar(hero, x, y)
    CreateEXPBar(hero, x, y- GNext/4)
    InitRegistryEvent(hero)
end

function CreateHeroPortrait(hero, x, y)
    local ico = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    BlzFrameSetParent(ico, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    local texture = nil
    if not texture then
        texture = "ReplaceableTextures\\CommandButtons\\BTNSelectHeroOn"
    end
    if GetUnitTypeId(hero) == KazumaID then
        texture = "Characters\\KICO"
    elseif GetUnitTypeId(hero) == AquaID then
        texture = "Characters\\AICO"
    elseif GetUnitTypeId(hero) == DarknessID then
        texture = "Characters\\DICO"
    elseif GetUnitTypeId(hero) == MeguminID then
        texture = "Characters\\MICO"
    end
    BlzFrameSetTexture(ico, texture, 0, true)
    BlzFrameSetSize(ico, GNext, GNext)
    BlzFrameSetAbsPoint(ico, FRAMEPOINT_LEFT, x, 0.6 - GNext / 2)
end

function CreateSelectActions()
    -----------------------------------------------------------------OSKEY_F1
    local gg_trg_EventUpF1 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpF1, Player(i), OSKEY_F1, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpF1, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseF1 then
            data.ReleaseF1 = true
            if GetUnitTypeId(data.UnitHero) ~= HeroKazuma then
                SelectOnceHero(data, KazumaID)
                -- print("F1")
            else
                -- print("повторый выбор")
            end
        end
    end)

    local TrigDepressF1 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressF1, Player(i), OSKEY_F1, 0, false)
    end
    TriggerAddAction(TrigDepressF1, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseF1 = false
    end)
    -----------------------------------------------------------------OSKEY_F2
    local gg_trg_EventUpF2 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpF2, Player(i), OSKEY_F2, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpF2, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseF2 then
            data.ReleaseF2 = true
            if GetUnitTypeId(data.UnitHero) ~= HeroAqua then
                SelectOnceHero(data, AquaID)
                --print("F2")
            else

            end
        end
    end)

    local TrigDepressF2 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressF2, Player(i), OSKEY_F2, 0, false)
    end
    TriggerAddAction(TrigDepressF2, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseF2 = false
    end)
    -----------------------------------------------------------------OSKEY_F3
    local gg_trg_EventUpF3 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpF3, Player(i), OSKEY_F3, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpF3, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseF3 then
            data.ReleaseF3 = true
            if GetUnitTypeId(data.UnitHero) ~= HeroDarkness then
                SelectOnceHero(data, DarknessID)
                --print("F3")
            else

            end
        end
    end)

    local TrigDepressF3 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressF3, Player(i), OSKEY_F3, 0, false)
    end
    TriggerAddAction(TrigDepressF3, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseF3 = false
    end)
    -----------------------------------------------------------------OSKEY_F4
    local gg_trg_EventUpF4 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpF4, Player(i), OSKEY_F4, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpF4, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseF4 then
            data.ReleaseF4 = true
            if GetUnitTypeId(data.UnitHero) ~= HeroMegumin then
                SelectOnceHero(data, MeguminID)
                -- print("F4")
            else

            end
        end
    end)

    local TrigDepressF4 = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressF4, Player(i), OSKEY_F4, 0, false)
    end
    TriggerAddAction(TrigDepressF4, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseF4 = false
    end)
end
