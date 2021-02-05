//
//  BookModel.swift
//  BookScan
//
//  Created by Zed on 5/2/21.
//

import Foundation
import UIKit

struct BookModel: Identifiable, Hashable {
    var id = UUID()
    var bookName: String // the name of the book, includign the author??
    var bookImage: UIImage
}

extension BookModel {
    init() {
        self.bookName = ""
        self.bookImage = UIImage()
    }
    
    init(name n: String, image i: UIImage) {
        self.bookName =  n
        self.bookImage = i
    }
}



//MARK: This function will just generate some books to populate the recently scanned table
func GenerateBooks() -> [BookModel] {
    var books = [BookModel]()
    
    books.append(BookModel(bookName: "Fox 8", bookImage: #imageLiteral(resourceName: "Fox 8")))
    books.append(BookModel(bookName: "Wise Mans Fear", bookImage: #imageLiteral(resourceName: "Wise Mans Fear")))
    books.append(BookModel(bookName: "The Cat In The Hat", bookImage: #imageLiteral(resourceName: "The Cat In The Hat")))
    books.append(BookModel(bookName: "The Name Of The Wind", bookImage: #imageLiteral(resourceName: "The Name Of The Wind")))
    books.append(BookModel(bookName: "The Cat In The Hat", bookImage: #imageLiteral(resourceName: "The Cat In The Hat")))
    books.append(BookModel(bookName: "The Name Of The Wind", bookImage: #imageLiteral(resourceName: "The Name Of The Wind")))
    books.append(BookModel(bookName: "Fox 8", bookImage: #imageLiteral(resourceName: "Fox 8")))
    books.append(BookModel(bookName: "Wise Mans Fear", bookImage: #imageLiteral(resourceName: "Wise Mans Fear")))
    books.append(BookModel(bookName: "Fox 8", bookImage: #imageLiteral(resourceName: "Fox 8")))
    books.append(BookModel(bookName: "Wise Mans Fear", bookImage: #imageLiteral(resourceName: "Wise Mans Fear")))
    
    
    

    return books
}
