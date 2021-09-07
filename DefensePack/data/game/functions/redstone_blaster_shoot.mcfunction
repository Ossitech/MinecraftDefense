#Timer für die Nachladezeit setzen (Wird alle zwei Ticks um 1 verringert.)
scoreboard players set @s timer 5

#Munition abziehen
clear @s minecraft:redstone 1

#Sound abspielen
playsound minecraft:blaster.shoot ambient @a ~ ~ ~

#Schuss starten
function game:blaster_raycast