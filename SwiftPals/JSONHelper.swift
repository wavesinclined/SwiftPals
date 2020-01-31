//
//  JSONHelper.swift
//  SwiftPals
//
//  Created by Jyotsna on 30/01/20.
//  Copyright © 2020 Jyotsna. All rights reserved.
//

import Foundation

open class SwiftPalsJSONHelper<T: Codable> {
    
   open class func decodeData(_ data: Data?) -> T? {
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch let jsonErr {
            return nil
        }
    }
    
    open class func getLocalJSONObject(_ localJSON: String) -> T? {
        let data = SwiftPalsJSONHelper.getLocalJSON(localJSON)
        return SwiftPalsJSONHelper.decodeData(data)
    }
    
    open class func getLocalJSON(_ localJSON: String) -> Data? {
        guard let jsonPath = Bundle.main.path(forResource: localJSON, ofType: "json") else {
                return nil
        }
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath))
        return jsonData
    }
    
    open class func decodeData(_ data: Any?) throws -> T? {
        if let dict = data as? [String: Any] {
            let data = try JSONSerialization.data(withJSONObject: dict, options: [])
            return SwiftPalsJSONHelper.decodeData(data)
        }
        return nil
    }
    
}

