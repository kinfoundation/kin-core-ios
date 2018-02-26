Pod::Spec.new do |s|
  s.name             = 'KinSDK'
  s.version          = '0.6.0'
  s.summary          = 'Pod for the KIN SDK.'

  s.description      = <<-DESC
  Initial pod for the KIN SDK.
                       DESC

  s.homepage         = 'https://github.com/kinfoundation/kin-sdk-core-stellar-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Kin Foundation' => 'kin@kik.com' }
  s.source           = { :git => 'https://github.com/kinfoundation/kin-sdk-core-stellar-ios.git', :tag => "#{s.version}" }

  s.source_files = 'KinSDK/KinSDK/**/*.swift'

  s.dependency 'StellarKit', '0.2.0'

  s.ios.deployment_target = '8.0'
  s.swift_version = "3.2"
  s.platform = :ios, '8.0'
end
