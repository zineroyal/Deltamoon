var _scissor = gpu_get_scissor();

var scissor_x = bbox_left - guipos_x()
var scissor_y = bbox_top - guipos_y()
var scissor_width = bbox_right - bbox_left
var scissor_height = bbox_bottom - bbox_top

var screen_w = window_get_fullscreen() ? display_get_width() : window_get_width()
var screen_h = window_get_fullscreen() ? display_get_height() : window_get_height()

var surface = surface_get_target()
if (surface_exists(surface))
{
    screen_w = surface_get_width(surface)
    screen_h = surface_get_height(surface)
}

var scale_x = screen_w / camera_get_view_width(view_camera[0])
var scale_y = screen_h / camera_get_view_height(view_camera[0])

gpu_set_scissor(scissor_x * scale_x, scissor_y * scale_y, scissor_width * scale_x, scissor_height * scale_y);

var party_objects = [];
for (var i = 0; i < array_length(global.party_names); i++)
{
    array_push(party_objects, party_get_inst(global.party_names[i]));
}

array_sort(party_objects, function(a, b) {
    return a.depth >= b.depth
})

for (var i = 0; i < array_length(party_objects); i++)
{
    var c = party_objects[i]
    var party_sprite  = c.sprite_index

   switch (c.dir)
   {
       case DIR.DOWN:
           party_sprite = c.s_move[DIR.UP]
           break;
       case DIR.UP:
           party_sprite = c.s_move[DIR.DOWN]
           break;
   }

    var draw_y = bbox_bottom - (c.y - bbox_bottom)
    draw_sprite_ext(party_sprite, c.image_index, c.x, draw_y + OFFSET, c.image_xscale, c.image_yscale, c.image_angle, c.image_blend, c.image_alpha)
}

gpu_set_scissor(_scissor);