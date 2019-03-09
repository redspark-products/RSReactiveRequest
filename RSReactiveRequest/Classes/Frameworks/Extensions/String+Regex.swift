//
//  String+Regex.swift
//  RSReactiveRequest
//
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation

extension String {

    public func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.compactMap {
                guard let range = Range($0.range, in: text) else  {
                    return nil
                }
                return String(text[range])
            }
        } catch {
            debugPrint("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

}
