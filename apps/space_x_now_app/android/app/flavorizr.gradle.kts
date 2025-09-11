import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.mvzd.spaceXnow"
            resValue(type = "string", name = "app_name", value = "SpaceX Now")
        }
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.mvzd.spaceXnow.dev"
            resValue(type = "string", name = "app_name", value = "SpaceX Now (Dev)")
        }
    }
}