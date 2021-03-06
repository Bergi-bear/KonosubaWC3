---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 31.12.2021 2:25
---
function CreateEnteringFrame(data, name)
    if not data.ShowEntering then
        data.ShowEntering = true
        local text = BlzCreateFrameByType("TEXT", "ButtonChargesText", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), "", 0)
        BlzFrameSetAbsPoint(text, FRAMEPOINT_CENTER, 0.4, 0.55)
        BlzFrameSetText(text, name)
        BlzFrameSetScale(text, 3)
        BlzFrameSetVisible(text, GetLocalPlayer() == Player(data.pid))
        local sec = 5
        local a = 250
        TimerStart(CreateTimer(), TIMER_PERIOD, true, function()
            sec = sec - TIMER_PERIOD
            a = a - 1
            BlzFrameSetAlpha(text, a)

            if sec <= 0 then
                data.ShowEntering = false
                BlzDestroyFrame(text)
                DestroyTimer(GetExpiredTimer())
            end
        end)
    end
    if GetLocalPlayer()==Player(data.pid) then
        ClearMapMusicBJ()
        StopMusic(true)
        if name == "Луга слаймов" then
            PlayMusicBJ("MP3\\Ancientgroover")
            PlayMusicBJ("MP3\\PronteraTheme")
        end
        if name == "Канализация" then
            --PlayMusicBJ("MP3\\TreasureHunter")
            PlayMusicBJ("MP3\\Undertheground")
        end
        if name == "Бамбуковый лес" then
            --PlayMusicBJ("MP3\\TreasureHunter")
            PlayMusicBJ("MP3\\NanoEast")
        end
        SetMusicVolumeBJ(100)
    end
end