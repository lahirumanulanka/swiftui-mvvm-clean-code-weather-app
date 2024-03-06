platform :ios, '15.0'
inhibit_all_warnings!
use_frameworks!
workspace "App.xcworkspace"

def general
  pod "SwiftLint", "~> 0.50.3"
end

target "weatherapp" do
  project "weatherapp.xcodeproj"
  general
  
  # Assuming 'WeatherCore', 'API', and 'Model' don't have external pods
  # and are just projects you want to integrate

  target "weatherappTests" do
    inherit! :search_paths
    # Pods for testing
  end
  
  target "weatherappUITests" do
    # Pods for testing
  end
end

# No changes needed here unless they have specific dependencies
target "WeatherCore" do
  project "WeatherCore/WeatherCore.xcodeproj"
end

target "API" do
  project "API/API.xcodeproj"
end

target "Model" do
  project "Model/Model.xcodeproj"
end
