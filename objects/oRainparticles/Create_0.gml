system = part_system_create();

particle = part_type_create();
part_type_shape(particle, pt_shape_line);
part_type_size(particle, 0.4, 0.3, 0, 0);
part_type_alpha2(particle, .5, .1);
part_type_gravity(particle, 0.3, 290);
part_type_speed(particle, 1, 1.1, 0, 0);
part_type_direction(particle, 250, 330, 0, 1);
part_type_orientation(particle, 290, 290, 0, 0, 0);
part_type_life(particle, 30, 200);

puddle = part_type_create();
part_type_shape(puddle,pt_shape_circle);
part_type_size(puddle,.5,1,.01,0);
part_type_scale(puddle,1,.2);
part_type_color1(puddle,c_white);
part_type_alpha2(puddle,.4,0);
part_type_speed(puddle,0,0,0,0);
part_type_direction(puddle,0,0,0,0);
part_type_gravity(puddle,0,270);
part_type_life(puddle,50,60);

part_type_death(particle,1,puddle);

emitter = part_emitter_create(system);
part_emitter_region(system, emitter, 0, 1920, -100, -200, ps_shape_line, ps_distr_linear);
part_emitter_stream(system, emitter, particle, 15);