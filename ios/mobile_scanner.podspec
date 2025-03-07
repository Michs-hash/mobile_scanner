#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint mobile_scanner.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'mobile_scanner'
  s.version          = '6.0.2'
  s.summary          = 'An universal scanner for Flutter based on MLKit.'
  s.description      = <<-DESC
An universal scanner for Flutter based on MLKit.
                       DESC
  s.homepage         = 'https://github.com/juliansteenbakker/mobile_scanner'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Julian Steenbakker' => 'juliansteenbakker@outlook.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'GoogleMLKit/BarcodeScanning', '~> 7.0.0'
  s.platform = :ios, '16.0.0'
  s.static_framework = true
  # Flutter.framework does not contain a i386 slice, and MLKit does not support armv7.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # TODO: add back arm64 (and armv7?) when switching to the Vision API.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386 armv7 arm64',
    'EXCLUDED_ARCHS[sdk=iphoneos*]' => 'armv7',
  }
  s.swift_version = '5.0'
  s.resource_bundles = { 'mobile_scanner_privacy' => ['Resources/PrivacyInfo.xcprivacy'] }
end
