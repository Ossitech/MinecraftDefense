tellraw @a [{"selector":"@p"}, {"text":" respawnt in 30 Sekunden!", "color":"blue"}]
execute at @e[type=villager, scores={trader=1}, limit=1] run spawnpoint @s ~ ~ ~
scoreboard players set @s death_timer 300
gamemode spectator