#Partikel spawnen
particle minecraft:smoke ~ ~1 ~ 0 0 0 1 0 force

#Damage machen
execute positioned ~ ~1 ~ run execute as @e[type=#game:hostile, distance=0..2, limit=1] at @s run summon arrow ~ ~3.5 ~ {Motion:[0.0,-10.0,0.0], Tags:["projectile", "alive"]}

#Rekursion fortführen wenn 1. der block im "Projektil" Luft ist und 2. kein Gegner in der Nähe ist und 3. der Abstand zum Schützen kleiner gleich 15 ist.
execute if block ~ ~2 ~ #game:move_through run execute unless entity @e[type=#game:hostile, distance=0..1] positioned ^ ^ ^1 run execute if entity @s[distance=..15] run function game:gun_turret_raycast