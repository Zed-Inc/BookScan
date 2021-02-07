//
//  QuizView.swift
//  BookScan
//
//  Created by Zed on 7/2/21.
//

import SwiftUI

struct QuizView: View {
    @State var searchEnterPressed: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    private let quizData = GenerateQuiz() // and arry of quiz models
    
    var body: some View {
        ZStack {
            Color.darkEnd
            
            VStack {
                HStack {
                    Spacer()
                    Text("Quizzes")
                        .foregroundColor(.white)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    Spacer()
                }.overlay(
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            ZStack{
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.orange)
                            }
                        })
                        Spacer()
                    }.padding(.leading, 25)
                )
                
                Divider()
                List {
                    ForEach(self.quizData) { quiz in
                        ZStack {
                            HStack {
                                Image(systemName: "capsule.fill")
                                    .imageScale(.small)
                                    .foregroundColor(.gray)
                                    Text(quiz.quizName)
                                        .font(.title)
                                        .foregroundColor(.gray)
                                        .fontWeight(.semibold)
                            }
                        }.listRowBackground(Color.darkEnd)
                        .onTapGesture {
                            print(":: " + quiz.quizName)
                        }
                    }
                }.frame(width: screenWidth, height: screenHeight * 0.4, alignment: .center)
                
                Divider()
                Spacer()
            }.padding(.top, 28)
            
            
            
            
            
            
        }.edgesIgnoringSafeArea(.all)
        
        
        
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
