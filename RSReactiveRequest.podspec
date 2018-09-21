Pod::Spec.new do |s|
    s.name             = 'RSReactiveRequest'
    s.version          = '0.0.1'
    s.summary          = 'A short description of RSReactiveRequest.'
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC

    s.homepage         = 'https://github.com/redspark-io/RSReactiveRequest'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Marcos Alessandro da Fonseca' => 'marcos.ale.fonseca@gmail.com' }
    s.source           = { :git => 'https://github.com/redspark-io/RSReactiveRequest.git', :tag => s.version.to_s }

    s.ios.deployment_target = '9.0'
    s.swift_version = '4.0'
    s.module_name = 'RSReactiveRequest'
    s.requires_arc = true

    s.source_files = 'RSReactiveRequest/Classes/**/*'

    s.dependency 'Alamofire'
    s.dependency 'AlamofireImage'
    s.dependency 'CodableAlamofire'
    s.dependency 'RxSwift'
    s.dependency 'KeychainAccess'

end
