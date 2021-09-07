#Timer für die Nachladezeit setzen (Wird alle zwei Ticks um 1 verringert.)
scoreboard players set @s timer 20

#Munition abziehen
clear @s minecraft:iron_nugget{CustomModelData:2} 1

#Schießen

#Sound abspielen
playsound minecraft:flak.shoot ambient @a ~ ~ ~

#Partikel spawnen
particle minecraft:poof ^ ^2 ^5 1 1 1 0 100
particle minecraft:poof ^ ^2 ^10 1 1 1 0 100

#Damage machen
execute as @s positioned ^ ^1 ^3 run effect give @e[type=!player, type=!#game:undead, type=!villager, distance=0..2] minecraft:instant_damage 1 2
execute as @s positioned ^ ^1 ^3 run effect give @e[type=#game:undead, distance=0..2] minecraft:instant_health 1 2

execute as @s positioned ^ ^1 ^6 run effect give @e[type=!player, type=!#game:undead, type=!villager, distance=0..2] minecraft:instant_damage 1 2
execute as @s positioned ^ ^1 ^6 run effect give @e[type=#game:undead, distance=0..2] minecraft:instant_health 1 2