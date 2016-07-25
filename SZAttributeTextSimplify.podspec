Pod::Spec.new do |s|

  s.name         = "SZAttributeTextSimplify"
  s.version      = "0.0.3"
  s.summary      = "attributed text simplify"
  s.homepage     = "https://github.com/chenshengzhi/SZAttributeTextSimplify"
  s.license      = "MIT"
  s.author       = { "陈圣治" => "csz2136@163.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/chenshengzhi/SZAttributeTextSimplify.git", :tag => s.version.to_s }
  s.source_files = "SZAttributeTextSimplify/*.{h,m}"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true

end
