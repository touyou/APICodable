Pod::Spec.new do |s|
    s.name      = "APICodable"
    s.version   = "0.0.1"
    s.summary   = "The library makes easiest way to access JSON API by Codable Power."
    s.homepage  = "https://github.com/touyou/APICodable"
    s.license   = { :type => "MIT" }
    s.authors   = { "touyou" => "touyou.dev@gmail.com" }

    s.requires_arc  = true
    s.osx.deployment_target = "10.9"
    s.ios.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"
    s.tvos.deployment_target = "9.0"
    s.source = { :git => "https://github.com/touyou/APICodable", :tag =? "v#{s.version}" }
    s.source_files = "Souces/*.swift"
    s.pod_target_xcconfig = {
        'SWIFT_VERSION' => '4.0',
    }
end
