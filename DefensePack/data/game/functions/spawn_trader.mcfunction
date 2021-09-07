#Aufräumen
schedule clear game:mainloop
schedule clear game:spawn_wave
schedule clear game:start_day

#Trader erzeugen
summon villager ~ ~ ~ {CustomName:"\"Trader\"",VillagerData:{profession:weaponsmith,level:99,type:desert},Invulnerable:1,PersistenceRequired:1,NoAI:1,Offers:{Recipes:[{buy:{id:emerald,Count:1},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:6,display:{Name:"\"Item Magnet\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:gunpowder,Count:5},sell:{id:emerald,Count:1},rewardExp:0b,maxUses:9999999},{buy:{id:rotten_flesh,Count:5},sell:{id:emerald,Count:1},rewardExp:0b,maxUses:9999999},{buy:{id:bone,Count:5},sell:{id:emerald,Count:1},rewardExp:0b,maxUses:9999999},{buy:{id:spider_eye,Count:5},sell:{id:emerald,Count:1},rewardExp:0b,maxUses:9999999},{buy:{id:ender_pearl,Count:1},sell:{id:emerald,Count:1},rewardExp:0b,maxUses:9999999},{buy:{id:gold_ingot,Count:1},sell:{id:emerald,Count:2},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:1},sell:{id:arrow,Count:20},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:30},buyB:{id:armor_stand,Count:1},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:5,display:{Name:"\"Gun Turret\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:20},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:4,display:{Name:"\"Redstone Blaster\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:20},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:1,display:{Name:"\"Pistole\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:1},sell:{id:iron_nugget,Count:16,tag:{CustomModelData:1,display:{Name:"\"Pistolenkugeln\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:30},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:2,display:{Name:"\"Flak-Kanone\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:1},sell:{id:iron_nugget,Count:8,tag:{CustomModelData:2,display:{Name:"\"Flak-Munition\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:40},sell:{id:carrot_on_a_stick,Count:1,tag:{CustomModelData:3,display:{Name:"\"TOW-Raketenwerfer\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:1},sell:{id:iron_nugget,Count:4,tag:{CustomModelData:3,display:{Name:"\"TOW-Rakete\""}}},rewardExp:0b,maxUses:9999999},{buy:{id:emerald,Count:32},sell:{id:trident,Count:1},rewardExp:0b,maxUses:9999999}]}}

#Trader als solchen markieren
scoreboard players set @e[type=villager, limit=1, sort=nearest] trader 1
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] day 1
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] entity_counter 0
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] num_types 50
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] wave 0
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] traderHP 200
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] dig_timer 0
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] water_timer 200
scoreboard players set @e[type=villager, scores={trader=1}, limit=1, sort=nearest] wave_spawn 0

say Trader wurde bei @p gespawnt!


title @a times 10 40 10
title @a title "Verteigdigt"
title @a subtitle "den Trader!"


#Chunk mit Trader dauerhaft geladen lassen
forceload add ~ ~

#Spawnpunkt setzen
execute as @e[type=villager, scores={trader=1}] at @s run spawnpoint @a ~ ~ ~

#Spawnpunkte einfügen in allen vier Himmelsrichtungen vom Trader aus
summon armor_stand ~-50 255 ~ {Invisible:1,Tags:["spawner"]}
summon armor_stand ~50 255 ~ {Invisible:1,Tags:["spawner"]}
summon armor_stand ~ 255 ~-50 {Invisible:1,Tags:["spawner"]}
summon armor_stand ~ 255 ~50 {Invisible:1,Tags:["spawner"]}


time set 1000
bossbar set minecraft:wavebar value 1000
schedule function game:spawn_wave 0.5d
schedule function game:start_day 23000t
#Debug
#schedule function game:spawn_wave 200t
#schedule function game:start_day 400t