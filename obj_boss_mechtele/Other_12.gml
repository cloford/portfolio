///@desc 剣を振る（1）


mysword = instance_create_layer(x,y,layer,obj_boss_mechtele_sword);
mysword.creator = id;
mysword.direction = direction;
mysword.image_angle = direction;

self.alarm[0] = 49;