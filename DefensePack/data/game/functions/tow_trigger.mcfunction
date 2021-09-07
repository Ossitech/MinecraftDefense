#Modus wechseln
scoreboard players set @s rocket_flying 0

execute as @e[type=minecraft:armor_stand, scores={tow_rocket=1}, limit=1, sort=nearest] at @s run function game:spawn_tow_explosion