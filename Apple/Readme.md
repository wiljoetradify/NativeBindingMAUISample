# Apple/iOS Native binding

## Folders 

### NativeBindingSample
This folder containing iOS Native code written in swift. 

### NetBindingSample
This folder containing Dotnet iOS Native Binding referred from build archive from **NativeBindingSample** folder

### NetBindingTester
This folder containing Dotnet iOS app that could be used to try **NetBindingSample** 

## How to use? 

1. Run build.sh (This should have build **NativeBindingSample** and **NetBindingSample** + Created a nuget package)
2. Open **NetBindingTester**.csproj and refer the project to generated **NetBindingSample** nuget package
3. Run the build
