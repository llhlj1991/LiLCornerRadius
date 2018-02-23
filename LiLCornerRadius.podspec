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
end
