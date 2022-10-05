//
//  NSCodingExt.swift
//  Project10
//
//  Created by Grant Watson on 10/5/22.
//

import Foundation

extension NSCoding where Self: NSObject {
    static func unsecureUnarchived(from data: Data) -> Self? {
        do {
            let unarchiver = try NSKeyedUnarchiver(forReadingFrom: data)
            unarchiver.requiresSecureCoding = false
            let obj = unarchiver.decodeObject(of: self, forKey: NSKeyedArchiveRootObjectKey)
            if let error = unarchiver.error {
                print(error.localizedDescription)
            }
            return obj
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
