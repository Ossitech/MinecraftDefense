#Aufräumen
schedule clear game:spawn_wave
schedule clear game:start_day

kill @e[type=armor_stand, tag=spawner]

kill @e[type=villager, scores={trader=1}]

title @a times 10 40 10
title @a title "Verkackt!"