//
//  QuizModel.swift
//  BookScan
//
//  Created by Zed on 7/2/21.
//

import Foundation



struct QuizModel: Identifiable, Hashable {
    var id = UUID()
    var quizName : String
}



func GenerateQuiz() -> [QuizModel] {
    return [
        QuizModel(quizName: "The Cat In The Hat"),
        QuizModel(quizName: "Little Women"),
        QuizModel(quizName: "The tale of two caravans"),
        QuizModel(quizName: "Harry Potter"),
        QuizModel(quizName: "Narnia"),
        QuizModel(quizName: "Fox 8"),
        QuizModel(quizName: "Name of the wind"),
        QuizModel(quizName: "A wise mens fear")
    ]
}
