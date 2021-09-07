#Turret abziehen
clear @s minecraft:carrot_on_a_stick{CustomModelData:5} 1

summon armor_stand ~ ~ ~ {Tags:["gun_turret"], CustomName:"\"Gun Turret\"", CustomNameVisible:1}
scoreboard players set @e[tag=gun_turret, limit=1, sort=nearest] timer 0
scoreboard players set @e[tag=gun_turret, limit=1, sort=nearest] ammo 0