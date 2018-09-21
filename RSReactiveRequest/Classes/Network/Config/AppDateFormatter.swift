//
//  AppDateFormatter.swift
//  medicos
//
//  Created by Renato Massi on 28/08/2018.
//  Copyright © 2018 filoo. All rights reserved.
//

import Foundation

public class AppDateFormatter: DateFormatter {

    public static let formatters: [DateFormatter] = dateFormatters()

    public static func dateFormatters() -> [DateFormatter] {
        return ["dd/MM/yyyy HH:mm", "dd/MM/yyyy"].map { dateFormat in
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: Locale.current.identifier)
            dateFormatter.dateFormat = dateFormat
            return dateFormatter
        }
    }

    override public func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?,
                                        for string: String,
                                        errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        guard let date = (type(of: self).formatters.compactMap { $0.date(from: string) }).first else {
            error?.pointee = "Invalid AppDateFormat date: \(string)" as NSString
            return false
        }
        obj?.pointee = date as NSDate
        return true
    }

    override public func string(for obj: Any?) -> String? {
        guard let date = obj as? Date else { return nil }
        return type(of: self).formatters.compactMap { $0.string(from: date) }.first
    }

}
