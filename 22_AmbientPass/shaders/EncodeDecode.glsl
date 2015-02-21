#ifndef   ENCODEDECODE_GLSL
#define   ENCODEDECODE_GLSL

float encodeDepth(float depth)
{
  return depth * 2.0 - 1.0;
}

float decodeDepth(float depth)
{
  return depth * 0.5 + 0.5;
}

vec2 encodeNormal(vec3 n)
{
  vec2 encN = normalize(n.xy) * sqrt(-n.z * 0.5 + 0.5);
  return (encN * 0.5 + 0.5);
}

vec3 decodeNormal(vec2 n)
{
  vec4 decN = vec4(n, 0.0, 0.0) * 2.0 + vec4(-1.0, -1.0, 1.0, -1.0);
  float len = dot(decN.xyz, -decN.xyw);
  decN.z = len;
  decN.xy *= sqrt(len);
  return decN.xyz * 2.0 + vec3(0.0, 0.0, -1.0);
}

#endif // ENCODEDECODE_GLSL