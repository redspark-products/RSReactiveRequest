Pod::Spec.new do |s|
    s.name             = 'RSReactiveRequest'
    s.version          = '1.0.1'
    s.summary          = 'Lib to encapsulate your alamofire requests into RxSwift observable'
    s.description      = <<-DESC
    Lib to encapsulate your alamofire requests into RxSwift observable. Make a requests more simpler to use with RxSwift flows.
    DESC

    s.homepage         = 'https://github.com/redspark-io/RSReactiveRequest'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Marcus Costa' => 'marcus.costa@redspark.io' }
    s.source           = { :git => 'https://github.com/redspark-io/RSReactiveRequest.git', :tag => s.version.to_s }

    s.ios.deployment_target = '12.0'
    s.swift_version = '5.0'
    s.module_name = 'RSReactiveRequest'
    s.requires_arc = true

    s.source_files = 'RSReactiveRequest/Classes/**/*'

    s.dependency 'Alamofire', '~> 4.9.1'
    s.dependency 'AlamofireImage'
    s.dependency 'CodableAlamofire'
    s.dependency 'RxSwift'

end
