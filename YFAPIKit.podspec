Pod::Spec.new do |s|
    s.name             = 'YFAPIKit'
    s.version          = '1.0.2'
    s.summary          = 'YFAPIKit.'
    
    s.description      = <<-DESC
    Demo Util for my proj
    DESC
    
    s.homepage         = 'https://github.com/evenlinyf/YFAPIKit'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'EvenLin' => 'evenlinyf@163.com' }
    s.source           = { :git => 'https://github.com/evenlinyf/YFAPIKit.git', :tag => s.version.to_s }
    s.platform         = :ios
    s.ios.deployment_target = '7.0'
    s.requires_arc     = true
    s.source_files     = 'YFAPIKit/Classes/**/*'
    s.resource = 'YFAPIKit/Assets/YFResources.bundle'
    s.public_header_files = 'YFAPIKit/**/*.h'
    s.dependency 'SVProgressHUD'
end
