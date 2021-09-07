#Partikel spawnen
particle minecraft:dust 1 0 0 100 ~ ~1 ~ 0 0 0 1 1 force

#Damage machen
#execute positioned ~ ~1 ~ run execute as @e[type=#game:hostile, distance=0..2, limit=1] at @s run summon arrow ~ ~3.5 ~ {Motion:[0.0,-3.0,0.0], Tags:["projectile", "alive"]}
execute positioned ~ ~1 ~ run execute as @e[type=#game:undead, distance=0..2, limit=1] at @s run effect give @s instant_health 1 1 true
execute positioned ~ ~1 ~ run execute as @e[type=!player, type=!item, distance=0..2, limit=1] at @s run effect give @s instant_damage 1 1 true

#Rekursion fortführen wenn 1. der block im "Projektil" Luft ist und 2. kein Gegner in der Nähe ist und 3. der Abstand zum Schützen kleiner gleich 100 ist.
execute if block ~ ~2 ~ #game:move_through run execute unless entity @e[type=#game:hostile, distance=0..2] positioned ^ ^ ^1 run execute if entity @s[distance=..100] run function game:blaster_raycast