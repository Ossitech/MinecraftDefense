#Tow-Rakete fortbewegen
execute as @e[type=minecraft:armor_stand, scores={tow_rocket=1}] at @s run tp @s ^ ^ ^2

#Tow-Raketenrauch
execute as @e[type=minecraft:armor_stand, scores={tow_rocket=1}] at @s run particle minecraft:flame ~ ~2 ~ 0.2 0.2 0.2 0 10 force

#Tow-Aufprall
execute as @e[type=minecraft:armor_stand, scores={tow_rocket=1}] at @s unless block ~ ~1 ~ minecraft:air run scoreboard players set @p[scores={rocket_flying=1}] rocket_flying 0
execute as @e[type=minecraft:armor_stand, scores={tow_rocket=1}] at @s unless block ~ ~1 ~ minecraft:air run function game:spawn_tow_explosion

#Projektilpfeile nach 2 Ticks löschen
kill @e[type=arrow, tag=projectile, tag=!alive]
execute as @e[type=arrow,tag=projectile,tag=alive] at @s run data merge entity @s {Tags:["projectile"]}


#Quellen von Ertrunkenen
execute as @e[type=armor_stand, tag=well, tag=init] at @s run scoreboard players set @s timer 150
execute as @e[type=armor_stand, tag=well, tag=init] at @s run data merge entity @s {Tags:["well"]}

execute as @e[type=armor_stand, tag=well, scores={timer=0}] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:air replace minecraft:water
execute as @e[type=armor_stand, tag=well, scores={timer=0}] at @s run kill @s