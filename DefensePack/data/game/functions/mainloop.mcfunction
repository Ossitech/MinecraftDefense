#Überprüfen ob der Spieler beiom Rechtsklick die Pistole (Waffe 1) in der Hand hat und passende Munition im Inventar. Dann Wird die passende Schussfunktion aufgerufen.
execute as @a[scores={click=1.., timer=0}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:1}}, Inventory:[{id:"minecraft:iron_nugget", tag:{CustomModelData:1}}]}] at @s run function game:pistol_shoot

#Nun für die Flak-Kanone
execute as @a[scores={click=1.., timer=0}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:2}}, Inventory:[{id:"minecraft:iron_nugget", tag:{CustomModelData:2}}]}] at @s run function game:flak_shoot

#Und für den Tow-Werfer
execute as @a[scores={click=1.., rocket_flying=0, timer=0}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:3}}, Inventory:[{id:"minecraft:iron_nugget", tag:{CustomModelData:3}}]}] at @s run function game:tow_shoot

#Tow-Rakete zünden
execute as @a[scores={click=1.., rocket_flying=1, timer=0..29}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:3}}}] at @s run function game:tow_trigger

#Redstoneblaster
execute as @a[scores={click=1.., timer=0}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:4}}, Inventory:[{id:"minecraft:iron_nugget", tag:{CustomModelData:1}}]}] at @s run function game:redstone_blaster_shoot

#Item Magnet
execute as @a[scores={click=1..}, nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick", tag:{CustomModelData:6}}}] at @s run function game:activate_item_magnet

#Klicks zurücksetzen
scoreboard players set @a[scores={click=1..}] click 0


#Projektile verarbeiten
function game:handle_projectiles
#Mobs verarbeiten
function game:handle_mobs


#Neue Spieler hinzufügen
execute if entity @a[gamemode=creative, tag=!developer] run function game:init


#Bossbar anzeigen
execute store result bossbar minecraft:trader value run scoreboard players get @e[type=villager, scores={trader=1}, limit=1] traderHP


#Todesmechanik
execute as @a[gamemode=survival, scores={HP=0}] at @s run function game:spectate


#Timer runterzählen für jeden Spieler
scoreboard players remove @e[scores={timer=1..}] timer 1
scoreboard players remove @e[scores={dig_timer=1..}] dig_timer 1
scoreboard players remove @e[scores={water_timer=1..}] water_timer 1

#Counter zum Spawnen der Wellenstärke runterzählen
scoreboard players remove @e[type=villager, scores={wave_spawn=1..}] wave_spawn 1

#Den death_timer für jeden Spieler runterzählen
execute as @a[scores={death_timer=1..}] run scoreboard players remove @s death_timer 1
execute as @a[scores={death_timer=1..}] run tellraw @s [{"text":"Respawn: "},{"score":{"name":"@s","objective":"death_timer"}}]
#Spieler wieder auf Survival setzen
execute as @a[scores={death_timer=1}] run gamemode survival @s
execute as @a[scores={death_timer=1}] run tp @s @e[scores={trader=1}, limit=1]

#Loopen
schedule function game:mainloop 2t