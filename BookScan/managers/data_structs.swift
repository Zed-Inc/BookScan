//
//  data_structs.swift
//  BookScan
//
//  Created by Zed on 17/1/21.
//

import Foundation

struct ImageData {
    var bookName: String
    var author: String
}



struct ReviewList {
    var reviews: [Review]
    var reviewCount: Int
    var averageReview: Float
}


struct Review {
    var reviewerName: String?
    var stars: Float
    var reviewTitle: String
    var reviewBody: String
}
