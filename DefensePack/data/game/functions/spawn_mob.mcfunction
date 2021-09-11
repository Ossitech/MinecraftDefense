#Alle Mobs (tag=passenger) werden reitend auf Shulkerbullets (tag=carrier) gespawnt, welche den Trader als Ziel haben.
#Viele mobs spawnen ja nachts auch normal. Diese werden auch mit Mobs (tag=passenger) auf Shulkerbullets ersetzt.

#Randomness einbauen
scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice += @e[type=villager, scores={trader=1}] entity_counter
scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice %= @e[type=villager, scores={trader=1}] num_types

#say SPAWN MOB Aufgerufen!

#Leiterer
execute if entity @e[type=villager, scores={trader=1, mob_choice=0..5}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:zombie_villager ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=6..9}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:zombified_piglin ~ ~ ~

#Agro Creeper
execute if entity @e[type=villager, scores={trader=1, mob_choice=10..12}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:creeper ~ ~ ~ {Tags:["custom"]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=13..15}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:phantom ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=16..20}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:ghast ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=21..25}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:blaze ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=26..27}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:silverfish ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=28..30}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:pillager ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=31..35}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:vindicator ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=36}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:slime ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=37}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:magma_cube ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=38}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:evoker ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=39}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:illusioner ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=40}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:ravager ~ ~ ~

execute if entity @e[type=villager, scores={trader=1, mob_choice=41..43}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:wither_skeleton ~ ~ ~

#Ertrunkener
execute if entity @e[type=villager, scores={trader=1, mob_choice=44..47}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:drowned ~ ~ ~

#Super Bauer
execute if entity @e[type=villager, scores={trader=1, mob_choice=48..50}] as @e[tag=spawner, sort=random, limit=1] at @s run summon minecraft:husk ~ ~ ~ {Tags:["super_builder"]}
execute if entity @e[type=villager, scores={trader=1, mob_choice=48..50}] run effect give @e[tag=super_builder] minecraft:absorption 1000 5 true

#Warnung geben
execute as @e[type=villager, scores={trader=1, mob_choice=48..50}] at @s run tellraw @a [{"text":"ACHTUNG! Ein schwerer Kumpel wurde gesichtet!", "color":"red", "bold":"true"}]
execute as @e[type=villager, scores={trader=1, mob_choice=48..50}] at @a run playsound minecraft:builder.warning ambient @a ~ ~ ~