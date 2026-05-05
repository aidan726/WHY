// If a battle is already starting, do nothing
if (instance_exists(obj_battle_switcher)) exit;

// Apply damage only if not in invulnerable (alarm) state
if (alarm[0] < 0) {
    hp -= other.damage;
    alarm[0] = 60; // invulnerability frames
    image_blend = c_red;

    // If player died, restart room and stop further processing
    if (hp <= 0) {
        room_restart();
        exit;
    }
}

// Create battle switcher and pass references and IDs (safer)
var _switcher = instance_create_depth(0, 0, 0, obj_battle_switcher);
_switcher.player_data = self; // keep reference for compatibility
_switcher.enemy_data = other;
_switcher.player_id = id;
_switcher.enemy_id = other.id;
_switcher.original_room = room;

room_goto(rm_battle);
