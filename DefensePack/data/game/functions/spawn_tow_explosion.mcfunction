gamerule mobGriefing false
summon minecraft:creeper ~ ~2 ~ {Fuse:0, Tags:["passenger"]}
schedule function game:reactivate_mob_grief 1t

#Rüstungsständer löschen, der die Funktion aufgerufen hat
kill @s