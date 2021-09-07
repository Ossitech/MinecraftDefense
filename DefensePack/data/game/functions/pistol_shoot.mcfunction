#Timer für die Nachladezeit setzen (Wird alle zwei Ticks um 1 verringert.)
scoreboard players set @s timer 10

#Munition abziehen
clear @s minecraft:iron_nugget{CustomModelData:1} 1

#Sound abspielen
playsound minecraft:pistol.shoot ambient @a ~ ~ ~

#Schuss starten
function game:pistol_raycast