move_speed = 1;

// Tilemap layer id (use layer_get_id to resolve by name)
tilemap = layer_tilemap_get_id(layer_get_id("Tiles_Col"));

// Combat stats
hp_total = 10;
hp = hp_total;
damage = 1;
charge = 0;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

// Add XP and handle level-ups (attach as instance method)
add_xp = function(_xp_to_add) {
    xp += _xp_to_add;

    // Handle multiple level-ups in case a large XP chunk is added
    while (xp >= xp_require && xp_require > 0) {
        xp -= xp_require;
        level += 1;

        // Increase requirements and stats
        xp_require = floor(xp_require * 1.4);
        if (xp_require < 1) xp_require = 1;

        hp_total += 5;
        hp = hp_total;
        damage += 0.8;
    }
};

