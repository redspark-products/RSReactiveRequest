Pod::Spec.new do |s|
    s.name             = 'RSReactiveRequest'
    s.version          = '1.0.0'
    s.summary          = 'Lib to encapsulate your alamofire requests into RxSwift observable'
    s.description      = <<-DESC
    Lib to encapsulate your alamofire requests into RxSwift observable. Make a requests more simpler to use with RxSwift flows.
    DESC

    s.homepage         = 'https://github.com/redspark-io/RSReactiveRequest'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Marcus Costa' => 'marcus.costa@redspark.io' }
    s.source           = { :git => 'https://github.com/redspark-io/RSReactiveRequest.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    s.swift_version = '4.2'
    s.module_name = 'RSReactiveRequest'
    s.requires_arc = true

    s.source_files = 'RSReactiveRequest/Classes/**/*'

    s.dependency 'Alamofire'
    s.dependency 'AlamofireImage'
    s.dependency 'CodableAlamofire'
    s.dependency 'RxSwift'

end
