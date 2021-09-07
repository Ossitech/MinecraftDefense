tellraw @a [{"selector":"@p"}, {"text":" kann in 15 Sekunden wiederbelebt werden!", "color":"blue"}]
spawnpoint @p ~ ~ ~
summon armor_stand ~ ~ ~ {Invisible:1, NoGravity:1, Tags:["death_marker"]}
scoreboard players set @e[type=armor_stand, tag=death_marker, limit=1, sort=nearest] timer 750
effect give @e[type=armor_stand, tag=death_marker, limit=1, sort=nearest] minecraft:glowing 10000 1
gamemode spectator
spectate @e[type=armor_stand, tag=death_marker, limit=1, sort=nearest] @p