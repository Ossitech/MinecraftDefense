#Timer für die Nachladezeit setzen (Wird alle zwei Ticks um 1 verringert.)
scoreboard players set @s timer 20

#Munition abziehen
scoreboard players remove @s ammo 1

#Sound abspielen
playsound minecraft:gun_turret.shoot ambient @a ~ ~ ~

#Schuss starten
function game:gun_turret_raycast