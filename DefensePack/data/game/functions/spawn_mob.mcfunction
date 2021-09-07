#Alle Mobs (tag=passenger) werden reitend auf Shulkerbullets (tag=carrier) gespawnt, welche den Trader als Ziel haben.
#Viele mobs spawnen ja nachts auch normal. Diese werden auch mit Mobs (tag=passenger) auf Shulkerbullets ersetzt.

#Randomness einbauen
scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice += @e[type=villager, scores={trader=1}] entity_counter
scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice %= @e[type=villager, scores={trader=1}] num_types

#say SPAWN MOB Aufgerufen!

#Leiterer
execute if entity @e[type=villager, scores={trader=1, mob_choice=0..5}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:zombie_villager", Tags:["passenger"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=5..10}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:zombie_pigman", Tags:["passenger", "custom"], Anger:10000, followRange:100, HandItems:[{Count:1,id:"minecraft:golden_sword"}]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

#Agro Creeper
execute if entity @e[type=villager, scores={trader=1, mob_choice=10..12}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:creeper", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=13..15}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:phantom", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=16..20}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:ghast", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=21..25}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:blaze", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=26..28}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:silverfisch", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=29..31}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:pillager", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=32..33}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:vindicator", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=34..35}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:slime", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=36..37}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:magma_cube", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=38..39}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:evoker", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=40..41}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:illusioner", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=42..43}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:raveger", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

execute if entity @e[type=villager, scores={trader=1, mob_choice=44..45}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:wither_skeleton", Tags:["passenger", "custom"], HandItems:[{Count:1,id:"minecraft:stone_sword"}]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

#Ertrunkener
execute if entity @e[type=villager, scores={trader=1, mob_choice=46..47}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:drowned", Tags:["passenger", "custom"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}

#Super Bauer
execute if entity @e[type=villager, scores={trader=1, mob_choice=48..50}] run summon minecraft:shulker_bullet ~ ~2 ~ {Passengers:[{id:"minecraft:husk", Tags:["passenger", "custom", "super_builder"]}],Tags:["carrier"], Motion:[0.0, 0.5, 0.0]}
execute if entity @e[type=villager, scores={trader=1, mob_choice=48..50}] run effect give @e[tag=super_builder] minecraft:absorption 1000 5 true
#Warnung geben
execute as @e[type=villager, scores={trader=1, mob_choice=48..50}] at @s run tellraw @a [{"text":"ACHTUNG! Ein schwerer Kumpel wurde gesichtet!", "color":"red", "bold":"true"}]
execute as @e[type=villager, scores={trader=1, mob_choice=48..50}] at @a run playsound minecraft:builder.warning ambient @a ~ ~ ~


#Shulkerbullets den Trader als Ziel geben
execute as @e[tag=carrier] run data modify entity @s Target set from entity @e[type=villager, scores={trader=1}, limit=1] UUID

#Shulkerbullets haltbar machen
execute as @e[tag=carrier] run data modify entity @s Steps set value 50