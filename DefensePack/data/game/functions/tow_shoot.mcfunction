#Nachladezeit starten
scoreboard players set @s timer 30

#Modus wechseln
scoreboard players set @s rocket_flying 1

#Munition abziehen
clear @s minecraft:iron_nugget{CustomModelData:3} 1

#Sound abspielen
playsound minecraft:tow.shoot ambient @a ~ ~ ~

#Projektil spawnen und ausrichten
summon minecraft:armor_stand ~ ~ ~ {NoGravity:1, Invisible:1, ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"3d80d659-36cd-4aee-8540-8cdb548ede75",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvM2FmNTk3NzZmMmYwMzQxMmM3YjU5NDdhNjNhMGNmMjgzZDUxZmU2NWFjNmRmN2YyZjg4MmUwODM0NDU2NWU5In19fQ=="}]}}}}]}
scoreboard players set @e[type=minecraft:armor_stand, limit=1, sort=nearest] tow_rocket 1
execute as @e[type=minecraft:armor_stand, limit=1, sort=nearest, scores={tow_rocket=1}] at @s run tp @s @p[scores={rocket_flying=1}]