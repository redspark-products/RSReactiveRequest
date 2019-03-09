//
//  UploadFileRequest.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import Alamofire

public final class UploadFileRequest {

    let sessionManager: Alamofire.SessionManager
    let url: URL
    let files: [FileRequest]
    let encoding: ParameterEncoding?
    let headers: HTTPHeaders?

    public init(sessionManager: Alamofire.SessionManager, url: URL, files: [FileRequest], encoding: ParameterEncoding?, headers: HTTPHeaders?) {
        self.sessionManager = sessionManager
        self.url = url
        self.files = files
        self.encoding = encoding
        self.headers = headers
    }

}
