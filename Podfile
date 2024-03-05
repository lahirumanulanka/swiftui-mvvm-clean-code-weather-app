# Uncomment the next line to define a global platform for your project
platform :ios, "15.0"
inhibit_all_warnings!
use_frameworks!

workspace "App.xcworkspace"

def general
  pod "SwiftLint", "~> 0.50.3"
end

abstract_target "mainApp" do
  
  target "weatherapp" do
    project "weatherapp.xcodeproj"
    general
    
    target "weatherappTests" do
      inherit! :search_paths
      # Pods for testing
    end
    
    target "weatherappUITests" do
      # Pods for testing
    end
  end
end

abstract_target "weatherCore" do
  
  target "WeatherCore" do
    project "WeatherCore/WeatherCore.xcodeproj"
    
  end
end

abstract_target "api" do
  
  target "API" do
    project "API/API.xcodeproj"
    
  end
end

abstract_target "model" do
  target "Model" do
    project "Model/Model.xcodeproj"
    
  end
end
