//*//===========弥浪隐霄==========//*//
//在这里可以看到很多基于经验主义实现的奇怪效果awa，如果我的奇怪代码能够在你探索基岩版着色器的道路上提供那么一丝帮助，我会感到很开心awa
//感谢所有支持我陪伴我的开发者朋友们！
//云层高度
#define NubisHight_F0 3.0
#define NubisHight_F1 10.0
//白天的天顶与天际线颜色
#define ZenDia vec4(0.0588, 0.2196, 0.3725, 1.0)
#define HorDia vec4(0.6431, 0.7843, 0.8784, 1.0)
//黄昏的天顶与天际线颜色
#define ZenTar vec4(0.1412, 0.1961, 0.4235, 1.0)
#define HorTar vec4(0.8902, 0.4588, 0.4588, 1.0)
//夜晚的天顶与天际线颜色
#define ZenNoc vec4(0.0667, 0.0667, 0.1608, 1.0)
#define HorNoc vec4(0.1922, 0.2275, 0.3843, 1.0)
//白天的天顶与天际线颜色（雨天）
#define ZenDia_R vec4(0.2863, 0.2863, 0.2863, 1.0)
#define HorDia_R vec4(0.4549, 0.4549, 0.4549, 1.0)
//黄昏的天顶与天际线颜色（雨天）
#define ZenTar_R vec4(0.2549, 0.1882, 0.1059, 1.0)
#define HorTar_R vec4(0.3216, 0.2627, 0.1373, 1.0)
//夜晚的天顶与天际线颜色（雨天）
#define ZenNoc_R vec4(0.1843, 0.2235, 0.2588, 1.0)
#define HorNoc_R vec4(0.2588, 0.2863, 0.3451, 1.0)
//末地的天顶与天际线颜色
#define ZenNoc_E vec4(0.1882, 0.1882, 0.3882, 1.0)
#define HorNoc_E vec4(0.4549, 0.2902, 0.6706, 1.0)
//米氏散射光晕颜色
#define MieScaDia vec3(0.4314, 0.302, 0.1765)
#define MieScaTar vec3(0.5725, 0.2549, 0.0275)
#define MieScaLlo vec3(0.3, 0.3, 0.3)
#define MieScaNoc vec3(0.102, 0.1843, 0.2588)
//米氏散射光晕颜色（雨天）
#define MieScaDia_R vec3(0.9216, 0.8392, 0.702)
#define MieScaTar_R vec3(1.0, 0.8667, 0.502)
#define MieScaNoc_R vec3(0.2941, 0.3686, 0.4471)
//米氏散射光晕颜色（末地）
#define MieScaEnd vec3(0.9804, 0.4275, 0.6235)
//地面散射雾颜色
#define NieDia vec4(0.3176, 0.3765, 0.5373, 1.0)
#define NieTar vec4(0.3137, 0.2784, 0.5176, 1.0)
#define NieNoc vec4(0.1255, 0.1569, 0.2863, 1.0)
#define NieDia_R vec4(0.3647, 0.3647, 0.3647, 1.0)
#define NieTar_R vec4(0.451, 0.4078, 0.3255, 1.0)
#define NieNoc_R vec4(0.3451, 0.4549, 0.4824, 1.0)
//太阳颜色
#define Sol0 vec4(1.0, 1.0, 1.0, 1.0)
#define Sol1 vec4(1.0, 0.7804, 0.4706, 1.0)
#define Sol2 vec4(0.2,0.2,0.2,1.0)
#define Sol3 vec4(0.8706, 0.9922, 1.0, 1.0)
//云颜色
#define Nub0 vec4(1.0,0.9,0.8,1.0)
#define Nub1 vec4(1.0,0.75,0.5,1.0)
#define Nub2 vec4(0.5,0.5,0.5,1.0)
#define Nub3 vec4(0.3,0.3,0.3,1.0)
#define CloudDirColor_End vec4(0.5412, 0.3451, 1.0, 1.0)
//主世界与末地的荧光云颜色
#define AuroraColor vec3(0.0353, 0.8118, 0.8392)
#define AuroraColor_End vec3(1.0, 0.5804, 0.9216)
//水面缩放
#define magnitudo 1.0
#define WaterSurfaceColor vec4(0.3961, 0.6, 0.6549, 1.0) //水体Albedo
#define FogColorSusAqua vec3(0.0471, 0.1647, 0.2314) //水下背景色
#define ScaColorSusAqua vec3(0.1098, 0.3137, 0.302) //水下散射光颜色
#define RetainedColor vec3(0.0902, 1.0, 0.7137) //吸收后的颜色
#define RetainedColor_Deep vec3(0.0, 0.1137, 0.4863)
//直接光颜色（白天，黄昏，雨天，夜晚）
#define Dir_Dia vec3(1.0, 0.8196, 0.6941)
#define Dir_Tar vec3(1.0, 0.5765, 0.3804)
#define Dir_Llo vec3(0.6118, 0.6118, 0.6118)
#define Dir_Noc vec3(0.3882, 0.6353, 1.0)
//间接光颜色（白天，黄昏，雨天，夜晚）
#define Ind_Dia vec3(0.5294, 0.6784, 1.0)
#define Ind_Tar vec3(0.5294, 0.6784, 1.0)
#define Ind_Llo vec3(0.6196, 0.7059, 0.7451)
#define Ind_Noc vec3(0.5294, 0.6784, 1.0)
//电解质高光颜色（白天，黄昏，雨天，夜晚）非金属的高光颜色进行了风格化处理
#define Spe_Dia vec3(0.4784, 0.4353, 0.3647)
#define Spe_Tar vec3(0.6314, 0.4784, 0.2941)
#define Spe_Llo vec3(0.2549, 0.2549, 0.2549)
#define Spe_Noc vec3(0.2471, 0.2941, 0.3216)
//光照强度
#define DirIntDia 2.0 //白天直接光
#define DirIntTar 2.0 //黄昏直接光
#define DirIntLlo 1.0 //雨天直接光
#define DirIntNoc 1.0 //夜晚直接光
#define IndIntDia 0.2 //白天间接光
#define IndIntTar 0.2 //黄昏间接光
#define IndIntLlo 0.2 //雨天间接光
#define IndIntNoc 0.2 //夜晚间接光

#define SkyRatio 0.3 //天空环境光
#define SubsurfaceScaStr 2.0 //sss强度
#define PI 3.1415926
#define MERS_Default vec4(0.0, 0.0, 0.9, 0.0)//默认PBR参数值
#define AmbientColor vec3(0.0392, 0.0471, 0.0588)//环境光

#define DFDX(x) dFdx(x)
#define DFDY(x) dFdy(x) //适用于老旧设备
//数学
float pow2(float x) {return x * x;} //直接一个一个乘比使用内置函数更快awa
vec2 pow2(vec2 x) {return x * x;}
vec3 pow2(vec3 x) {return x * x;}
vec4 pow2(vec4 x) {return x * x;}
float pow3(float x) {return x * x * x;}
vec2 pow3(vec2 x) {return x * x * x;}
vec3 pow3(vec3 x) {return x * x * x;}
vec4 pow3(vec4 x) {return x * x * x;}
float pow4(float x) {x = x * x; return x * x;}
vec2 pow4(vec2 x) {x = x * x; return x * x;}
vec3 pow4(vec3 x) {x = x * x; return x * x;}
vec4 pow4(vec4 x) {x = x * x; return x * x;}
float pow5(float x) {float x2 = x * x; return x2 * x2 * x;}
vec2 pow5(vec2 x) {vec2 x2 = x * x; return x2 * x2 * x;}
vec3 pow5(vec3 x) {vec3 x2 = x * x; return x2 * x2 * x;}
vec4 pow5(vec4 x) {x = x * x; x = x * x; return x * x;}
float pow8(float x) { x = x * x; x = x * x; return x * x;}
vec2 pow8(vec2 x) {x = x * x; x = x * x; return x * x;}
vec3 pow8(vec3 x) {x = x * x; x = x * x; return x * x;}
vec4 pow8(vec4 x) {x = x * x; x = x * x; return x * x;}
float StweightHash21(vec2 p) {float r = fract(43757.5453 * sin(dot(p, vec2(12.9898, 78.233)))); return r;}
float linestep(highp float a, highp float b, highp float x){return clamp((x - a) / (b - a), 0.0, 1.0);}
float DetectInterior(float lightlength){ return 1.0 - clamp((lightlength - 0.95) * 25.0, 0.0, 1.0); }
//1.21.100.23 光照修复
vec2 Lightmap_U0(vec2 tc1){
    return clamp(vec2(float(uint(floor(tc1.x * 255.0)) & 15u), float(uint(floor(tc1.x * 255.0)) >> 4u)) * 0.0625, 0.0, 1.0);
}
//1.21.130.03+ 光照修复
vec2 Lightmap_U1(vec2 tc1){
    return clamp(vec2(float(uint(round(tc1.y * 65535.0)) >> 4u), float(uint(round(tc1.y * 65535.0)) & 15u)) * 0.0625, 0.0, 1.0);
}
//用于 1.26.30+ 纹理图集修复
vec2 DeComTexCoord(vec2 texcoord0) {
    
    uvec2 compressed = uvec2(round(texcoord0 * 65535.0));
    vec2 texCoord = vec2(
        float((compressed.x & 32767u) << 1u),
        float((compressed.y & 32767u) << 1u)
    ) * (1.0 / 65536.0);

    texCoord.x += (2.0 / 65536.0) * ((2.0 * float((compressed.x & 32768u) >> 15u)) - 1.0);
    texCoord.y += (2.0 / 65536.0) * ((2.0 * float((compressed.y & 32768u) >> 15u)) - 1.0);

    return texCoord;
}

