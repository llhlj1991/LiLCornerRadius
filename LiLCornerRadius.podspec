<<<<<<< HEAD
#
# Be sure to run `pod lib lint LiLCornerRadius.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LiLCornerRadius'
  s.version          = '0.1.0'
  s.summary          = 'hello hi marry'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/llhlj1991/LiLCornerRadius'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'llhlj1991' => '1608968113@qq.com' }
  s.source           = { :git => 'https://github.com/llhlj1991/LiLCornerRadius.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LiLCornerRadius/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LiLCornerRadius' => ['LiLCornerRadius/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
=======
Pod::Spec.new do |s|
  s.name         = "LiLCornerRadius"
  s.version      = "0.0.1"
  s.summary      = "just soso"
s.description      = <<-DESC
Testing Private Podspec.

* Markdown format.
* Don't worry about the indent, we strip it!
DESC
  s.homepage     = "https://github.com/llhlj1991/LiLCornerRadius"
  s.license      = "MIT"
  s.author             = { "lilei" => "lileiabt@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/llhlj1991/LiLCornerRadius.git", :tag => "#{s.version}" }
  s.source_files  = "LiLCornerRadius/**/*.{h,m}"
  s.requires_arc = true
>>>>>>> 39336fef088eb6758550e1cb253d334f31a828ec
end
