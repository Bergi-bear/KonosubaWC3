---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 18.02.2023 12:16
---
function InitTalonBDForDarkNess()
    DarknessTalon = {
        [1] = {
            name = "Кровавый меч",
            icon = "DDSICO\\BloodAndBlade",
            description = "Убийства врагов исцеляют на DS ",
            level = 0,
            DS = { 1, 2, 3 },
            pos = 1,
        },
        [2] = {
            name = "Маска льва",
            icon = "DDSICO\\LionMask",
            description = "При получении 300 урона выпускает волну силы наносящую DS урон",
            level = 0,
            DS = { 100, 200, 300 },
            pos = 2,
        },
        [3] = {
            name = "Разбитое сердце",
            icon = "DDSICO\\BrokenHeart",
            description = "Получение урона возвращается DS%% урона всем врагам в малом радиусе 250",
            level = 0,
            DS = { 100, 200, 300 },
            pos = 3,
        },
        [4] = {
            name = "Натуральное питание",
            icon = "DDSICO\\EcoEat",
            description = "Увеличивает максимальное здоровье на DS",
            level = 0,
            DS = { 200, 350, 500 },
            pos = 4,
        },
        [5] = {
            name = "Фамильная реликвия",
            icon = "DDSICO\\FamilyRelict",
            description = "Наносит DS урона случайной цели",
            level = 0,
            DS = { 50, 100, 150 },
            pos = 5,
        },
    }
end