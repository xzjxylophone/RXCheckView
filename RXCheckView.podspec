


Pod::Spec.new do |s|
  s.name     = "RXCheckView"
  s.version  = "0.1"
  s.license  = "MIT"
  s.summary  = "RXCheckView is a simple check view"
  s.homepage = "https://github.com/xzjxylophone/RXCheckView"
  s.author   = { 'Rush.D.Xzj' => 'xzjxylophoe@gmail.com' }
  s.social_media_url = "http://weibo.com/xzjxylophone"
  s.source   = { :git => 'https://github.com/xzjxylophone/RXCheckView.git', :tag => "v#{s.version}" }
  s.description = %{
        RXCheckView is a simple check view.
  }
  s.source_files = 'RXCheckView/*.{h,m}'
  s.frameworks = 'Foundation', 'UIKit'
  s.requires_arc = true
  s.platform = :ios, '5.0'

end


