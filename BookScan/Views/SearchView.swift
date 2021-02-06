//
//  SearchView.swift
//  BookScan
//
//  Created by Zed on 5/2/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchTerm: String = ""
    @State private var isEditing = false
    @State var searchEnterPressed: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: search icon and clear/cancel button
    fileprivate func SearchBarOverlay() -> some View {
        return HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 55)
            
            if self.isEditing {
                Button(action: {
                    self.searchTerm = ""
                }, label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                })
                .padding(.trailing, 45)
            }
        }
    }
    
    fileprivate func SearchBar() -> some View {
        return ZStack {
            TextField("Search", text: $searchTerm, onCommit: {
                // shift view here
                print("enter pressed in text field")
                self.$searchEnterPressed.wrappedValue.toggle()
                
            })
            .multilineTextAlignment(.leading)
            .padding(.leading, 100)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.offWhite)
                        .frame(width: screenWidth * 0.9, height: 50)
                }.frame(width: screenWidth * 0.9, height: 50)
            )
            .onTapGesture {
                self.isEditing = true
            }
            .overlay (
                SearchBarOverlay()
            )
            
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.darkEnd
            VStack {
                HStack {
                    Spacer()
                    Text("Search for a book")
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
                
                
                SearchBar().padding(.bottom)
                Divider()
                    .frame(width: screenWidth * 0.9)
                    .background(Color.offWhite.opacity(0.3))
                
                Spacer()
            }.padding(.top, 28.0)
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
