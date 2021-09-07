schedule function game:start_day 1d
tellraw @a [{"text":"Es ist überstanden!", "color":"green"}]
#Debug
#schedule function game:start_day 400t

kill @e[type=#game:hostile]

#Tageszeit aktualisieren
scoreboard players set @e[type=villager, scores={trader=1}] day 1

#Trader heilen und wavebar zurücksetzen
scoreboard players set @e[type=villager, scores={trader=1}] traderHP 200


#Tote Spieler spawnen
tp @a[gamemode=spectator] @e[type=villager, scores={trader=1}, limit=1]
gamemode survival @a[gamemode=spectator]
#Death Marker beseitigen
kill @e[tag=death_marker]