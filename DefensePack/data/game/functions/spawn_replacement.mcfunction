#Über allen natürlich gespawnten Mobs Shulkerbullets mit 50 Steps und Motion nach oben erzeugen.
#Die Shulkerbullet soll mit dem jeweiligen Mob als Reiter spawnen und das Original killen.
execute as @e[type=zombie, tag=!passenger] at @s run summon shulker_bullet ~ ~2 ~ {Steps:50, Tags:["carrier"], Motion:[0.0, 0.5, 0.0], Passengers:[{id:"zombie", Tags:["passenger"]}]}
execute as @e[type=skeleton, tag=!passenger] at @s run summon shulker_bullet ~ ~2 ~ {Steps:50, Tags:["carrier"], Motion:[0.0, 0.5, 0.0], Passengers:[{id:"skeleton", Tags:["passenger"]}]}
execute as @e[type=spider, tag=!passenger] at @s run summon shulker_bullet ~ ~2 ~ {Steps:50, Tags:["carrier"], Motion:[0.0, 0.5, 0.0], Passengers:[{id:"spider", Tags:["passenger"]}]}
execute as @e[type=enderman, tag=!passenger] at @s run summon shulker_bullet ~ ~2 ~ {Steps:50, Tags:["carrier"], Motion:[0.0, 0.5, 0.0], Passengers:[{id:"enderman", Tags:["passenger"]}]}
execute as @e[type=creeper, tag=!passenger] at @s run summon shulker_bullet ~ ~2 ~ {Steps:50, Tags:["carrier"], Motion:[0.0, 0.5, 0.0], Passengers:[{id:"creeper", Tags:["passenger"]}]}

#Items der Mobs auf die reitenden Versionen kopieren.
execute as @e[tag=passenger] at @s positioned ~ ~-2 ~ run data modify entity @s HandItems set from entity @e[type=#game:hostile, sort=nearest, limit=1, distance=0..3] HandItems
execute as @e[tag=passenger] at @s positioned ~ ~-2 ~ run data modify entity @s ArmorItems set from entity @e[type=#game:hostile, sort=nearest, limit=1, distance=0..3] ArmorItems

#Allen Shulkerbullets den Trader als Ziel festlegen.
execute as @e[tag=carrier] run data modify entity @s Target set from entity @e[type=villager, scores={trader=1}, limit=1] UUID

#Originale Mobs killen.
kill @e[type=#game:hostile, tag=!passenger]