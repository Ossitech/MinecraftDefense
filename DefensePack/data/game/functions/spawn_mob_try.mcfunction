execute as @e[type=#game:hostile, tag=!passenger, sort=random, limit=1] at @s run function game:spawn_mob

#Wenn kein natürlich gespawnter Mob gefunden wird, dann in 5 Sekunden wieder versuchen.
execute unless entity @e[type=#game:hostile, tag=!passenger] run schedule function game:spawn_mob_try 5s append