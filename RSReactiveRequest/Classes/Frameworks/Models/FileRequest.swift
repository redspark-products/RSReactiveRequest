//
//  FileRequest.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public struct FileRequest {

    let properties: Codable?
    let data: Data
    let name: String
    let fileName: String
    let mimeType: MimeType

    public init(data: Data, name: String, properties: Codable? = nil, fileName: String = "", mimeType: MimeType) {
        self.data = data
        self.name = name
        self.properties = properties
        self.fileName = fileName
        self.mimeType = mimeType
    }

}
