source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '11'

def sharePods
    pod 'Then'
end

target 'CanYou' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '4.0'
          end
      end
  end

  # Pods for CanYou
  sharePods
  pod 'RealmSwift'

  target 'CanYouTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CanYouUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

#target 'CanYouWatch Extension' do
#    platform :watchos
#    sharePods

#end

