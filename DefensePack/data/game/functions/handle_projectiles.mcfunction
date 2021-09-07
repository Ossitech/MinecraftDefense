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


#Gun Turrets handlen
#Schießen
execute as @e[tag=gun_turret, scores={timer=0, ammo=1..}] at @s if entity @e[type=#game:hostile, distance=0..15] facing entity @e[type=#game:hostile, distance=0..15, limit=1, sort=random] feet run function game:gun_turret_check

#Aufmunitionieren
execute as @e[tag=gun_turret] at @s run execute at @e[type=item, nbt={Item:{id:"minecraft:arrow", Count:1b}}, distance=0..0.5] run scoreboard players add @s ammo 1
execute as @e[tag=gun_turret] at @s run execute at @e[type=item, nbt={Item:{id:"minecraft:arrow", Count:1b}}, distance=0..0.5, limit=1] run tellraw @p [{"text":"Munition: ","color":"green"},{"score":{"name":"@s","objective":"ammo"}},{"text":" Schuss"}]
execute as @e[tag=gun_turret] at @s run execute as @e[type=item, nbt={Item:{id:"minecraft:arrow", Count:1b}}, distance=0..0.5] at @s run kill @s

#Quellen von Ertrunkenen
execute as @e[type=armor_stand, tag=well, tag=init] at @s run scoreboard players set @s timer 150
execute as @e[type=armor_stand, tag=well, tag=init] at @s run data merge entity @s {Tags:["well"]}

execute as @e[type=armor_stand, tag=well, scores={timer=0}] at @s run fill ~ ~ ~ ~ ~ ~ minecraft:air replace minecraft:water
execute as @e[type=armor_stand, tag=well, scores={timer=0}] at @s run kill @s


#Death Marker
#Spieler da halten
execute as @e[type=armor_stand, tag=death_marker] at @s run tp @p[gamemode=spectator] @s
#Partikel spawnen
execute as @e[type=armor_stand, tag=death_marker] at @s run particle minecraft:dust 0.5 0 0.5 100 ~ ~1 ~ 1 1 1 1 1
#Reviven
execute as @e[type=armor_stand, tag=death_marker, scores={timer=0..600}] at @s if entity @p[distance=0..3, gamemode=survival] run function game:revive
#Ansagen
execute as @e[type=armor_stand, tag=death_marker, scores={timer=600}] at @s run tellraw @a [{"selector":"@p"}, {"text":" kann nun gerettet werden. Ihr habt eine Minute Zeit!", "color":"blue"}]

execute as @e[type=armor_stand, tag=death_marker, scores={timer=300}] at @s run tellraw @a [{"selector":"@p"}, {"text":" kann nur noch 30 Sekunden lang wiederbelebt werden!", "color":"blue"}]

execute as @e[type=armor_stand, tag=death_marker, scores={timer=100}] at @s run tellraw @a [{"selector":"@p"}, {"text":" kann nur noch 10 Sekunden lang wiederbelebt werden!", "color":"blue"}]

execute as @e[type=armor_stand, tag=death_marker, scores={timer=50}] at @s run tellraw @a [{"selector":"@p"}, {"text":" kann nur noch 5 Sekunden lang wiederbelebt werden!", "color":"blue"}]

#Death Marker löschen
execute as @e[type=armor_stand, tag=death_marker, scores={timer=0}] at @s run tellraw @a [{"text":""}, {"text":"Die Minute ist abgelaufen und ", "color":"red"}, {"selector":"@p"}, {"text":" wurde nicht wiederbelebt. Er wird beim nächsten Tagesanbruch beim Trader spawnen!", "color":"red"}]
execute as @e[type=armor_stand, tag=death_marker, scores={timer=0}] at @s run kill @s