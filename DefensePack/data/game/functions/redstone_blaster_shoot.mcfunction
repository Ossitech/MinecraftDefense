#Timer für die Nachladezeit setzen (Wird alle zwei Ticks um 1 verringert.)
scoreboard players set @s timer 5

#Leichte Munition abziehen
clear @s minecraft:iron_nugget{CustomModelData:1} 1

#Sound abspielen
playsound minecraft:blaster.shoot ambient @a ~ ~ ~

#Schuss starten
function game:redstone_blaster_raycast