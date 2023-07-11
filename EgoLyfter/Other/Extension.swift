//
//  Extension.swift
//  EgoLyfter
//
//  Created by Joel on 6/30/23.
//
import SwiftUI
import Foundation

extension Encodable {
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
