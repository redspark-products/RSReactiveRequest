//
//  FileRequest.swift
//  RSReactiveRequest
//
//  Created by Andre M. Della Torre on 08/11/18.
//

import Foundation

public struct FileRequest {

    let properties: Codable?
    let data: Data
    let name: String
    let fileName: String
    let mimeType: MimeType

    init(data: Data, name: String, properties: Codable? = nil, fileName: String = "", mimeType: MimeType) {
        self.data = data
        self.name = name
        self.properties = properties
        self.fileName = fileName
        self.mimeType = mimeType
    }

}
