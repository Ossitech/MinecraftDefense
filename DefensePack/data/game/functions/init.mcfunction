scoreboard objectives add click minecraft.used:minecraft.carrot_on_a_stick

scoreboard objectives add timer dummy
scoreboard players set @a timer 0

scoreboard objectives add passenger dummy

scoreboard objectives add death_timer dummy
#Für neue Spieler den death_timer auf 0 setzen aber aktuell tote Spieler sollen nicht durch einen rejoin direkt wiederbelebt werden.
#Wenn der death_timer für diesen Spieler noch uninitialisiert ist soll er auf 0 gesetzt werden.
execute as @a unless entity @s[scores={death_timer=0..}] run scoreboard players set @a death_timer 0

scoreboard objectives add tow_rocket dummy

scoreboard objectives add rocket_flying dummy
scoreboard players set @a rocket_flying 0

scoreboard objectives add trader dummy

scoreboard objectives add entity_counter dummy

scoreboard objectives add mob_choice dummy

scoreboard objectives add num_types dummy

scoreboard objectives add spawner dummy

scoreboard objectives add wave dummy

scoreboard objectives add wave_spawn dummy

scoreboard objectives add day dummy

scoreboard objectives add traderHP dummy

scoreboard objectives add dig_timer dummy

scoreboard objectives add ammo dummy

scoreboard objectives add water_timer dummy

scoreboard objectives add HP health
scoreboard objectives setdisplay belowName HP

#Bossbars hinzufügen
bossbar add trader "Trader HP"
bossbar set minecraft:trader color blue
bossbar set minecraft:trader players @a
bossbar set minecraft:trader max 200

say Damit neu beitretende Spieler erkannt werden musst du die Welt im Kreativmodus öffnen!

gamemode survival @a[gamemode=creative, tag=!developer]


#Team setzen und konfigurieren

team add OGs
team join OGs @a
team modify OGs prefix "[OG] "
team modify OGs friendlyFire false


#Trader spawnen
execute as @r at @s unless entity @e[type=minecraft:villager, scores={trader=1}] run function game:spawn_trader

#Spawnpunkt setzen
#execute as @e[type=villager, scores={trader=1}] at @s run spawnpoint @a ~ ~ ~

#Inventar behalten
gamerule keepInventory true

function game:mainloop