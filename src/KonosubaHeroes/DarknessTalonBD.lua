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
            DS = { 1, 2, 3, 4, 5 },
            pos = 1,
        },
        [2] = {
            name = "Маска льва",
            icon = "DDSICO\\LionMask",
            description = "При получении 300 урона выпускает волну силы наносящую DS урон",
            level = 0,
            DS = { 100, 200, 300, 400 },
            pos = 2,
        },
        [3] = {
            name = "Разбитое сердце",
            icon = "DDSICO\\BrokenHeart",
            description = "Получение урона возвращается DS%% урона всем врагам в малом радиусе 250",
            level = 0,
            DS = { 5, 10, 15, 20, 25, 30 },
            pos = 3,
        },
        [4] = {
            name = "Натуральное питание",
            icon = "DDSICO\\EcoEat",
            description = "Увеличивает максимальное здоровье на DS",
            level = 0,
            DS = { 200, 350, 500, 500, 500 },
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
        [6] = {
            name = "Сердечные переживания",
            icon = "DDSICO\\HalfHP",
            description = "Пока герой в активном слоте, исцеляет сопартийцев на DS в секунду, но не больше чем 50%% ХП",
            level = 0,
            DS = { 10, 20, 30 },
        },
        [7] = {
            name = "Прочнее щит",
            icon = "DDSICO\\AddHPShield",
            description = "Щит теперь способен поглотить DS урона ",
            level = 0,
            DS = { 300, 400, 500, 600, 700 },
        },
        [8] = {
            name = "Принцесса из башни",
            icon = "DDSICO\\PrincessTower",
            description = "Увеличивает естественную броню Лалатины ещё на DS единиц",
            level = 0,
            DS = { 5, 5, 5, 5, 5, 10 },
        },
        [9] = {
            name = "Золотая корона",
            icon = "DDSICO\\GoldCrown",
            description = "Применяет способность DS при завершении рывка",
            level = 0,
            DS = { "Стягивание Q" },
        },
        [10] = {
            name = "Тройной толчок",
            icon = "DDSICO\\TripleBall",
            description = "Позволяет стрелять сразу DS шарами при применении отталкивания RMB",
            level = 0,
            DS = { "Тремя" },
        },
        [11] = {
            name = "Подорожник",
            icon = "DDSICO\\Roadleef",
            description = "Увеличивает эффект получаемого лечения на DS ед., при любых обстоятельствах",
            level = 0,
            DS = { 1, 2, 3, 4, 5 },
        },
        [12] = {
            name = "Теневая тентакля",
            icon = "DDSICO\\Tentacle",
            description = "Каждые 5 секунд хватает случайного врага и убирает его из игры на 6 секунд, уменьшает максимальное хп на DS%% за каждую секунду действия",
            level = 0,
            DS = { 5 },
        },
    }
end