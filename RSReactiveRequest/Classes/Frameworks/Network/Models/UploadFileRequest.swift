//
//  UploadFileRequest.swift
//  RSReactiveRequest
//
//  Created by Andre M. Della Torre on 08/11/18.
//

import Foundation
import Alamofire

public final class UploadFileRequest {

    let sessionManager: Alamofire.SessionManager
    let url: URL
    let files: [FileRequest]
    let encoding: ParameterEncoding?
    let headers: HTTPHeaders?

    init(sessionManager: Alamofire.SessionManager, url: URL, files: [FileRequest], encoding: ParameterEncoding?, headers: HTTPHeaders?) {
        self.sessionManager = sessionManager
        self.url = url
        self.files = files
        self.encoding = encoding
        self.headers = headers
    }

}
