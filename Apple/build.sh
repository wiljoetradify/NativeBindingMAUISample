#!/bin/bash

remove_folder()
{
    folder_to_remove=$1

    if [ -d "$folder_to_remove" ]; then
        printf '%s\n' "Removing ($folder_to_remove)"
        rm -rf "$folder_to_remove"
    fi
}

#building native project
echo 'building native project'

native_project_path='NativeBindingSample'
native_project_name='NativeBindingSample'
native_archive_directory='archive'
native_physical_device_archive_name="$native_project_name-ios.xcarchive"
native_simulator_archive_name="$native_project_name-sim.xcarchive"
csharp_api_definition_path='./../NetBindingSample/NetBindingSample/'

cd $native_project_path

remove_folder $native_archive_directory

xcodebuild archive \
 -scheme $native_project_name \
 -archivePath "$native_archive_directory/$native_physical_device_archive_name" \
 -sdk iphoneos \
 -configuration Release \
 SKIP_INSTALL=NO

xcodebuild archive \
 -scheme $native_project_name \
 -archivePath "$native_archive_directory/$native_simulator_archive_name" \
 -sdk iphonesimulator \
 -configuration Release \
 SKIP_INSTALL=NO

xcodebuild -create-xcframework \
 -framework "$native_archive_directory/$native_physical_device_archive_name/Products/Library/Frameworks/$native_project_name.framework" \
 -framework "$native_archive_directory/$native_simulator_archive_name/Products/Library/Frameworks/$native_project_name.framework" \
 -output "$native_archive_directory/$native_project_name.xcframework"

sharpie bind \
 -sdk iphoneos \
 -output $csharp_api_definition_path \
 -namespace $native_project_name \
 -framework "$native_archive_directory/$native_project_name.xcframework/ios-arm64/$native_project_name.framework"


cd ../

# build dotnet project
echo 'building dotnet binding project'

binding_project_path='NetBindingSample/NetBindingSample'
binding_project_bin_directory='bin'
binding_project_obj_directory='obj'

cd $binding_project_path

remove_folder $binding_project_bin_directory
remove_folder $binding_project_obj_directory

dotnet build -c Release

cd ../../


# create nuget package
echo 'building dotnet binding project'

binding_project_nugetspec_path="$binding_project_path/NetBindingSample.nuspec"

rm *.nupkg

nuget pack $binding_project_nugetspec_path