//对象检测函数
bool AquoEst(in vec4 color){
    #ifdef SEASONS
        return false;
    #else
        #ifdef TRANSPARENT
            return (color.r < color.g && color.r * 1.1 < color.b && color.g < color.b * 1.25 && color.b * color.b > color.r * color.g);
        #else
            return false;
        #endif
    #endif
}

bool PlantEst(in vec4 color){
    return (color.a == 0.00 || color.r != color.g);
}

bool CroseEst(in vec3 color){ //通过法线颜色检测十字形物体（蜘蛛网，花草等）
    return ((color.r>0.99&&color.b>0.99)||(color.r>0.99&&color.b<0.1)||(color.r<0.1&&color.b>0.99)||(color.r<0.1&&color.b<0.1));
}

bool WaveEst(in vec4 color){
    #ifdef ALPHA_TEST
        return (color.g != color.b && color.r < color.g + color.b);
    #else
        return false;
    #endif
}

bool Ender(in vec4 color, in float near){
    return ((color.r < 3.0/255.0 && color.g < 3.0/255.0 && color.b <3.0/255.0) && near > 0.5);
}

bool Hell(in float near){
    return (near<0.11 && near>0.0);
}

//水下检测，如果有需要可以添加更多参数（比如迷雾颜色）
bool DetSusAqua(in float f){ 
    return (f == 0.0);//雾距离为0
}

bool NY(in vec3 normal){return (normal.y<-0.8);}
bool NYB(in vec3 normal){return (normal.y>0.8);}
bool NX(in vec3 normal){return (normal.x<-0.8);}
bool NXB(in vec3 normal){return (normal.x>0.8);}
bool NZ(in vec3 normal){return (normal.z<-0.8);}
bool NZB(in vec3 normal){return (normal.z>0.8);}

//颜色混合
lowp vec3 LightColorMix(float t, float l, float n, float lightmap_x){
    vec3 Equal = mix(mix(mix(Dir_Dia*DirIntDia, Dir_Tar*DirIntTar, t), Dir_Llo*DirIntLlo, l), Dir_Noc*DirIntNoc, n);
    vec3 Point = vec3(1.0, 0.5098, 0.1608) * 16.0;
    return mix(Equal, Point, lightmap_x);
}
lowp vec3 LightColorMix_End(float lightmap_x){
    vec3 Equal = vec3(0.5059, 0.4627, 1.0) * 2.0;
    vec3 Point = vec3(0.6235, 0.502, 1.0) * 8.0;
    return mix(Equal, Point, lightmap_x);
}
lowp vec3 SubsurfLightColorMix(float t, float l, float n){
    vec3 Equal = mix(mix(mix(Dir_Dia*DirIntDia, Dir_Tar*DirIntTar, t), Dir_Llo*DirIntLlo, l), Dir_Noc*DirIntNoc, n);
    return Equal;
}
lowp vec3 IndirectLightColorMix(float t, float l, float n){
    return mix(mix(mix(Ind_Dia*IndIntDia, Ind_Tar*IndIntTar, t), Ind_Llo*IndIntLlo, l), Ind_Noc*IndIntNoc, n);
}
lowp vec3 SpecularColorMix(float t, float l, float n){
    return mix(mix(mix(Spe_Dia, Spe_Tar, t), Spe_Llo, l), Spe_Noc, n);
}
lowp vec3 FuckingSpecularColorMix(float t, float l, float n){
    return mix(mix(mix(vec3(1.0, 1.0, 1.0), vec3(1.0, 0.7725, 0.2863), t), vec3(0.6, 0.6, 0.6), l), vec3(0.8588, 1.0, 0.9882), n);
}
vec2 RandForPerlinNoise(vec2 p){ return -1.0 + 2.0 * fract(sin(vec2(dot(p, vec2(127.1,311.7)),dot(p, vec2(269.5,183.3)))) * 43758.5453); }
//天顶颜色混合
lowp vec4 ZenithColor_Mix(vec4 color, float t, float l, float n){
    lowp vec4 diacolor = mix(ZenDia, ZenDia_R, l);
    lowp vec4 tarcolor = mix(ZenTar, ZenTar_R, l);
    lowp vec4 noccolor = mix(ZenNoc, ZenNoc_R, l);
    return mix(mix(diacolor, tarcolor, t), noccolor, n);
}
//散射雾颜色混合
lowp vec4 NiebulaColor_Mix(vec4 color, float t, float l, float n){
    lowp vec4 diacolor = mix(NieDia, NieDia_R, l);
    lowp vec4 tarcolor = mix(NieTar, NieTar_R, l);
    lowp vec4 noccolor = mix(NieNoc, NieNoc_R, l);
    return mix(mix(diacolor, tarcolor, t), noccolor, n);
}
//天际线颜色混合
lowp vec4 HorizonColor_Mix(vec4 color, float t, float l, float n){
    lowp vec4 diacolor = mix(HorDia, HorDia_R, l);
    lowp vec4 tarcolor = mix(HorTar, HorTar_R, l);
    lowp vec4 noccolor = mix(HorNoc, HorNoc_R, l);
    return mix(mix(diacolor, tarcolor, t), noccolor, n);
}
//云颜色混合
lowp vec4 CloudDirColor_Mix(float t, float n){
    lowp vec4 diacolor = vec4(1.0, 0.9333, 0.8431, 1.0);
    lowp vec4 tarcolor = vec4(1.0, 0.4588, 0.4196, 1.0);
    lowp vec4 noccolor = vec4(0.3216, 0.4157, 0.5608, 1.0);
    return mix(mix(diacolor, tarcolor, t), noccolor, n) * vec4(0.7,0.7,0.7,1.0);
}
//光晕颜色混合（给云层使用）
#define MieScaCloudColor_Mix mix(mix(mix(MieScaDia, MieScaTar, t), vec3(1.0, 1.0, 1.0), n), mix(mix(MieScaDia_R, MieScaTar_R, t), MieScaNoc_R, n), l)
//太阳月亮颜色混合
#define SunMoonColor_Mix mix(mix(mix(Sol0, Sol1, t), Sol2, l), Sol3, n)

