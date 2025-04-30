Pod::Spec.new do |spec|
    spec.name                     = 'kotlin_library'
    spec.version                  = '1.0'
    spec.homepage                 = 'https://github.com/Kotlin/multitarget-xcode-with-kotlin-cocoapods-sample'
    spec.source                   = { :http=> ''}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'Kotlin CocoaPods library'
    spec.vendored_frameworks      = 'build/cocoapods/framework/KotlinLibrary.framework'
    spec.libraries                = 'c++'
    spec.ios.deployment_target    = '16.6'
    spec.osx.deployment_target    = '13.5'
    spec.tvos.deployment_target    = '16.6'
    spec.watchos.deployment_target    = '9.6'
                
                
    if !Dir.exist?('build/cocoapods/framework/KotlinLibrary.framework') || Dir.empty?('build/cocoapods/framework/KotlinLibrary.framework')
        raise "

        Kotlin framework 'KotlinLibrary' doesn't exist yet, so a proper Xcode project can't be generated.
        'pod install' should be executed after running ':generateDummyFramework' Gradle task:

            ./gradlew :kotlin-library:generateDummyFramework

        Alternatively, proper pod installation is performed during Gradle sync in the IDE (if Podfile location is set)"
    end
                
    spec.xcconfig = {
        'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
    }
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':kotlin-library',
        'PRODUCT_MODULE_NAME' => 'KotlinLibrary',
    }
                
    spec.script_phases = [
        {
            :name => 'Build kotlin_library',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
                
end