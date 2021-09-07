schedule function game:spawn_wave 1d
#Debug
#schedule function game:spawn_wave 400t

difficulty hard

tellraw @a [{"text":"Finstere Kreaturen wurden gesichtet!", "color":"red"}]
execute as @a at @s run playsound minecraft:siren ambient @a ~ ~ ~

#Timer vom Trader auf 3 Sekunden setzen, in denen die Mobs verteilt werden. Siehe handle_mobs-Funktion.
scoreboard players set @e[type=villager, scores={trader=1}] timer 30

#Wave erhöhen
scoreboard players add @e[type=villager, scores={trader=1}] wave 1

tellraw @a [{"text":"Welle ","color":"red", "bold":"true"},{"score":{"name":"@e[type=villager, scores={trader=1}, limit=1]","objective":"wave"}},{"text":" gestartet!"}]

#Tageszeit aktualisieren
scoreboard players set @e[type=villager, scores={trader=1}] day 0

#Entities zählen
execute as @e run scoreboard players add @e[type=villager, scores={trader=1}] entity_counter 1

scoreboard players operation @e[type=villager, scores={trader=1}] wave_spawn += @e[type=villager, scores={trader=1}] wave
scoreboard players operation @e[type=villager, scores={trader=1}] wave_spawn += @e[type=villager, scores={trader=1}] wave