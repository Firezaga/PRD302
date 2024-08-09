shader_type canvas_item;
render_mode blend_mix,unshaded;

uniform float scroll_speed : hint_range(0, 2) = 0.08;
uniform float angle_degrees : hint_range(0, 360) = 45.0;
uniform float repeat_x : hint_range(1, 20) = 20;
uniform float repeat_y : hint_range(1, 20) = 12;
uniform float row_offset : hint_range(0, 1) = 1;

uniform float brightness : hint_range(-1, 1) = 0;
uniform float contrast : hint_range(0, 3) = 1.0;
uniform float saturation : hint_range(0, 3) = 1.0;

uniform float redVal : hint_range(0, 1) = 1.0;
uniform float greenVal : hint_range(0, 1) = 1.0;
uniform float blueVal : hint_range(0, 1) = 1.0;

uniform vec4 tint_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float tint_effect_factor : hint_range(0, 1) = 0.0;

uniform sampler2D texture_to_scroll;

//---------------------------------------------
//CONTRAST
//---------------------------------------------
mat4 contrastMatrix( float _contrast ){
	float t = ( 1.0 - _contrast ) / 2.0;
    return mat4( 
		vec4(_contrast, 0, 0, 0),
		vec4(0, _contrast, 0, 0),
		vec4(0, 0, _contrast, 0),
		vec4(t, t, t, 1));
}
//---------------------------------------------
//BRIGHTNESS
//---------------------------------------------
mat4 brightnessMatrix( float _brightness ){
    return mat4( vec4(1, 0, 0, 0),
                 vec4(0, 1, 0, 0),
                 vec4(0, 0, 1, 0),
                 vec4(_brightness, _brightness, _brightness, 1));
}
//---------------------------------------------
//SATURATION
//---------------------------------------------
mat4 saturationMatrix( float _saturation ){
    vec3 luminance = vec3( 0.3086, 0.6094, 0.0820 );
    float oneMinusSat = 1.0 - _saturation;
	
    vec3 red = vec3( luminance.x * oneMinusSat );
    red+= vec3(_saturation, 0, 0)*redVal;
    vec3 green = vec3( luminance.y * oneMinusSat );
    green += vec3( 0,_saturation, 0 )*greenVal;
    vec3 blue = vec3( luminance.z * oneMinusSat );
    blue += vec3( 0, 0,_saturation )*blueVal;
	
    return mat4(vec4(red, 0),vec4(green,0),vec4(blue,0),vec4(0, 0, 0, 1));
}

void fragment() {
	
 float angle_rad = radians(angle_degrees);

 vec2 direction = vec2(cos(angle_rad), sin(angle_rad));

 vec2 offset_uv = UV - (TIME * scroll_speed * direction);


 float offset = fract(floor(offset_uv.y * repeat_y) * 0.5) > 0.0 ? (row_offset * 0.324) : 0.0;

 offset_uv.x += offset;

 vec2 scaled_uv = vec2(fract(offset_uv.x * repeat_x), 
              fract(offset_uv.y * repeat_y));

 vec2 texelSize = vec2(1.0) / vec2(textureSize(texture_to_scroll, 0));
 vec2 snappedUV = round(scaled_uv / texelSize) * texelSize;

vec4 c = texture(TEXTURE, UV);
vec4 c2 = c * tint_color;

 COLOR = texture(texture_to_scroll, snappedUV) + brightnessMatrix( brightness ) * contrastMatrix( contrast ) *saturationMatrix( saturation ) * mix(c, c2, tint_effect_factor);
}