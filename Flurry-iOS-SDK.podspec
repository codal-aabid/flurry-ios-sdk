#
# Be sure to run `pod lib lint Flurry-iOS-SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Flurry-iOS-SDK'
  s.version          = '7.0.0'
  s.summary          = 'Flurry SDK for iOS'
  s.license  = { :type => 'Commercial', :text => license }
  s.summary  = 'FlurrySDK consists of: Flurry for analytics tracking and reporting. Flurry Ads for Native, Full Screen Ads integation'
  s.homepage = 'http://developer.yahoo.com/flurry'
  s.author   = { 'Flurry' => 'http://developer.yahoo.com/flurry' }
  s.source   = { :git => 'https://github.com/flurry/Flurry-iOS-SDK.git', :tag => '#{s.version}' }
  s.platform = :ios
  s.requires_arc = false
  s.default_subspec = 'FlurrySDK'

  s.subspec 'Flurry' do |ss|
    ss.source_files = [
      'Flurry/Flurry.h',
      'Flurry/Empty.m'
    ]
    
    ss.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = 'Flurry/libFlurry_7.0.0.a'
  end

  s.subspec 'FlurryWatchSDK' do |ss|
    ss.source_files = [
      'Flurry/FlurryWatch.h',
      'Flurry/Flurry.h'
    ]

    ss.frameworks = 'Foundation', 'SystemConfiguration', 'UIKit', 'Security'
    ss.vendored_libraries = 'Flurry/libFlurry_7.0.0.a'
  end

  s.subspec 'FlurryAds' do |ss|
    ss.source_files = [
      'FlurryAds/**/*.h'
    ]
    # To ensure lib really used by lib you can use:
    # libz.dylib:  nm -m FlurryAds/*.a | grep -v 'non-external' | grep _inflate
    ss.libraries = 'z'
    
    ss.frameworks = 'CoreGraphics', 'CoreMedia', 'MediaPlayer', 'AVFoundation'
    # next frameworks is optional according:
    # https://developer.yahoo.com/flurry/docs/publisher/code/ios/
    # To ensure frameworks really used by lib you can use:
    # AdSupport used:     nm -m FlurryAds/*.a | grep -v 'non-external' | grep _AS
    # StoreKit not used?: nm -m FlurryAds/*.a | grep -v 'non-external' | grep _SK
    ss.weak_frameworks = 'AdSupport', 'StoreKit'
    ss.vendored_libraries = 'FlurryAds/libFlurryAds_7.0.0.a'
    ss.dependency 'FlurrySDK/Flurry'
  end
  
  s.subspec 'TumblrAPI' do |ss|
    ss.source_files = [
      'FlurryTumblrAPI/FlurryTumblr.h',
      'FlurryTumblrAPI/FlurryTumblrDelegate.h'
    ]

    ss.dependency 'FlurrySDK/Flurry'
  end

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       DESC


  s.license          = 'MIT'
  s.author           = { 'Flurry' => 'integration@flurry.com' }
  s.source           = { :git => 'https://github.com/flurry/Flurry-iOS-SDK.git', :tag => s.version.to_s }
 
  s.platform     = :ios, '7.0'
  s.requires_arc = false

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Flurry-iOS-SDK' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
