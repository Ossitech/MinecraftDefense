#Rekursion fortführen wenn 1. der block im "Projektil" move_through ist und 2. der Abstand zum Schützen kleiner gleich 15 ist.
execute unless block ~ ~2 ~ #game:move_through run tag @s add no_target

execute if entity @s[tag=!no_target, distance=0..15] positioned ^ ^ ^0.2 run execute unless entity @e[type=#game:hostile, distance=0..1] run function game:gun_turret_los
