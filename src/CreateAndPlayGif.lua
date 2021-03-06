---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 25.11.2021 0:50
---
--CreateAndPlayGif(0.4,0.3,"war3mapImported\\\gargoule_page_000",0.1)
function CreateAndPlayGif(x, y, path, size, endFrame, destroyOnPlay, fps, flag)
    local gifPath = path -- путь до кадров (имя без последнего порядкового символа или нескольких, смотря столько кадров)
    if not endFrame then
        endFrame = 8
    end
    if not fps then
        fps = 1 / 16
    end
    local s = 1
    local gif = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    local firstShow = false
    BlzFrameSetParent(gif, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetTexture(gif, "dds\\load", 0,true)
    BlzFrameSetSize(gif, size, size)
    BlzFrameSetAbsPoint(gif, FRAMEPOINT_TOP, x, y)
    --BlzFrameSetVisible(gif, false)
    TimerStart(CreateTimer(), fps, true, function()
        local totalPath = gifPath .. s
        if not firstShow then
            firstShow = true
            -- BlzFrameSetVisible(gif, true)
        end

        if BlzFrameIsVisible(gif) then
            if flag == 1 then
                --BlzFrameSetVisible(gif, false)
                local sZero = s
                if #(I2S(s)) == 1 then
                    sZero = "00" .. s
                elseif #(I2S(s)) == 2 then
                    sZero = "0" .. s
                end
                totalPath = gifPath .. sZero
                --print(totalPath)
            end
            BlzFrameSetTexture(gif, totalPath, 0, true)
            s = s + 1
        end
        --print(s)

        if s > endFrame then
            if destroyOnPlay then
                DestroyTimer(GetExpiredTimer())
                BlzFrameSetVisible(gif, false)
                BlzDestroyFrame(gif)
            else
                s = 1
            end
        end

    end)
    GGIF = gif
    return gif
end