tag @s remove no_target
function game:gun_turret_los
execute if entity @s[tag=!no_target] run function game:gun_turret_shoot