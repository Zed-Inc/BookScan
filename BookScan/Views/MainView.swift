//
//  MainView.swift
//  BookScan
//
//  Created by Zed on 6/2/21.
//

import SwiftUI

struct MainView: View {
    @Binding var menuSelected: Bool
    
    @State private var searchSelected: Bool = false
    
    
    private let rencentlyScannedBooks = GenerateBooks()
    
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    //MARK: Recently scanned book grid
    fileprivate func BookGrid() -> some View {
        return ScrollView(.vertical, showsIndicators: true) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.rencentlyScannedBooks) { item in
                    ZStack {
                        VStack(spacing: 4) {
                            Image(uiImage: item.bookImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 100)
                            Text(item.bookName)
                                .font(.caption2)
                                .fontWeight(.semibold)
                        }
                    }.padding()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal, 7.0)
        }
    }
    
    
    
    var body: some View {

        ZStack {
            Color.darkEnd
            
            
            VStack(spacing: 10) {
                Spacer().frame(height: screenHeight * 0.04, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //MARK: the menu icon and app name
                HStack {
                    Spacer()
                    
                    Text("BookScan")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                    Spacer()
                        
                }
                .padding()
                .overlay(
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.menuSelected.toggle()
                            }
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.orange)
                        })
                        Spacer()
                    }.padding(.leading, 20)
                ) // the menu icon
                
                
                Spacer()
                
                
                //MARK: Book shelf
                // this is a grid of books that you have recently scanned
                ZStack {
                    // bookshelf background
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.offWhite)
                        .frame(width: screenWidth, height: screenHeight*0.7)
                    
                    VStack {
                        HStack {
                            Text("Recently scanned")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }.padding(.leading, 10)
                          Divider()
                        BookGrid()
                        
//                        Spacer()
                    }.padding()
//                    .frame(width: screenWidth)
                    
                    
                    
                }
//                .frame(width: screenWidth, height: screenHeight*0.7)
                
                Spacer()
                
                HStack(spacing: 60) {
                    Spacer()
                    Button(action: {
                        print("search for a book")
                        self.searchSelected.toggle()
                    }, label: {
                        VStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                            Text("Search")
                                .foregroundColor(.white)
                                .font(.system(.caption, design: .rounded))
                                .fontWeight(.bold)
                                
                        }.frame(width: 50, height: 60)
                    }).sheet(isPresented: $searchSelected, content: {
                        SearchView()
                    })
                    
                    
                    Button(action: {
                        print("capture image")
                    }, label: {
                        VStack {
                           Image(systemName: "camera.viewfinder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            Text("Scan")
                                .font(.system(.caption, design: .rounded))
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }.frame(width: 50, height: 60)
                    })
                    
                    Button(action: {
                        print("do quiz")
                    }, label: {
                        VStack {
                           Image(systemName: "text.book.closed")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            
                            Text("Quiz")
                                .font(.system(.caption, design: . rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    })
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)

        
        
        
        
    
    
    }
}

struct MainView_Previews: PreviewProvider {
    @State static var l = false
    static var previews: some View {
        MainView(menuSelected: $l)
    }
}