//检测苍白花园与默片效果
mediump vec3 Pale_ColorAdjustment(vec3 color, vec3 fog){
    //（首先需要将苍白花园的迷雾改为纯绿色）根据差值制作过渡
    float Delta = clamp((fog.g - fog.b) * (fog.g - fog.r) * max((1.0 - (fog.b + fog.r) * 1.5), 0.0), 0.0, 1.0);
    float Pale = linestep(0.0, 1.0, Delta);
    return mix(color, vec3((color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33), Pale);;

}
//计算雾颜色RGB的方差以及大小关系作为变量影响输入颜色; 应用于天空与散射雾
lowp vec3 Fog_ColorAdjustment(vec3 color, vec3 fog, float t, float l, float n){ //t，l， n分别为黄昏，雨天，夜晚的强度，适用于线性混合

    float Avg = (fog.r + fog.g + fog.b) * 0.33;
    float Variance = clamp((pow2(fog.r - Avg) + pow2(fog.g - Avg) + pow2(fog.b - Avg)) * 3.0, 0.0, 1.0);
    vec3 B = vec3(1.0, 1.0, 1.0);

    fog = mix(mix(mix(pow(fog, vec3(2.2, 2.2, 2.2)), B, t), B, l), B, n);
    Variance = mix(mix(mix(Variance, 0.0, t), 0.0, l), 0.0, n);
    color *= mix(vec3(1.0, 1.0, 1.0), fog * 1.5, Variance * 0.7);
    color = mix(color, vec3((color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33), Variance * 0.5);

    return color;

}
//应用于散射雾距离与浓度，x为距离因数，y为浓度
lowp vec2 Fog_ValueAdjustment(vec3 fog, float t, float l, float n){

    float Avg = (fog.r + fog.g + fog.b) * 0.33;
    float Variance = (pow2(fog.r - Avg) + pow2(fog.g - Avg) + pow2(fog.b - Avg)) * 3.0;
    Variance = mix(mix(mix(Variance, 0.0, t), 0.0, l), 0.0, n);

    float Dist = mix(0.005, 0.01, Variance);
    float Alfa = mix(mix(mix(mix(0.5, 0.9, Variance), 0.7, t), 0.8, l), 0.6, n);

    return vec2(Dist, Alfa);

}
//应用于区块环境光
lowp vec3 Fog_AmbientAdjustment(vec3 color, vec3 fog, float t, float l, float n){

    float Avg = (fog.r + fog.g + fog.b) * 0.33;
    float Variance = clamp((pow2(fog.r - Avg) + pow2(fog.g - Avg) + pow2(fog.b - Avg)) * 3.0, 0.0, 1.0);
    vec3 B = vec3(1.0, 1.0, 1.0);

    fog = mix(mix(mix(pow(fog, vec3(2.2, 2.2, 2.2)), B, t), B, l), B, n);
    Variance = mix(mix(mix(Variance, 0.0, t), 0.0, l), 0.0, n);
    color *= mix(vec3(1.0, 1.0, 1.0), fog * 1.5, Variance * fog.g * fog.r);
    color = mix(color, vec3((color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33, (color.r + color.g + color.b) * 0.33) * 0.5, Variance * fog.g);

    return color;

}

//反向鱼眼坐标变换(近似折射)
lowp vec3 AproxiRefract_TIR(vec3 inpos){

    vec3 Pos = inpos.xyz;
    float DisPosXZ = length(Pos.xz) / Pos.y;
    vec2 FinalPosXZ = mix(Pos.xz, Pos.xz * DisPosXZ, DisPosXZ);

    return vec3(FinalPosXZ.x, -Pos.y, -FinalPosXZ.y);

}

/////////////////////
//基于雾颜色的时间系统，适用于拿不到太阳坐标的国际基岩版
//此方法来自Origin Shader作者linlin，感谢lin姐姐为社区做出的杰出贡献！
float FOGTIME(vec4 fogcol){
    //三次多项式拟合，四次多项式拟合曲线存在明显突出故不使用
	const vec4 k = vec4(349.305545, -159.858192, 30.557216, -1.628452);
	const float x0 = 1.0;
	float x1 = fogcol.g;
	float x2 = x1 * x1;
	float x3 = x2 * x1;
	return fogcol.g > 0.213101 ? 1.0 : dot(vec4(x3, x2, x1, x0), k);
}

float fogtime(vec4 fogcol) {
    //三次多项式拟合，四次多项式拟合曲线存在明显突出故不使用
    // return fogcol.g > 0.213101 ? 1.0 : (((349.305545 * fogcol.g - 159.858192) * fogcol.g + 30.557216) * fogcol.g - 1.628452);
    return clamp(((349.305545 * fogcol.g - 159.858192) * fogcol.g + 30.557216) * fogcol.g - 1.628452, -1.0, 1.0);
}

//根据时间来确定太阳角度，用于全局
highp vec3 SUNDIR(float time){
    time *= (3.1415926 / 2.0) * 0.55;
    return normalize((time > 0.0 ? 1.0 : -1.0) * vec3(cos(time), sin(time), cos(time) * 0.65));
    
}
/////////////////////

//色调映射
vec3 ACESToneMapping(vec3 color, float adapted_lum){
    const float A = 2.51;
	const float B = 0.03;
	const float C = 2.43;
	const float D = 0.59;
	const float E = 0.14;
	color *= adapted_lum;
	return (color * (A * color + B)) / (color * (C * color + D) + E);
}
//为暗部添加灰度
vec3 MorandiTonemap(vec3 color) {

    float B = (color.r + color.g + color.b) * 0.333;
    float C = 0.3;
    float D = B - C;
    
    color = D > 0.0 ? color : clamp(color * 1.0 - 0.02, 0.0, 1.0);
    color = D > 0.0 ? color : mix(vec3(0.4,0.5,0.8), color, 0.9);

    return color;
    
}

float ViaALlover(vec3 fograndfarnear) {
    vec2 function = clamp((fograndfarnear.xy - vec2(0.5 + 20.0 / fograndfarnear.z, 1.0)) / (vec2(0.23, 0.70) - vec2(0.5 + 20.0 / fograndfarnear.z, 1.0)), vec2(0.0, 0.0),vec2(1.0, 1.0));
    return pow2((function.x * function.y)) * (3.0 - 2.0 * (function.x * function.y));
}

//星星
vec3 DisegnaStar(vec3 pos, float time){

    pos.z += 0.005 * time;
    vec3 Stars = vec3(1.0, 1.0, 1.0);
    vec2 Coord = floor(abs(pos.xz) * 100.0) * 0.01;//投影到平面（xz）并取整
    float StarsMap = StweightHash21(Coord);//强度

    StarsMap *= StweightHash21(Coord + vec2(0.8, 0.8));
    StarsMap *= StweightHash21(Coord + vec2(0.8, 0.8));

    Stars *= saturate(StarsMap - 0.9);//阈值
    Stars *= 20.0;
    Stars *= mix(0.0, 1.0, linestep(0.0, 1.0, pos.y));

    return Stars;

}

float Hash3D(vec3 pos){

    pos = fract(pos * 0.3183099 + 0.1);
    pos *= 17.0;

    return fract(pos.x * pos.y * pos.z * (pos.x + pos.y + pos.z));

}

float ValueNoise3D(vec3 pos){

    vec3 Int = floor(pos);
    vec3 Fre = fract(pos);

    float hashA = Hash3D(Int);
    float hashB = Hash3D(Int + vec3(1.0, 0.0, 0.0));
    float hashC = Hash3D(Int + vec3(0.0, 1.0, 0.0));
    float hashD = Hash3D(Int + vec3(1.0, 1.0, 0.0));
    float hashE = Hash3D(Int + vec3(0.0, 0.0, 1.0));
    float hashF = Hash3D(Int + vec3(1.0, 0.0, 1.0));
    float hashG = Hash3D(Int + vec3(0.0, 1.0, 1.0));
    float hashH = Hash3D(Int + vec3(1.0, 1.0, 1.0));
    
    vec3 SmoothFac = Fre * Fre * (3.0 - 2.0 * Fre);

    float PolX1 = mix(hashA, hashB, SmoothFac.x);
    float PolX2 = mix(hashC, hashD, SmoothFac.x);
    float PolY1 = mix(PolX1, PolX2, SmoothFac.y);
    float PolX3 = mix(hashE, hashF, SmoothFac.x);
    float PolX4 = mix(hashG, hashH, SmoothFac.x);
    float PolY2 = mix(PolX3, PolX4, SmoothFac.y);
    
    return clamp(mix(PolY1, PolY2, SmoothFac.z), 0.2, 0.5);

}

float GetPerlinNoise(vec2 p){

    p = mod(p, 16.0); 
    vec2 i = floor(p); 
    vec2 f = fract(p);

    float a = dot(RandForPerlinNoise(i), f);
    float b = dot(RandForPerlinNoise(i + vec2(1.0, 0.0)), f - vec2(1.0, 0.0));
    float c = dot(RandForPerlinNoise(i + vec2(0.0, 1.0)), f - vec2(0.0, 1.0));
    float d = dot(RandForPerlinNoise(i + vec2(1.0, 1.0)), f - vec2(1.0, 1.0));
    vec2 u = smoothstep(0.5, 1.0, f);

    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);

}
//用于渲染方块云的2D随机数
highp float GetHash_2D_SP(highp vec2 pos){
    return fract(cos(pos.x + pos.y * 678.0) * 114.514);
}
highp float GetHash_2D(highp vec2 pos){
    return fract(sin(pos.x + pos.y * 678.0) * 114.514);
}
//快速判断
float FastyJudgy_F0(vec2 pos){
    return step(0.8, GetHash_2D(floor(pos)));
}
vec2 FastyJudgy_F1(vec2 pos, float time){

    float NubisJudge = mix(step(0.6, GetHash_2D_SP(floor(pos))), 0.0, FastyJudgy_F0(pos));
    float AuroraNubisJudge = mix(step(0.8, GetHash_2D_SP(floor(pos))), 0.0, FastyJudgy_F0(pos));
    AuroraNubisJudge *= sin(floor(pos.x) + time * 0.5);

    return vec2(NubisJudge, AuroraNubisJudge);

}
//用作Mask的云图
mediump float Clouds_CubeStyle_SP(vec2 pos, float time){
    pos *= 10.0; 
    float Alpha = 0.0;
    return mix(Alpha, 0.5, FastyJudgy_F1(pos + time * 0.1, time).x);
}
mediump float Clouds_CubeStyle(vec2 pos, float time){
    pos *= 3.0; 
    float Alpha = 0.0; 
    return mix(Alpha, 1.0, FastyJudgy_F0(pos + time * 0.05));
}

float MieInty(float a){
    a = clamp(a + 0.1, 0.0, 1.0);
    return exp2(log2(a) * 0.9);
}
/*视差方块云*/
mediump vec4 Clouds_CubeStyle_Parallax(vec2 pos, vec3 skypos, vec3 sunpos, vec4 skycolor, vec4 fogclient, float near, float t, float l, float n, float time){

    bool End = Ender(fogclient, near);//检测末地
    float Value0 = skypos.y > 0.0 ? 1.0 : 0.0;
    float DetN = mix(0.0, 1.0, n);//这个作为因子，控制荧光仅在夜晚与末地闪烁
    
    float CaeloStep_PorNubis_f0 = linestep(0.0, 1.0, pow2(skypos.y));//这个用于远处云彩的渐变过渡（下层）
    float CaeloStep_PorNubis_f1 = linestep(0.0, 1.0, pow4(skypos.y));//这个用于远处云彩的渐变过渡（上层）

    vec3 diapos = vec3(skypos.x, skypos.y, skypos.z);
    vec3 nocpos = vec3(skypos.x, skypos.y, -skypos.z);
    //模拟散射的光晕（后来想想感觉没必要这样，直接VdotH就够用）
    const float Size = 4.0; 
    const float Stre = 7.0;
    float SunAngle = -sunpos.y;
    float MoonAngle = sunpos.y;
    float MieDia = MieInty(SunAngle) * exp(-distance(-diapos, sunpos) * 3.0) * exp(-saturate(diapos.y) * Size) * Stre;
    float MieNoc = MieInty(MoonAngle) * exp(-distance(nocpos, sunpos) * 3.0) * exp(-saturate(nocpos.y) * Size) * Stre;
    //云层坐标缩放（透视深度）
    vec2 Pos_f0 = pos * NubisHight_F0;
    vec2 Pos_f1 = pos * NubisHight_F1;
    //初始化
    vec3 NubisLightStr_f0 = vec3(0.0, 0.0, 0.0);
    vec3 NubisLightStr_f1 = vec3(0.0, 0.0, 0.0);

    //云颜色
    vec4 NubisColor = CloudDirColor_Mix(t, n);
    NubisColor.rgb *= vec3(1.3, 1.3, 1.3);
    vec3 AuroraFlight = AuroraColor;
    if(End){
        NubisColor = CloudDirColor_End;
        AuroraFlight = AuroraColor_End;
        DetN = 1.0;//末地设定为夜晚，荧光云会在末地闪烁
    }

    //叠叠乐累积 awa
    for (int i = 0; i < 10; i ++){

        Pos_f0 *= 0.99;//透视
        Pos_f1 *= 0.994;
        float JuzgaNubis_f0 = FastyJudgy_F0(Pos_f0 + time * 0.05);//云判定（下层）
        float JuzgaNubis_f1 = FastyJudgy_F1(Pos_f1 + time * 0.1, time).x;//云判定（上层）
        float JuzgaAuror_fx = FastyJudgy_F1(Pos_f1 + time * 0.1, time).y;//云判定（上层荧光部分）

        NubisLightStr_f0 = mix(NubisLightStr_f0, vec3(1.0, 1.0, 1.0), JuzgaNubis_f0);//下层云密度混合
        NubisLightStr_f1 = mix(mix(NubisLightStr_f1, vec3(0.7, 0.7, 0.7), JuzgaNubis_f1), vec3(0.0, 0.0, 0.0), NubisLightStr_f0);//上层云密度混合（被下层云遮挡）
        NubisLightStr_f0 *= 1.1;//密度衰减
        NubisLightStr_f1 *= 1.1;

        NubisColor.rgb = mix(NubisColor.rgb, AuroraFlight, max(JuzgaAuror_fx * (1.0 - NubisLightStr_f0.x), 0.0) * CaeloStep_PorNubis_f1 * DetN);//混合荧光效果

    }
    //最终与天空背景混合
    NubisColor.rgb += MieScaCloudColor_Mix * (MieDia + MieNoc);//添加散射光晕
    skycolor = mix(skycolor, NubisColor, min((vec4(NubisLightStr_f0, 1.0) * CaeloStep_PorNubis_f0) + (vec4(NubisLightStr_f1, 1.0) * CaeloStep_PorNubis_f1), vec4(1.0, 1.0, 1.0, 1.0)) * Value0 * (1.0 - l));

    return skycolor;

}
//用于环境反射的云（低循环次数）
mediump vec4 CloudsRef_CubeStyle_Parallax(vec2 pos, vec3 skypos, vec3 sunpos, vec4 skycolor, vec4 fogclient, float near, float t, float l, float n, float time){

    bool End = Ender(fogclient, near);
    float Value0 = skypos.y > 0.0 ? 1.0 : 0.0;
    float DetN = mix(0.0, 1.0, n);
    float CaeloStep_PorNubis_f0 = linestep(0.0, 1.0, pow2(skypos.y));
    float CaeloStep_PorNubis_f1 = linestep(0.0, 1.0, pow4(skypos.y));
    vec3 diapos = vec3(skypos.x, skypos.y, skypos.z);
    vec3 nocpos = vec3(skypos.x, skypos.y, -skypos.z);
  
    const float Size = 4.0; 
    const float Stre = 7.0;
    float SunAngle = -sunpos.y;
    float MoonAngle = sunpos.y;
    float MieDia = MieInty(SunAngle) * exp(-distance(-diapos, sunpos) * 3.0) * exp(-saturate(diapos.y) * Size) * Stre;
    float MieNoc = MieInty(MoonAngle) * exp(-distance(nocpos, sunpos) * 3.0) * exp(-saturate(nocpos.y) * Size) * Stre;
    
    vec2 Pos_f0 = pos * NubisHight_F0;
    vec2 Pos_f1 = pos * NubisHight_F1;

    vec3 NubisLightStr_f0 = vec3(0.0, 0.0, 0.0);
    vec3 NubisLightStr_f1 = vec3(0.0, 0.0, 0.0);

    vec4 NubisColor = CloudDirColor_Mix(t, n);
    NubisColor.rgb *= 1.3;
    vec3 AuroraFlight = AuroraColor;

    if(End){
        NubisColor = CloudDirColor_End;
        AuroraFlight = AuroraColor_End;
        DetN = 1.0;
    }
    
    for (int i = 0; i < 5; i ++){

        Pos_f0 *= 0.976;
        Pos_f1 *= 0.988;
        float JuzgaNubis_f0 = FastyJudgy_F0(Pos_f0 + time * 0.05);
        float JuzgaNubis_f1 = FastyJudgy_F1(Pos_f1 + time * 0.1, time).x;
        float JuzgaAuror_fx = FastyJudgy_F1(Pos_f1 + time * 0.1, time).y;

        NubisLightStr_f0 = mix(NubisLightStr_f0, vec3(1.0, 1.0, 1.0), JuzgaNubis_f0);
        NubisLightStr_f1 = mix(mix(NubisLightStr_f1, vec3(0.7, 0.7, 0.7), JuzgaNubis_f1), vec3(0.0, 0.0, 0.0), NubisLightStr_f0);
        NubisLightStr_f0 *= 1.2;
        NubisLightStr_f1 *= 1.2;
        NubisColor.rgb = mix(NubisColor.rgb, AuroraFlight, max(JuzgaAuror_fx * (1.0 - NubisLightStr_f0.x), 0.0) * CaeloStep_PorNubis_f1 * DetN);
    }
    
    NubisColor.rgb += MieScaCloudColor_Mix * (MieDia + MieNoc);
    skycolor = mix(skycolor, NubisColor, min((vec4(NubisLightStr_f0, 1.0) * CaeloStep_PorNubis_f0) + (vec4(NubisLightStr_f1, 1.0) * CaeloStep_PorNubis_f1), vec4(1.0, 1.0, 1.0, 1.0)) * Value0 * (1.0 - l));

    return skycolor;

}

//给水下TIR视窗使用的云（同一个云渲染3次真的好蠢，但基岩版前向渲染只能这么做；当然也可以尝试把它们合并封装在同一个函数里，只是很容易出现性能问题）
mediump vec4 CloudsSua_CubeStyle_Parallax(vec2 pos, vec3 skypos, vec3 sunpos, vec4 skycolor, float time){

    float Value0 = skypos.y > 0.0 ? 1.0 : 0.0;
    pos.x = -pos.x;

    float CaeloStep_PorNubis_f0 = linestep(0.0, 1.0, pow2(skypos.y));
    float CaeloStep_PorNubis_f1 = linestep(0.0, 1.0, pow4(skypos.y));

    vec2 Pos_f0 = pos * NubisHight_F0;
    vec2 Pos_f1 = pos * NubisHight_F1;

    vec3 NubisLightStr_f0 = vec3(0.0, 0.0, 0.0);
    vec3 NubisLightStr_f1 = vec3(0.0, 0.0, 0.0);

    vec4 NubisColor = vec4(1.0, 1.0, 1.0, 1.0);

    for (int i = 0; i < 5; i ++) {
        Pos_f0 *= 0.976;
        Pos_f1 *= 0.988;
        float JuzgaNubis_f0 = FastyJudgy_F0(Pos_f0 + time * 0.05);
        float JuzgaNubis_f1 = FastyJudgy_F1(Pos_f1 + time * 0.1, time).x;
        float JuzgaAuror_fx = FastyJudgy_F1(Pos_f1 + time * 0.1, time).y;

        NubisLightStr_f0 = mix(NubisLightStr_f0, vec3(1.0, 1.0, 1.0), JuzgaNubis_f0);
        NubisLightStr_f1 = mix(mix(NubisLightStr_f1, vec3(0.7, 0.7, 0.7), JuzgaNubis_f1), vec3(0.0, 0.0, 0.0), NubisLightStr_f0);
        NubisLightStr_f0 *= 1.2;
        NubisLightStr_f1 *= 1.2;
    }

    skycolor = mix(skycolor, NubisColor, min((vec4(NubisLightStr_f0, 1.0) * CaeloStep_PorNubis_f0) + (vec4(NubisLightStr_f1, 1.0) * CaeloStep_PorNubis_f1), vec4(0.5, 0.5, 0.5, 1.0)) * Value0);
    return skycolor;
}


/*== 弥浪隐霄 天空 ==*/
mediump vec4 Firmament_SognoSolare_V2(vec3 pos, vec3 sunpos, vec4 fogclient, float fognear, float t, float l, float n, float time){

    bool End = Ender(fogclient, fognear);//检测末地

    vec3 skypos = normalize(pos);
    vec3 diapos = vec3(skypos.x, skypos.y, skypos.z);
    vec3 nocpos = vec3(skypos.x, skypos.y, -skypos.z);
    vec3 solvec = cross(diapos * 10.0, sunpos);
    vec3 lunavec = cross(nocpos * 10.0, sunpos);
    float value1 = pos.y > 0.0 ? 1.0 : 0.0;
    vec3 miedir = sunpos.x < 0.0 ? vec3(sunpos.x, sunpos.y, -sunpos.z) : -sunpos;
    vec3 MieColor = mix(mix(mix(MieScaDia, MieScaTar, t), MieScaLlo, l), MieScaNoc, n);
    vec3 HalfVec = normalize(skypos + miedir);
    float VdotH = saturate(pow8(pow2((dot(skypos, HalfVec)))));

    vec4 CanvasColor;//初始化
    vec2 PosNubis = skypos.xz / skypos.y;//云坐标投影
    //过渡
    float CaeloStep_SP = linestep(1.0, 0.0, skypos.y);
    float CaeloStep_ISP = linestep(1.0, 0.0, -skypos.y);
    //客户端迷雾rgb的平均值与方差
    float Avg = (fogclient.r + fogclient.g + fogclient.b) * 0.33;
    float Variance = clamp((pow2(fogclient.r - Avg) + pow2(fogclient.g - Avg) + pow2(fogclient.b - Avg)) * 3.0, 0.0, 1.0);
    
    float Sol = min(mix(inversesqrt(pow2(solvec.x) + pow2(solvec.y) + pow2(solvec.z)), 0.0, n), 5.0);
    float Luna = min(inversesqrt(pow2(lunavec.x) + pow2(lunavec.y) + pow2(lunavec.z)), 5.0);
    //2D方块云图（用于遮罩）
    float AlfaNubis_CubeStyle_SP = Clouds_CubeStyle_SP(PosNubis, time);
    float AlfaNubis_CubeStyle = Clouds_CubeStyle(PosNubis, time);
    float NubisMask = max((1.0 - (AlfaNubis_CubeStyle + AlfaNubis_CubeStyle_SP)), 0.0);//用于遮罩星空
    vec3 StarMap = mix(mix(vec3(0.0, 0.0, 0.0), DisegnaStar(skypos, time) * 2.0, n),vec3(0.0, 0.0, 0.0), l) * NubisMask;
    
    vec4 CupulaColor = ZenithColor_Mix(CanvasColor, t, l, n);//穹顶色
    vec4 HoriciColor = vec4(HorizonColor_Mix(CanvasColor, t, l, n).rgb - Variance * 0.5 * fogclient.g, 1.0);//天际线色
    vec4 TerraeColor = vec4(0.1, 0.12, 0.16, 1.0);

    //====末地====//
    if(End){
        CupulaColor = ZenNoc_E;
        HoriciColor = HorNoc_E;
        MieColor = MieScaEnd;
    }

    CanvasColor = mix(CupulaColor, HoriciColor, pow3(CaeloStep_SP));
    CanvasColor = mix(CanvasColor, mix(SunMoonColor_Mix, CanvasColor, n), Sol * mix(1.0, 0.0, pow3(CaeloStep_SP)) * (1.0 - l));
    CanvasColor = mix(CanvasColor, mix(CanvasColor, SunMoonColor_Mix, n), Luna * mix(1.0, 0.0, pow3(CaeloStep_SP)) * (1.0 - l));
    CanvasColor.rgb += StarMap;
    CanvasColor = Clouds_CubeStyle_Parallax(PosNubis, skypos, sunpos, CanvasColor, fogclient, fognear, t, l, n, time);//混合云层
    CanvasColor = mix(TerraeColor, CanvasColor, CaeloStep_ISP);//混合地平线以下的颜色
    CanvasColor.rgb = Fog_ColorAdjustment(CanvasColor.rgb, fogclient.rgb, t, l, n);//受雾颜色影响
    CanvasColor.rgb += MieColor * VdotH;//光晕

    return CanvasColor;

}

/*== 末地天空 ==*/
mediump vec4 Firmament_End_SognoSolare_V2(vec3 pos, vec3 sunpos, vec4 fogclient, float fognear, float time){
    
    vec3 skypos = normalize(pos);
    vec3 diapos = vec3(skypos.x, skypos.y, skypos.z);
    vec3 solvec = cross(diapos * 10.0, sunpos);
    float value1 = pos.y > 0.0 ? 1.0 : 0.0;
    vec3 miedir = sunpos;
    vec3 HalfVec = normalize(skypos + miedir);
    float VdotH = saturate(pow8(pow2((dot(skypos, HalfVec)))));
    vec4 CanvasColor;//初始化
    vec2 PosNubis = skypos.xz / skypos.y;//云坐标投影
    //过渡
    float CaeloStep_SP = linestep(1.0, 0.0, skypos.y);
    float CaeloStep_ISP = linestep(1.0, 0.0, -skypos.y);
    //太阳
    float Sol = inversesqrt(pow2(solvec.x) + pow2(solvec.y) + pow2(solvec.z));
    //2D方块云图（用于遮罩）
    float AlfaNubis_CubeStyle_SP = Clouds_CubeStyle_SP(PosNubis, time);
    float AlfaNubis_CubeStyle = Clouds_CubeStyle(PosNubis, time);
    float NubisMask = max((1.0 - (AlfaNubis_CubeStyle + AlfaNubis_CubeStyle_SP)), 0.0);//用于遮罩星空
    vec3 StarMap = DisegnaStar(skypos, time) * 2.0 * NubisMask;
    //颜色部分
    vec4 CupulaColor = ZenNoc_E;
    vec4 HoriciColor = HorNoc_E;
    vec3 MieColor = MieScaEnd;
    vec4 TerraeColor = vec4(0.1, 0.12, 0.16, 1.0);

    CanvasColor = mix(CupulaColor, HoriciColor, pow3(CaeloStep_SP));
    CanvasColor = mix(CanvasColor, vec4(1.0, 1.0, 1.0, 1.0), Sol * mix(1.0, 0.0, pow3(CaeloStep_SP)));
    CanvasColor.rgb += StarMap;
    CanvasColor = Clouds_CubeStyle_Parallax(PosNubis, skypos, sunpos, CanvasColor, fogclient, fognear, 0.0, 0.0, 0.0, time);
    CanvasColor = mix(TerraeColor, CanvasColor, CaeloStep_ISP);
    CanvasColor.rgb += MieColor * VdotH;

    return CanvasColor;

}

/*== 顶点雾 ==*/
mediump vec4 Fog_SognoSolare_V2(vec3 pos, vec3 sunpos, vec4 fogclient, float fognear, float t, float l, float n){
    
    bool End = Ender(fogclient, fognear);
    vec3 skypos = normalize(pos);
    float value1 = pos.y > 0.0 ? 1.0 : 0.0;
    vec3 miedir = mix(-sunpos, vec3(sunpos.x, sunpos.y, -sunpos.z), n);
    vec3 MieColor = mix(mix(mix(MieScaDia, MieScaTar, t), MieScaLlo, l), MieScaNoc, n);
    vec3 HalfVec = normalize(skypos + miedir);
    float VdotH = saturate(pow8(pow2((dot(skypos, HalfVec)))));
    vec4 CanvasColor;
    
    float CaeloStep_SP = linestep(1.0, 0.0, skypos.y);
    float CaeloStep_ISP = linestep(1.0, 0.0, -skypos.y);
    float Avg = (fogclient.r + fogclient.g + fogclient.b) * 0.33;
    float Variance = clamp((pow2(fogclient.r - Avg) + pow2(fogclient.g - Avg) + pow2(fogclient.b - Avg)) * 3.0, 0.0, 1.0);

    vec4 CupulaColor = ZenithColor_Mix(CanvasColor, t, l, n);
    vec4 HoriciColor = vec4(HorizonColor_Mix(CanvasColor, t, l, n).rgb - Variance * 0.5 * fogclient.g, 1.0);
    vec4 TerraeColor = vec4(0.1, 0.12, 0.16, 1.0);

    if(End){
        CupulaColor = ZenNoc_E;
        HoriciColor = HorNoc_E;
        MieColor = MieScaEnd;
    }

    CanvasColor = mix(CupulaColor, HoriciColor, pow3(CaeloStep_SP));
    CanvasColor = mix(TerraeColor, CanvasColor, CaeloStep_ISP);
    CanvasColor.rgb = Fog_ColorAdjustment(CanvasColor.rgb, fogclient.rgb, t, l, n);
    CanvasColor.rgb += MieColor * VdotH;
    CanvasColor.rgb = pow(CanvasColor.rgb, vec3(2.2, 2.2, 2.2));

    return CanvasColor;

}

//环境天空（用于反射）
mediump vec4 AmbientSkyColor(vec3 pos, vec3 sunpos, vec4 fogclient, float fognear, float t, float l, float n, float time, vec2 lightmap){
    //坐标相关
    bool End = Ender(fogclient, fognear);
    vec3 skypos = normalize(pos);
    vec4 CanvasColor;//初始化
    vec2 PosNubis = skypos.xz / skypos.y;
    vec3 miedir = sunpos.x < 0.0 ? vec3(sunpos.x, sunpos.y, -sunpos.z) : -sunpos;
    vec3 MieColor = mix(mix(mix(MieScaDia, MieScaTar, t), MieScaLlo, l), MieScaNoc, n);
    vec3 HalfVec = normalize(skypos + miedir);
    float VdotH = saturate(pow8(pow2((dot(skypos, HalfVec)))));

    float CaeloStep_SP = linestep(1.0, 0.0, skypos.y);
    float CaeloStep_ISP = linestep(1.0, 0.0, -skypos.y);
    float InteriorStep = clamp(1.0 - pow8(pow4(lightmap.y)) * 50.0, 0.0, 1.0);//室内强度
    float Avg = (fogclient.r + fogclient.g + fogclient.b) * 0.33;
    float Variance = clamp((pow2(fogclient.r - Avg) + pow2(fogclient.g - Avg) + pow2(fogclient.b - Avg)) * 3.0, 0.0, 1.0);
    
    float AlfaNubis_CubeStyle_SP = Clouds_CubeStyle_SP(PosNubis, time);
    float AlfaNubis_CubeStyle = Clouds_CubeStyle(PosNubis, time);
    float NubisMask = max((1.0 - (AlfaNubis_CubeStyle + AlfaNubis_CubeStyle_SP)), 0.0);
    vec3 StarMap = mix(mix(vec3(0.0, 0.0, 0.0), DisegnaStar(skypos, time) * 2.0, n),vec3(0.0, 0.0, 0.0), l) * NubisMask;

    vec4 CupulaColor = ZenithColor_Mix(CanvasColor, t, l, n);
    vec4 HoriciColor = vec4(HorizonColor_Mix(CanvasColor, t, l, n).rgb - Variance * 0.5 * fogclient.g, 1.0);
    vec4 TerraeColor = vec4(0.1, 0.12, 0.16, 1.0);//地球色
    vec3 FakeAmbient = mix(vec3(0.8, 0.8, 0.8), vec3(4.0, 2.5, 1.0), pow8(lightmap.x)) * ValueNoise3D(pos * 4.0);//室内反射图（noise）

    //====末地====//
    if(End){
        CupulaColor = ZenNoc_E;
        HoriciColor = HorNoc_E;
        InteriorStep = 0.0;//末地设置为无室内
        MieColor = MieScaEnd;
    }

    CanvasColor = mix(CupulaColor, HoriciColor, pow3(CaeloStep_SP));
    CanvasColor.rgb += StarMap;
    CanvasColor = CloudsRef_CubeStyle_Parallax(PosNubis, skypos, sunpos, CanvasColor, fogclient, fognear, t, l, n, time);//混合云层
    CanvasColor = mix(vec4(FakeAmbient * 1.4, 1.0), CanvasColor, CaeloStep_ISP);//混合地平线以下的颜色，地平线以下使用noise反射图
    CanvasColor.rgb = Fog_ColorAdjustment(CanvasColor.rgb, fogclient.rgb, t, l, n);//受雾颜色影响
    CanvasColor.rgb += MieColor * VdotH;
    CanvasColor.rgb = mix(CanvasColor.rgb, FakeAmbient, InteriorStep);
    
    CanvasColor.rgb = pow(CanvasColor.rgb, vec3(2.2, 2.2, 2.2));
    
    return CanvasColor;

}

//水下TIR视窗天空
mediump vec4 ArrviaSkyColor(vec3 pos, vec3 sunpos, float time){

    vec3 skypos = normalize(pos);
    vec3 solvec = cross(vec3(pos.x, pos.y, -pos.z) * 15.0, sunpos);
    vec4 CanvasColor;
    vec2 PosNubis = skypos.xz / skypos.y;
    float TIR_Mask = min(pow8(length(skypos.xz * 0.5/skypos.y)), 1.0);//遮罩
    float Sol = min(inversesqrt(pow2(solvec.x) + pow2(solvec.y) + pow2(solvec.z)), 5.0);
    vec4 CupulaColor = vec4(0.0863, 0.2549, 0.4118, 1.0);//穹顶色

    CanvasColor = CupulaColor;
    CanvasColor = CloudsSua_CubeStyle_Parallax(PosNubis, skypos, sunpos, CanvasColor, time);
    CanvasColor.rgb = mix(CanvasColor.rgb, FogColorSusAqua, TIR_Mask);
    CanvasColor = mix(CanvasColor, vec4(0.7373, 1.0, 0.9882, 1.0), Sol);
    CanvasColor.rgb = pow(CanvasColor.rgb, vec3(2.2, 2.2, 2.2));
    
    return CanvasColor;

}


/*====================================================================
弥浪隐霄 渲染龙版私有PBR协议（临时，仅适用于5.0版本）
--------------------------
通过读取纹理的alpha通道值获取PBR参数：
99%时为金属，81%时为自发光，85%-98%对应粗糙度[1.0-0.1]；
仅支持Opaque类型；暂不支持自定义金属的粗糙度与次表面散射qwq...
====================================================================*/

//获取PBR参数，返回一个vec4：r金属度，g自发光，b粗糙度以及a次表面散射（不正确的硬编码sss）
highp vec4 ObtenerMERS_MLYX(in float a, vec3 vcolor, vec3 normal, vec3 light, float skylight){

    float TexPeculiaresSunt = a < 1.0 ? 1.0 : 0.0;//检测alpha小于1时返回MER
    float NdotL = max(dot(normal, light), 0.0);
    float InteriorStep = clamp((skylight - 0.86) * 15.0, 1.0, 0.0);
    bool Arriba = NY(normal);
    bool Inferior = NYB(normal);
    bool NormalZ = NZ(normal);
    bool NormalZ_Back = NZB(normal);
    
    float QuatS = 1.0 - clamp((vcolor.r - 0.45 * (1.0 - vcolor.b * 1.5)) * 20.0, 0.0, 1.0);
    float S_SupEtArr = (NdotL == 0.0 && Arriba || Inferior) ? mix(1.0, 0.0, QuatS) : 0.0;
    float S_NormalZ = (NormalZ || NormalZ_Back) ? 1.0 : 0.0;

    float M = floor(a * 255.0 + 0.0001) == 252.0 ? 1.0 : 0.0;
    float E = floor(a * 255.0 + 0.0001) == 207.0 ? 1.0 : 0.0;
    float R = max(mix(1.0, 0.0, clamp((a - 0.85) / (0.98 - 0.85), 0.0, 1.0)),0.1);
    float S = mix(S_SupEtArr + S_NormalZ, 0.0, InteriorStep);

    #ifdef TRANSPARENT
        return vec4(0.0, 0.0, 0.1, NdotL == 0.0 ? 1.0 : 0.0);
    #else
        #if defined(ALPHA_TEST)
            return vec4(0.0, 0.0, 0.9, S);
        #endif
        return mix(MERS_Default, vec4(M, E, R, 0.0), TexPeculiaresSunt);
    #endif
}

//灰度转换
highp float TextureDepth(in sampler2D mattexture, vec2 uv){
    vec3 color = texture2D(mattexture, uv).rgb;
    return color.r * 0.2126 + color.g * 0.7152 + color.b * 0.0722;
}
//纹理法线
highp vec3 CalTexNormal_Pro(in sampler2D mattexture, vec2 uv, float depth){
    
    const vec2 OffsetLar = vec2(0.00001, 0.00001);
    const vec2 OffsetSma = vec2(0.0, 0.0);//用于细节

    vec2 SizeUniPix = vec2(1.0, 1.0) / vec2(16.0, 16.0);
    vec2 SmallOffset = OffsetLar * SizeUniPix;
    vec2 LargeOffset = OffsetSma * SizeUniPix;
    //采样深度（右&上&中心点）
    float DepthRightLar = TextureDepth(mattexture, uv + vec2(SmallOffset.x, 0.0));
    float DepthRightSma = TextureDepth(mattexture, uv + vec2(LargeOffset.x, 0.0));
    float DepthUpLar = TextureDepth(mattexture, uv + vec2(0.0, SmallOffset.y));
    float DepthUpSma = TextureDepth(mattexture, uv + vec2(0.0, LargeOffset.y));
    float DepthCenter = TextureDepth(mattexture, uv);
    //梯度
    float GradX_Small = (DepthRightLar - DepthCenter) * 0.5;
    float GradZ_Small = (DepthUpLar    - DepthCenter) * 0.5;
    float GradX_Large = (DepthRightSma - DepthCenter) * 0.5;
    float GradZ_Large = (DepthUpSma    - DepthCenter) * 0.5;

    float X = GradX_Small + GradX_Large;
    float Z = GradZ_Small + GradZ_Large;
    float Y = 1.0 / depth;

    return normalize(vec3(X, Y, Z));
}
//纹理法线
highp vec3 CalTexNormal(in sampler2D mattexture, in vec2 uv) {
    
    const highp vec2 OffsetInt = vec2(0.00005, 0.00005);
    const float Subicae = 0.3;
    
    float L = TextureDepth(mattexture, uv + vec2(-OffsetInt.x, 0.0));
    float R = TextureDepth(mattexture, uv + vec2(OffsetInt.x, 0.0));
    float Sup = TextureDepth(mattexture, uv + vec2(0.0, -OffsetInt.y));
    float Arr = TextureDepth(mattexture, uv + vec2(0.0, OffsetInt.y));
    //梯度
    float GradX = R - L;
    float GradY = Arr - Sup;
    
    return normalize(vec3(-GradX, -GradY, Subicae));

}

//=======重构TBN（解决1.26以上安卓端纹理uv旋转问题）=======//
/*
    //获取六个面
    bool X = NX(Normal);
    bool Y = NY(Normal);
    bool Z = NZ(Normal);
    bool XB = NXB(Normal);
    bool YB = NYB(Normal);
    bool ZB = NZB(Normal);

    TexNormal = CalTexNormal(s_MatTexture, v_texcoord0);
    //无分支写法
    float normalR0 = TexNormal.x, normalG0 = TexNormal.y, normalB0 = TexNormal.z;
    float DetX = float(X || XB);
    float DetY = float(Y || YB);

    float normalR1_true = normalB0;                              
    float RedNeedBlue = float(normalG0 == 0.0 && normalR1_true < 1.0); 
    float normalB1_true = RedNeedBlue * (1.0 - normalR1_true);

    float normalR1 = mix(normalR0, normalR1_true, DetX);
    float normalG1 = normalG0;
    float normalB1 = mix(normalB0, normalB1_true, DetX);

    float normalG2_true = normalB1;
    float GreenNeedBlue = float(normalR1 == 0.0 && normalG2_true < 1.0);
    float normalB2_true = GreenNeedBlue * (1.0 - normalG2_true);

    float normalR2 = normalR1;
    float normalG2 = mix(normalG1, normalG2_true, DetY);
    float normalB2 = mix(normalB1, normalB2_true, DetY);

    vec3 TexNormalSp = NoL <= 0.0 ? vec3(0.0, 0.0, 0.0) : mix(vec3(normalR2, -normalG2, normalB2), vec3(normalR2, -normalG2, -normalB2), N); 
    vec3 TexNormalAm = mix(vec3(normalR2, -normalG2, normalB2), vec3(normalR2, -normalG2, -normalB2), N);

    //分支写法
    if(X || XB){
        TexNormal.x = TexNormal.z; TexNormal.z = 0.0; 
        if(TexNormal.y == 0.0 && TexNormal.x < 1.0){
            TexNormal.z = 1.0 - TexNormal.x;
        }
    }
    if(Y || YB){
        TexNormal.y = TexNormal.z; TexNormal.z = 0.0;
        if(TexNormal.x == 0.0 && TexNormal.y < 1.0){
            TexNormal.z = 1.0 - TexNormal.y;
        }
    } TexNormal.y = -TexNormal.y;

*/


#ifdef ForFragmentShader

    highp float GetTextureDepth(highp vec2 texCoord){
        vec3 color = texture2D(TEXTURE_0, texCoord).rgb;
        return dot(color, vec3(0.2126, 0.7152, 0.0722));
    }
    //带TBN矩阵的纹理法线
    highp vec3 ComTextureNormal(highp vec2 texCoord, vec3 worldpos){
    
        vec2 UniSize = 1.0 / TEXTURE_DIMENSIONS.xy;
    
        vec2 LargeOff = UniSize;
        float LargeDepth_Jau = GetTextureDepth(texCoord + vec2(LargeOff.x, 0.0));
        float LargeDepth_Haa  = GetTextureDepth(texCoord + vec2(0.0, LargeOff.y));

        vec2 SmallOff = UniSize * MiniOffsetScale; //细节
        float SmallDepth_Jau = GetTextureDepth(texCoord + vec2(SmallOff.x, 0.0));
        float SmallDepth_Haa  = GetTextureDepth(texCoord + vec2(0.0, SmallOff.y));

        float DepthCentro = GetTextureDepth(texCoord); //中心深度

        float LargeGrad_X = (LargeDepth_Jau - DepthCentro) * 0.5; //U梯度
        float SmallGrad_X = (SmallDepth_Jau - DepthCentro) * 0.5; //U梯度（细节）
        float LargeGrad_Z = (LargeDepth_Haa - DepthCentro) * 0.5; //V梯度
        float SmallGrad_Z = (SmallDepth_Haa - DepthCentro) * 0.5; //V梯度（细节

        float GX = LargeGrad_X + SmallGrad_X;
        float GY = 1.0 / NormalDepthScale;
        float GZ = LargeGrad_Z + SmallGrad_Z;

        vec3 Normal = normalize(vec3(GX, GZ, GY)); //

        vec3 dxpos = vec3(dFdx(worldpos.x), dFdx(worldpos.y), dFdx(worldpos.z));
        vec3 dypos = vec3(dFdy(worldpos.x), dFdy(worldpos.y), dFdy(worldpos.z));
        vec2 dxuv2 = vec2(dFdx(texCoord.x), dFdx(texCoord.y));
        vec2 dyuv2 = vec2(dFdy(texCoord.x), dFdy(texCoord.y));
    
        vec3 dxuv = vec3(dxuv2, 0.0);
        vec3 dyuv = vec3(dyuv2, 0.0);
    
        vec3 N = normalize(cross(dxpos, dypos));
        vec3 T = normalize(dyuv.y * dxpos - dxuv.y * dypos);
        vec3 B = normalize(cross(N, T));

        mat3 TBN = mat3(T, B, N); //

        return TBN * Normal;

    }

#endif

//菲涅尔方程近似解
lowp float FresnelAprox_Env(vec3 normal, vec3 view, float M){
    float NdotV = clamp(dot(normal, view), 0.0, 1.0);
    float Fresnel = pow2((1.0 - NdotV));
    return mix(Fresnel, 1.0, M);
}

lowp vec3 FresnelAprox(float costheta, vec3 f0){//Schlick近似
    return f0 + (1.0 - f0) * pow5(1.0 - costheta);
}
/*Cook Torrance*/
//法线分布、几何遮蔽
float GGX_NormalDist(float R, float NdotH) {
    float QuattroVolteRafnes = pow4(R);
    float Den = pow2(NdotH * NdotH * (QuattroVolteRafnes - 1.0) + 1.0);
    return QuattroVolteRafnes / (PI * Den);
}

float GeometryOcSmith(float R, float NdotV, float NdotL) {
    float QuattroVolteRafnes = pow4(R);
    float DosVolteNdotV = pow2(NdotV);
    float DosVolteNdotL = pow2(NdotL);
    float LambdaV = sqrt(QuattroVolteRafnes + (1.0 - QuattroVolteRafnes) * DosVolteNdotV);
    float LambdaL = sqrt(QuattroVolteRafnes + (1.0 - QuattroVolteRafnes) * DosVolteNdotL);
    //视线与光线方向上的几何遮蔽项
    float GeoV = NdotV + LambdaV;
    float GeoL = NdotL + LambdaL;
    
    return 1.0 / (GeoV * GeoL);
}

//漫反射（这里针对Minecraft基岩版的光照特性做主观处理，声明一个LightIntent变量并使其随静态光源，天空光，兰伯特变化）Dir&Indir
lowp vec3 GetDiffuse(vec3 albedo, vec3 normal, vec3 light, vec2 lightmap, float M, float R, float t, float l, float n, vec4 fog, float near){

    //M为金属度，R为粗糙度（这里没用）
    bool End = Ender(fog, near);
    float NdotL = clamp(dot(normal, light), 0.0, 1.0);
    float PointLightInt = pow5(lightmap.x);
    float SkyLightInt = lightmap.y * SkyRatio;
    float ShadowStep = clamp((lightmap.y - 0.86) * 15.0, 0.0, 1.0);
    float InteriorStep = clamp((lightmap.y - 0.86) * 15.0, 1.0, 0.0);
    float LightIntent = mix((ShadowStep * NdotL) + SkyLightInt, 1.0, PointLightInt);

    vec3 LightColor = LightColorMix(t, l, n, PointLightInt);
    vec3 IndirectLightColor = IndirectLightColorMix(t, l, n);
    if(End){
        LightColor = LightColorMix_End(PointLightInt);
    }
    return albedo * mix(mix(IndirectLightColor, LightColor, LightIntent), vec3(0.0, 0.0, 0.0), M);//金属设为无漫反射

}
//水下
lowp vec3 GetDiffuse_SusAqua(vec3 albedo, vec3 normal, vec3 light, vec2 Lightmap){
    float NdotL = clamp(dot(normal, light), 0.0, 1.0);
    albedo *= mix(mix(vec3(0.11, 0.16, 0.33), vec3(0.50, 0.97, 1.0), NdotL), vec3(0.72, 1.0, 0.94) * 5.0, pow4(Lightmap.x));
    return albedo;
}
//镜面反射（这里的caelo（拉丁语）指天空光强度参数）
highp vec3 GetSpecular(vec3 albedo, vec3 normal, vec3 light, vec3 view, float caelo, float M, float R, float t, float l, float n) {

    vec3 HalfVec = normalize(view + light);//半向量（相当于视线与入射光线的法线）
    vec3 Specular = vec3(0.0, 0.0, 0.0);
    float InteriorStep = clamp(1.0 - pow8(pow4(caelo)) * 50.0, 0.0, 1.0);
    //必要的点乘
    float NdotV = clamp(dot(normal, view), 0.0, 1.0);
    float NdotL = clamp(dot(normal, light), 0.0, 1.0);
    float VdotH = clamp(dot(view, HalfVec), 0.0, 1.0);
    float NdotH = clamp(dot(normal, HalfVec), 0.0, 1.0);
    //法线分布与几何遮蔽，高光颜色（金属的高光颜色直接使用albedo）
    vec3 F0 = mix(vec3(0.05, 0.05, 0.05), albedo, M);
    vec3 Fresnel = FresnelAprox(VdotH, F0);
    float NormalDist = GGX_NormalDist(R, NdotH);
    float Geometry = GeometryOcSmith(R, NdotV, NdotL);
    vec3 SpecColor = SpecularColorMix(t, l, n);
    SpecColor = mix(SpecColor, albedo, M) * NdotL;
    //计算镜面反射
    Specular = SpecColor * NormalDist * Geometry * min(Fresnel, 1.0);//在一些iOS设备上Fresnel的值会超过1.0导致返回黑色，所以需要min()限制一下
    
    //室内不渲染镜面反射
    return min(mix(Specular, vec3(0.0, 0.0, 0.0), InteriorStep), vec3(1.0, 1.0, 1.0));
}
//环境反射（这里做了一大堆主观处理）
mediump vec3 GetAmbient(vec3 albedo, float a, vec3 normal, vec3 texnormal, vec3 light, vec3 view, vec4 fogclient, float fognear, 
    float t, float l, float n, float time, vec2 lightmap, float M, float R){

    bool TexPeculiaresSunt; //环境反射开关，满足条件时开启

    #if defined(TRANSPARENT)
        TexPeculiaresSunt = true;
    #else 
        #if defined(ALPHA_TEST)
            TexPeculiaresSunt = false;
        #else
            TexPeculiaresSunt = a > 0.94 && a < 1.0 ? true : false;
            albedo *= vec3(1.0, 0.8549, 0.7176) * 1.3;
        #endif
    #endif

    vec3 ReflectVector = reflect(-view, texnormal);
    vec3 BaseColor = mix(vec3(0.19, 0.19, 0.19), albedo, M);
    #ifdef TRANSPARENT
        BaseColor = vec3(0.3, 0.3, 0.3);
    #endif
    
    float NdotL = clamp(dot(normal, light), 0.0, 1.0);
    
    float Fresnel_Fix = clamp(FresnelAprox_Env(normal, view, M), 0.0, 1.0);
    float Fresnel = clamp(FresnelAprox_Env(texnormal, view, M), 0.0, 1.0);
    float InteriorStep = clamp(1.0 - pow8(pow4(lightmap.y)) * 50.0, 0.0, 1.0);//室内
    vec3 Ambient = mix(AmbientColor, vec3(0.0, 0.0, 0.0), InteriorStep);

    #ifndef ALPHA_TEST
        if(TexPeculiaresSunt){
            Ambient = AmbientSkyColor(-ReflectVector, light, fogclient, fognear, t, l, n, time, lightmap).rgb;
        }
    #endif

    if(NdotL == 0.0){ //背光部分
        Fresnel = Fresnel * Fresnel_Fix;
    }

    return Ambient * BaseColor * Fresnel;
}
//水下
mediump vec3 GetAmbient_SusAqua(vec3 texnormal, vec3 light, vec3 view, float time){

    vec3 ReflectVector = reflect(-view, texnormal);
    vec3 CaeloArrvia = ArrviaSkyColor(-ReflectVector, light, time).rgb;
    return CaeloArrvia;

}
//模拟散射雾
mediump vec3 ScatNebyImitare(vec3 pos, vec3 sunpos, vec4 fogclient, float fognear, float t, float l, float n){
    
    vec3 FogColorAir = mix(mix(mix(vec3(0.3,0.4,0.5), vec3(0.1,0.13,0.3), t), vec3(0.6,0.6,0.6), l), vec3(0.1,0.23,0.38), n);
    vec3 skypos = normalize(pos);
    vec3 miedir = mix(-sunpos, vec3(sunpos.x, sunpos.y, -sunpos.z), n);
    vec3 MieColor = mix(mix(mix(vec3(0.4314, 0.302, 0.1765),vec3(0.5725, 0.2549, 0.0275),t),vec3(0.3,0.3,0.3),l), vec3(0.102, 0.1843, 0.2588), n);
    vec3 HalfVec = normalize(skypos + miedir);
    float VdotH = saturate(pow8(pow2((dot(skypos, HalfVec)))));
    vec3 FogColor = FogColorAir + MieColor * VdotH;
    
    FogColor = Fog_ColorAdjustment(FogColor, fogclient.rgb, t, l, n);//受雾颜色影响
    return pow(FogColor, vec3(2.2, 2.2, 2.2));
}
//水下雾
mediump vec3 ScatNebyImitare_Susaqua(vec3 view, vec3 light){

    light = -light;
    vec3 Color = ScaColorSusAqua;
    vec3 HalfVec = normalize(view + light);
    float VdotH = saturate(pow8(pow4((dot(view, HalfVec)))));
    vec3 CanvasColor = FogColorSusAqua + (Color * VdotH);

    return pow(CanvasColor, vec3(2.2, 2.2, 2.2));
}
//用于模拟次表面散射
mediump vec3 SubsurfaceLightImitare(vec3 albedo, vec3 view, vec3 light, float t, float l, float n){

    light = -light;
    vec3 Color = SubsurfLightColorMix(t, l, n) * albedo;
    vec3 HalfVec = normalize(view + light);
    float VdotH = saturate(pow8(pow4((dot(view, HalfVec)))));

    return Color * VdotH * SubsurfaceScaStr;
}


/*
//低配版本使用（Blinn-Phong）
mediump vec3 GetSpecular(vec3 albedo, vec3 normal, vec3 light, vec3 view, float skylight, float M, float R, float t, float l, float n){

    vec3 HalfVec = normalize(view + light);
    float HdotL = max(0.0, dot(HalfVec, normal));
    float NdotL = clamp(dot(normal, light), 0.0, 1.0);
    float SpecInt = pow(HdotL, 2.0) * NdotL;
    vec3 SpecColor = vec3(0.3922, 0.3922, 0.3922);

    return SpecColor * NdotL;

}
*/
