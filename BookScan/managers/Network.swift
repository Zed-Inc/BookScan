//
//  Network.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
//

import Foundation


import Alamofire





class NetworkManager {
    static var network = NetworkManager()
    
    // decode a responses json into a struct
    // this is a generic function that will work for any struct the conforms to the codable protocol
    func decodeJson<T:Codable>(data: Data) -> T {
        let decoded: T = try! JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
//    https://cloud.google.com/vision/docs/ocr
    ///This function will connect with google cloud and return any written text in the image
    /*
     Scan the isbn of the book and return information that way??
     https://www.iowncode.com/ios-text-recognition-using-vision-and-core-ml/
     */
    func parseImage(image: Data, completion: (ImageData) -> Void) {
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
        print("json \(json)")
    }
    
    
    /*
     I think we might have to skip the text recognition for the a3 prototype
     i dont have enough time for figuring out the image classifier
     
     or we shift and scan for the isbn of the book
     because of font/cover image problems
     
     https://www.labnol.org/code/20020-query-book-by-isbn
     */
    
    func getReviews(isbn: String, completion: (ReviewList) -> Void) {
        let url = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)"
        AF.request(url).response { resp in
            
            
        }
    }
    
    
    
}
