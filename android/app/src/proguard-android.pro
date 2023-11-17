# Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
# EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod
-keep class ai.icenter.face3d.native_lib.Face3DConfig { *; }
-keep class ai.icenter.face3d.native_lib.CardConfig { *; }
