#Wenn die Welle gerade spawnt, dafür sorgen, dass kein mob zu nah am Zentrum dran ist.
#execute as @e[type=villager, scores={trader=1, timer=1..}] run spreadplayers ~ ~ 2 50 false @e[type=#game:hostile, distance=0..20]
#execute as @e[type=villager, scores={trader=1, timer=1..}] run spreadplayers ~ ~ 2 50 false @e[type=#game:hostile, distance=100..]

#So viele Mobs pro Spieler spawnen wie der Wert der aktuellen Welle ist.
execute as @e[type=villager, scores={trader=1, wave_spawn=1..}] at @a run schedule function game:spawn_mob 10s append
execute as @e[type=villager, scores={trader=1, wave_spawn=1..}] at @a run schedule function game:spawn_mob 105s append
execute as @e[type=villager, scores={trader=1, wave_spawn=1..}] at @a run schedule function game:spawn_mob 210s append
execute as @e[type=villager, scores={trader=1, wave_spawn=1..}] at @a run schedule function game:spawn_mob 315s append


#Trader stirbt
execute if entity @e[type=villager, scores={trader=1, traderHP=..0}] run function game:trader_death


#Alle Mobs ran holen
#execute as @e[type=villager, scores={trader=1, day=0}] at @s run execute as @e[type=#game:hostile, distance=20..] at @s if block ^ ^ ^1 #game:move_through run execute unless entity @p[distance=..20, gamemode=survival] run tp @s ^ ^ ^1 facing entity @e[type=villager, scores={trader=1}, limit=1]
#Blöcke steigen
#execute as @e[type=villager, scores={trader=1, day=0}] at @s run execute as @e[type=#game:hostile, distance=20..] at @s unless block ^ ^ ^1 #game:move_through run execute unless entity @p[distance=..20, gamemode=survival] run tp @s ~ ~1 ~ facing entity @e[type=villager, scores={trader=1}, limit=1]
#Runter kommen
#execute as @e[type=villager, scores={trader=1, day=0}] at @s run execute as @e[type=#game:hostile, distance=20..] at @s if block ^ ^ ^1 #game:move_through run execute unless entity @p[distance=..20, gamemode=survival] run execute if block ~ ~-1 ~ #game:move_through run tp @s ^ ^-1 ^ facing entity @e[type=villager, scores={trader=1}, limit=1]


#Mobs wollen beim Trader bleiben
#execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=#game:hostile, distance=1..10] at @s if block ^ ^ ^1 #game:move_through run tp @s ^ ^ ^0.2 facing entity @e[type=villager, scores={trader=1}, limit=1]

#Alle Mobs beim Trader sichtbar machen
execute as @e[type=villager, scores={trader=1}] at @s if entity @e[type=#game:hostile, distance=0..10] run effect give @e[type=#game:hostile, distance=0..10] glowing 1 1 true

#Villager HP abziehen

execute as @e[type=villager, scores={trader=1}] at @s if entity @e[type=#game:hostile, distance=0..5] run scoreboard players remove @e[type=villager, scores={trader=1}] traderHP 1

#Leiterer

execute as @e[type=zombie_villager, tag=custom] at @s unless block ^ ^1 ^1 #game:move_through run execute unless block ^ ^1 ^1 minecraft:ladder run fill ^ ^ ^ ^1 ^3 ^ minecraft:ladder replace #game:move_through

#Leiterer ranholen
execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=zombie_villager] at @s if block ^ ^ ^1 #game:move_through run tp @s ^ ^ ^0.2 facing entity @e[type=villager, scores={trader=1}, limit=1]
#Blöcke steigen
execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=zombie_villager] at @s unless block ^ ^ ^1 #game:move_through run tp @s ~ ~0.2 ~ facing entity @e[type=villager, scores={trader=1}, limit=1]
#Runter kommen
execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=zombie_villager] at @s if block ^ ^ ^1 #game:move_through run execute if block ~ ~-1 ~ #game:move_through run tp @s ~ ~-0.2 ~ facing entity @e[type=villager, scores={trader=1}, limit=1]


