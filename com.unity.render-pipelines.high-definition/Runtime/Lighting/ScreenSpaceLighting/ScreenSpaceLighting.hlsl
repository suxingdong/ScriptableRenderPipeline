// Performs fading at the edge of the screen. 
float EdgeOfScreenFade(float2 coordNDC, float fadeRcpLength)
{
    float2 coordCS = coordNDC * 2 - 1;
    float2 t = Remap10(abs(coordCS), fadeRcpLength, fadeRcpLength);
    return Smoothstep01(t.x) * Smoothstep01(t.y);
}

// Function that unpacks and evaluates the clear coat mask
bool HasClearCoatMask(float4 packedMask)
{
    float coatMask;
    uint materialFeatureId;
    UnpackFloatInt8bit(packedMask.a, 8, coatMask, materialFeatureId);
    return coatMask > 0.001;
}