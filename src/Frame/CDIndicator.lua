---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 19.02.2023 15:54
---
function StatCDText(cd,parent,scale)
    local text = BlzCreateFrameByType("TEXT", "ButtonChargesText", parent, "", 0)
    BlzFrameSetPoint(text, FRAMEPOINT_CENTER, parent, FRAMEPOINT_CENTER, 0.0, 0.00)
    BlzFrameSetText(text, "")
    BlzFrameSetScale(text, 2.4)
    TimerStart(CreateTimer(), 0.05, true, function()

        cd = cd - 0.05
        local textShowed = string.format("%%02.1f", cd)
        if cd >= 10 then
            textShowed = R2I(cd)
        end
        BlzFrameSetText(text, ColorText2Black(textShowed))
        if cd<=0 then
            DestroyTimer(GetExpiredTimer())
            BlzDestroyFrame(text)
        end
    end)
end