#Agro-Creeper

execute as @e[type=creeper, tag=!pissed, tag=custom] at @s if entity @p[distance=0..10, gamemode=survival] run playsound minecraft:attack.scream ambient @a ~ ~ ~
execute as @e[type=creeper, tag=!pissed, tag=custom] at @s if entity @p[distance=0..10, gamemode=survival] run data merge entity @s {powered:1}
#Immer die vorherigen Tags beim mergen mitnehmen, denn sonst gehen sie verloren!
execute as @e[type=creeper, tag=!pissed, tag=custom] at @s if entity @p[distance=0..10] run data merge entity @s {Tags:["pissed", "custom"]}

execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=creeper, tag=pissed, tag=custom, distance=2..] at @s if block ^ ^ ^1 #game:move_through run tp @s ^ ^ ^1 facing entity @e[type=villager, scores={trader=1}, limit=1]
execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=creeper, tag=pissed, tag=custom, distance=2..] at @s unless block ^ ^ ^1 #game:move_through run execute if block ~ ~2 ~ #game:move_through run execute if block ^ ^1 ^1 #game_move_through run tp @s ^ ^1 ^1 facing entity @e[type=villager, scores={trader=1}, limit=1]
execute as @e[type=villager, scores={trader=1}] at @s run execute as @e[type=creeper, tag=pissed, tag=custom, distance=2..] at @s if block ^ ^-1 ^ #game:move_through run tp @s ~ ~-1 ~ facing entity @e[type=villager, scores={trader=1}, limit=1]
execute as @e[type=creeper, tag=pissed, tag=custom] at @s unless block ^ ^1 ^1 #game:move_through run data merge entity @s {Fuse:0}
execute as @e[type=creeper, tag=pissed, tag=custom] at @s if entity @e[type=villager, scores={trader=1}, distance=0..2] run data merge entity @s {Fuse:0}
execute as @e[type=creeper, tag=pissed, tag=custom] at @s if entity @p[distance=0..2, gamemode=survival] run data merge entity @s {Fuse:0}

#Zombie

#Debug: Alle Zombies zu diggern machen
execute as @e[type=zombie, tag=!digger] at @s run scoreboard players set @s timer 0
execute as @e[type=zombie, tag=!digger] at @s run data merge entity @s {Tags:["digger"]}

execute as @e[type=villager, scores={trader=1, dig_timer=0}] run execute as @e[tag=digger, limit=1, sort=random] at @s unless block ^ ^1 ^1 #game:move_through run function game:dig


#Ertrunkene
#Platzieren alle 20 Sekunden einen Quellblock, der nach 15 Sekunden wieder verschwindet.
execute as @e[type=villager, scores={trader=1, water_timer=0}] at @e[type=drowned] run summon armor_stand ~ ~5 ~ {NoGravity:1,Invisible:1,Tags:["well", "init"]}
execute as @e[type=villager, scores={trader=1, water_timer=0}] at @e[type=drowned] run fill ~ ~5 ~ ~ ~5 ~ minecraft:water replace #game:move_through
execute as @e[type=villager, scores={trader=1, water_timer=0}] at @e[type=drowned, limit=1] run scoreboard players set @s water_timer 200


#Super Bauer
execute as @e[tag=super_builder] at @s facing entity @e[type=villager, scores={trader=1}, limit=1] eyes if entity @e[type=villager, scores={trader=1}, distance=3..] run tp @s ^ ^ ^0.2
#Plattform unter sich erschaffen
execute as @e[tag=super_builder] at @s if entity @e[type=villager, scores={trader=1}, distance=3..] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 minecraft:dirt replace #game:move_through
#Raum um sich frei machen
execute as @e[tag=super_builder] at @s if entity @e[type=villager, scores={trader=1}, distance=3..] run fill ~-1 ~ ~-1 ~1 ~2 ~1 minecraft:air
#Sichtbar machen
execute as @e[tag=super_builder] at @s run effect give @s glowing 1 1