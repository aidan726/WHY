var _dx = 16;
var _dy = 16;
var _barw = 256;
var _barh = 32;

// Properties
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Healthbar (safe: avoid division by zero and clamp ratios 0..1)
var _hp_ratio = 0;
if (hp_total > 0) {
    _hp_ratio = clamp(hp / hp_total, 0, 1);
}
var _health_barw = _barw * _hp_ratio;

draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_barw, _barh, c_red, 0.6);

draw_text(_dx + _barw / 2, _dy + _barh / 2, "HP");

// XP (safe)
var _xp_ratio = 0;
if (xp_require > 0) {
    _xp_ratio = clamp(xp / xp_require, 0, 1);
}
var _xp_barw = _barw * _xp_ratio;
_dy += _barh + 8;

draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _xp_barw, _barh, c_blue, 0.6);

draw_text(_dx + _barw/2, _dy + _barh/2, $"LEVEL {level}");

// Reset properties
draw_set_halign(fa_left);
draw_set_valign(fa_top);