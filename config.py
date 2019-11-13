def can_build(plat):
    return plat == 'android' or plat == 'iphone'

def configure(env):
    if env['platform'] == 'android':

        env.android_add_maven_repository("url 'https://maven.google.com'")

        gms_version = "15.0.1"

        # Play service dependencies
        env.android_add_dependency("compile 'com.google.android.gms:play-services-auth:" + gms_version + "'")
        env.android_add_dependency("compile 'com.google.android.gms:play-services-games:" + gms_version + "'")

        env.android_add_java_dir("android")
        env.android_add_to_manifest("android/AndroidManifestChunk.xml")
        env.disable_module()
