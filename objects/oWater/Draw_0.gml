/// @description

var _left = bbox_left;
var _top = bbox_top;
var _appscale = surface_get_height(application_surface) / 540

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

waterSurface = surface_create(sprite_width, sprite_height+transBuffHeight);
surface_set_target(waterSurface);

	draw_clear_alpha(c_blue,0);
	draw_set_color(color);
	draw_rectangle(0,transBuffHeight,sprite_width,sprite_height+transBuffHeight,false);
	draw_surface_part_ext(application_surface, (_left - _camX) * _appscale, (_top - _camY) * _appscale, sprite_width * _appscale, sprite_height * _appscale, 0, transBuffHeight, 1 / _appscale, 1 / _appscale, c_blue, 1);
	gpu_set_colorwriteenable(true,true,true,false);
	draw_set_alpha(0.5);
	draw_set_color($f4eb42);
	draw_line(0,transBuffHeight+1,sprite_width,transBuffHeight+1);
	
	draw_set_color(c_white);
	draw_line(0,transBuffHeight,sprite_width,transBuffHeight);
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true,true,true,true);
	
surface_reset_target();
pW = texture_get_texel_width(surface_get_texture(waterSurface));
pH = texture_get_texel_height(surface_get_texture(waterSurface));

resizeSurface = surface_create(sprite_width,sprite_height+transBuffHeight);
surface_set_target(resizeSurface);
	draw_clear_alpha(c_white,0)
	shader_set(shWave);
		shader_set_uniform_f(global.u_pixelH_Wave,pH);
		shader_set_uniform_f(global.u_pixelW_Wave,pW);
		shader_set_uniform_f(global.u_springCount,springCount);
		shader_set_uniform_f_array(global.u_springs,springs);
		shader_set_uniform_f(global.u_time,get_timer()*0.0000025);
		draw_surface(waterSurface,0,0);
	shader_reset();
surface_reset_target();

draw_surface(resizeSurface,_left,_top-transBuffHeight);

surface_free(waterSurface);
surface_free(resizeSurface);