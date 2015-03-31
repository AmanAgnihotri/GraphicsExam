Shader "Custom/VerticalStripes 02"
{
	SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct vertOut
            {
                float4 pos : SV_POSITION;
                float4 texcoord : TEXCOORD0;
            };

            vertOut vert (appdata_base v)
            {
                vertOut o;
                o.pos = mul (UNITY_MATRIX_MVP, v.vertex);
                o.texcoord = v.texcoord;
                return o;
            }

            fixed4 frag (vertOut i) : SV_Target
            {
                float2 tcoord = (i.texcoord.xy / i.texcoord.w);

                if (fmod (20.0 * tcoord.x, 2.0) < 1.0)
                {
                    return fixed4 (1.0, 0.0, 0.0, 1.0);
                }
                else
                {
                    return fixed4 (0.0, 1.0, 0.0, 1.0);
                }
            }

            ENDCG
        }
    }
}
