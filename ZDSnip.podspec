Pod::Spec.new do |s|
  s.name             = 'ZDSnip'
  s.version          = '0.1.0'
  s.summary          = '截图工具'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/izaodao/ZDSnip.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lvhaoxuan' => 'lvhaoxuan@izaodao.com' }
  s.source           = { :git => 'https://github.com/izaodao/ZDSnip.git', :tag => s.version.to_s }

  s.platform = :osx
  s.osx.deployment_target = "10.12"

  s.source_files = 'ZDSnip/Classes/**/*'

  # s.resource_bundles = {
  #   'ZDSnip' => ['ZDSnip/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'
  # s.dependency 'AFNetworking', '~> 2.3'
end
