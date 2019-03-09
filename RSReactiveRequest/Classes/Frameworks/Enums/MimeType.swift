//
//  MimeType.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

public enum MimeType: String {

    // MARK: images
    case gif    = "image/gif"
    case png    = "image/png"
    case jpeg   = "image/jpeg"
    case bmp    = "image/bmp"
    case webp   = "image/webp"
    case ico    = "image/x-icon"
    case svg    = "image/svg+xml"
    case tiff   = "image/tiff"

    // MARK: - audios
    case midi   = "audio/midi"
    case weba   = "audio/webm"
    case oga    = "audio/ogg"
    case wav    = "audio/x-wav"
    case acc    = "audio/aac"

    // MARK: videos
    case avi    = "video/x-msvideo"
    case mpeg   = "video/mpeg"
    case ogv    = "video/ogg"
    case webm   = "video/webm"
    
}
