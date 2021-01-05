//
//  Network.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
//

import Foundation


struct ImageData {
    
}

class NetworkManager {
    static var network = NetworkManager()
    
    // decode a responses json into a struct
    // this is a generic function that will work for any struct the conforms to the codable protocol
    func decodeJson<T:Codable>(data: Data) -> T {
        let decoded: T = try! JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
//    https://cloud.google.com/vision/docs/ocr
    func parseImage(image: Data) -> ImageData {
        let encoded = image.base64EncodedData()
        print("Encoded image data -> \(encoded)")
        
        // the json body we will send with the request
         let json = [
            "requests" : [
                "image": [
                    "content": encoded
                ],
                "features" : [
                    [
                        "type": "TEXT_DETECTION"
                    ]
                ]
            ]
         ]
        
        
        
        
    }
    
    
    
    
    
}
