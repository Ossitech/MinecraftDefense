scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice += @e[type=villager, scores={trader=1}] entity_counter
scoreboard players operation @e[type=villager, scores={trader=1}] mob_choice %= @e[type=villager, scores={trader=1}] num_types

#say SPAWN MOB Aufgerufen!

#Leiterer
execute as @e[type=villager, scores={trader=1, mob_choice=0..5}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] positioned ~ ~ ~ run summon minecraft:zombie_villager ~ ~ ~ {Tags:["custom"]}

execute as @e[type=villager, scores={trader=1, mob_choice=6..9}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:zombie_pigman ~ ~ ~ {Tags:["custom"], Anger:10000, followRange:100, HandItems:[{Count:1,id:"minecraft:golden_sword"}]}

#Agro Creeper
execute as @e[type=villager, scores={trader=1, mob_choice=10..11}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:creeper ~ ~ ~ {Tags:["custom"]}

execute as @e[type=villager, scores={trader=1, mob_choice=12..15}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:phantom ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=16..17}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:ghast ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=18..19}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:blaze ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=20..25}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:silverfish ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=26..27}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:pillager ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=29..30}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:vindicator ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=31}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:slime ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=32}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:magma_cube ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=33}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:evoker ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=34}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:illusioner ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=35}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:ravager ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=36}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:vex ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=37}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:wolf ~ ~ ~

execute as @e[type=villager, scores={trader=1, mob_choice=38..39}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:wither_skeleton ~ ~ ~

#Ertrunkener
execute as @e[type=villager, scores={trader=1, mob_choice=40..45}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:drowned ~ ~ ~

#Super Bauer
execute as @e[type=villager, scores={trader=1, mob_choice=46..50}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run summon minecraft:husk ~ ~ ~ {Tags:["super_builder"]}
execute as @e[type=villager, scores={trader=1, mob_choice=46..50}] at @e[type=armor_stand, tag=spawner, limit=1, sort=random] run effect give @e[tag=super_builder] minecraft:absorption 1000 5 true
#Warnung geben
execute as @e[type=villager, scores={trader=1, mob_choice=46..50}] at @s run tellraw @a [{"text":"ACHTUNG! Ein Super Builder wurde gesichtet!", "color":"red", "bold":"true"}]
execute as @e[type=villager, scores={trader=1, mob_choice=46..50}] at @a run playsound minecraft:builder.warning ambient @a ~ ~ ~