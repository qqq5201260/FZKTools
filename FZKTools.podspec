

Pod::Spec.new do |s|
s.name         = "FZKTools"
s.version      = "1.0.1"
s.ios.deployment_target = '8.0'
s.summary      = "some utilities"
s.homepage     = "https://github.com/qqq5201260/FZKTools"
s.license              = { :type => "MIT", :file => "LICENSE" }
s.author             = { "czl" => "1421610488@qq.com" }
s.source       = { :git => "https://github.com/qqq5201260/FZKTools.git", :tag => s.version }
s.requires_arc = true

s.source_files = 'FZKTools/*'



s.subspec 'Category' do |ss|
ss.source_files = 'FZKTools/Category/*', 'FZKTools/Category/**/*'
end

s.subspec 'Macro' do |ss|
ss.source_files = 'FZKTools/Macro/*.{h}'
end

s.subspec 'Notification' do |ss|
ss.source_files = 'FZKTools/Notification/*.{h,m}'
end

s.subspec 'Utilities' do |ss|
ss.source_files = 'FZKTools/Utilities/*.{h,m}'
end

end
