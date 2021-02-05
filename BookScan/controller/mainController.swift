//
//  mainController.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
//

import Foundation
import SwiftUI

class HomeController {
    let network = NetworkManager()
    
    // this function will parse the image, extract text and return the 
    func fetchBookInfo(image: UIImage, toggleList: Binding<Bool>, bookInformation: Binding<ImageData>) {
        let data = image.pngData()!
        // call the network function
        // when the network closure happens we want to edit the bindings values, this will then backtrack to the view where the review list will be displayed
        
    }
    
    
    
    
    
}
