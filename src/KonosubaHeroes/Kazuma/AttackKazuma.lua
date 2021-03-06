---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 22.01.2022 18:43
---
function AttackMelee(data)
    local effectModel="Effect\\animeslashfinal"
    if not data.ReleaseLMB and UnitAlive(data.UnitHero) then
        data.ReleaseLMB = true
        if not data.isAttacking then
            --print("пытаемся атаковать, запускаем кд атаки и прерываем движение")
            --print("a "..GetUnitName(mainHero))
            local cdAttack = 0.4
            local indexAnim = data.IndexAnimationAttack1 --анимации атаки
            local pid = GetPlayerId(GetOwningPlayer(data.UnitHero))
            data.isAttacking = true
            data.ResetSeriesTime = 1
            data.AttackCount = data.AttackCount + 1
            --print(data.AttackCount)
            local angle = -180 + AngleBetweenXY(GetPlayerMouseX[pid], GetPlayerMouseY[pid], GetUnitX(data.UnitHero), GetUnitY(data.UnitHero)) / bj_DEGTORAD
            local bonus = 0
            if data.GoldKingCharges then
                bonus = data.GoldKingCharges
            end
            local damage = data.DamageInSeries[data.AttackCount] + bonus
            --print(damage)
            BlzSetUnitFacingEx(data.UnitHero, angle) --был обычный поворот
            local maxAttack = data.MaxAttack

            --local tmp=data.DamageInSeries
            --local lastAttack=#tmp
            if data.LineCleaveAttack then
                --data.LineCleaveAttack
                TimerStart(CreateTimer(), 0.2, false, function()
                    CreateAndForceBullet(data.UnitHero, angle, 20, "Abilities\\Spells\\Orc\\Shockwave\\ShockwaveMissile.mdl", GetUnitX(data.UnitHero), GetUnitY(data.UnitHero), 50, 700)
                    DestroyTimer(GetExpiredTimer())
                end)
            end

            if GetUnitTypeId(data.UnitHero) == HeroID then
                --local data=HERO[GetPlayerId(GetOwningPlayer(u))]
                data.Reflected = true
                TimerStart(CreateTimer(), 0.35, false, function()
                    data.Reflected = false
                    DestroyTimer(GetExpiredTimer())
                end)
            end

            if data.AttackCount == 1 then
                -- первый обычный удар
                indexAnim = data.IndexAnimationAttack1
                normal_sound("abilities\\weapons\\bristlebackmissile\\bristlebackmissilelaunch"..1, GetUnitXY(data.UnitHero))
                TimerStart(CreateTimer(), 0.2, false, function()
                    DestroyTimer(GetExpiredTimer())
                    local eff = AddSpecialEffect(effectModel, GetUnitXY(data.UnitHero))
                    BlzSetSpecialEffectYaw(eff, math.rad(GetUnitFacing(data.UnitHero)))
                    BlzSetSpecialEffectScale(eff, 0.5)
                    --BlzSetSpecialEffectRoll(eff, math.rad(40))
                    BlzSetSpecialEffectZ(eff, BlzGetUnitZ(data.UnitHero) + 50)
                    DestroyEffect(eff)
                end)
            end
            if data.AttackCount ~= 1 and data.AttackCount ~= maxAttack then
                -- второй удар
                local r = GetRandomInt(1, 2)

                if r == 1 then
                    indexAnim = data.IndexAnimationAttack1
                    cdAttack = 0.4
                    UnitAddForceSimple(data.UnitHero, GetUnitFacing(data.UnitHero), 10, 60)
                    normal_sound("abilities\\weapons\\bristlebackmissile\\bristlebackmissilelaunch"..2, GetUnitXY(data.UnitHero))
                    TimerStart(CreateTimer(), 0.3, false, function()
                        DestroyTimer(GetExpiredTimer())
                        local eff = AddSpecialEffect(effectModel, GetUnitXY(data.UnitHero))
                        BlzSetSpecialEffectYaw(eff, math.rad(GetUnitFacing(data.UnitHero)))
                        BlzSetSpecialEffectScale(eff, 0.7)
                        --BlzSetSpecialEffectRoll(eff, math.rad(30))
                        BlzSetSpecialEffectZ(eff, BlzGetUnitZ(data.UnitHero) + 50)
                        DestroyEffect(eff)
                    end)
                else
                    indexAnim = data.IndexAnimationAttack2
                    cdAttack = 0.4
                    normal_sound("abilities\\weapons\\bristlebackmissile\\bristlebackmissilelaunch"..3, GetUnitXY(data.UnitHero))
                    TimerStart(CreateTimer(), 0.2, false, function()
                        DestroyTimer(GetExpiredTimer())
                        local eff = AddSpecialEffect(effectModel, GetUnitXY(data.UnitHero))
                        BlzSetSpecialEffectYaw(eff, math.rad(GetUnitFacing(data.UnitHero)))
                        BlzSetSpecialEffectScale(eff, 0.5)
                        --BlzSetSpecialEffectRoll(eff, math.rad(40))
                        BlzSetSpecialEffectZ(eff, BlzGetUnitZ(data.UnitHero) + 60)
                        DestroyEffect(eff)
                    end)
                end

            end
            if data.AttackCount == maxAttack then
                -- ПОСЛЕДНИЙ удар бывший тритий
                indexAnim = data.IndexAnimationAttack3
                cdAttack = data.CdAttackFinal-- задержка после финальной атаки 0.7



                local finale = data.AttackCount
                if not data.tasks[1] then
                    data.tasks[1] = true
                    --print("Первый раз сделал серию")
                end
                normal_sound("Sound\\PeonSound\\cut\\BloodlustTarget", GetUnitXY(data.UnitHero))
                TimerStart(CreateTimer(), 0.2, false, function()
                    DestroyTimer(GetExpiredTimer())
                    normal_sound("abilities\\weapons\\bristlebackmissile\\bristlebackmissilelaunch3", GetUnitXY(data.UnitHero))
                    UnitAddForceSimple(data.UnitHero, GetUnitFacing(data.UnitHero), 20, 120)

                    damage = data.DamageInSeries[finale] -- финальная атака
                    --print(damage)
                    local nx, ny = MoveXY(GetUnitX(data.UnitHero), GetUnitY(data.UnitHero), 50, GetUnitFacing(data.UnitHero))
                    local is, enemy, k = UnitDamageArea(data.UnitHero, damage, nx, ny, 300, "shotForce") --урон с финального удара
                    if enemy then
                        --ConditionCastLight(data)
                        if data.CursedStrike then
                            local amount = (BlzGetUnitMaxHP(data.UnitHero) / 100) * 2
                            HealUnit(data.UnitHero, amount)
                        end
                    else
                        if data.CursedStrike then
                            local amount = (BlzGetUnitMaxHP(data.UnitHero) / 100) * 2
                            if GetUnitState(data.UnitHero, UNIT_STATE_LIFE) + 1 > amount then
                                UnitDamageTarget(data.UnitHero, data.UnitHero, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
                            end
                        end
                    end

                    if is then
                        normal_sound("Sound\\Units\\Combat\\MetalMediumBashStone1", GetUnitXY(data.UnitHero))
                    end
                    --Вот тут создадим эффект
                    nx, ny = MoveXY(GetUnitX(data.UnitHero), GetUnitY(data.UnitHero), 50, GetUnitFacing(data.UnitHero))
                    local eff = AddSpecialEffect(effectModel, nx, ny)
                    BlzSetSpecialEffectZ(eff, BlzGetUnitZ(data.UnitHero) + 60)
                    BlzSetSpecialEffectYaw(eff, math.rad(GetUnitFacing(data.UnitHero)))
                end)
            end

            if UnitAlive(data.UnitHero) then
                SetUnitAnimationByIndex(data.UnitHero, indexAnim)
            end




            TimerStart(CreateTimer(), cdAttack/2, false, function()
                DestroyTimer(GetExpiredTimer())
                -- кд атаки тут для всех ударов
                local nx, ny = MoveXY(GetUnitX(data.UnitHero), GetUnitY(data.UnitHero), 100, GetUnitFacing(data.UnitHero))
                --print(data.AttackCount)
                if data.AttackCount < maxAttack and data.AttackCount > 0 and StunSystem[GetHandleId(data.UnitHero)].Time == 0 then
                    --print(data.AttackCount)

                    local flag = nil
                    if data.DashPerAttack then
                        flag = "push"
                    end
                    local is, enemy, k = UnitDamageArea(data.UnitHero, damage, nx, ny, 100, flag)
                    --print("урон есть?")


                    if is then
                        data.ParryPerAttack = true
                        TimerStart(CreateTimer(), 0.2, false, function()
                            DestroyTimer(GetExpiredTimer())
                            data.ParryPerAttack = false
                        end)
                        --print("Звук попадания обычной атакой"..data.AttackCount)
                        normal_sound("Sound\\Units\\Combat\\MetalMediumBashStone2", GetUnitXY(data.UnitHero))
                    end

                end
            end)

            TimerStart(CreateTimer(), cdAttack + 0.05, false, function()
                DestroyTimer(GetExpiredTimer())
                data.isAttacking = false
                if UnitAlive(data.UnitHero) then
                    if data.IsMoving then
                        --быстрый возврат после атаки в последнее состояние
                        SetUnitAnimationByIndex(data.UnitHero, data.IndexAnimationWalk)
                    else
                        ResetUnitAnimation(data.UnitHero) -- после атаки
                    end
                end
                data.ReleaseLMB = false
            end)

            if data.AttackCount >= maxAttack then
                data.AttackCount = 0
            end
        end
    end
end