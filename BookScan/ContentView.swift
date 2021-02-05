//
//  ContentView.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
//

import SwiftUI
// https://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftuihttps://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftui

// Goodreads api deprecated!!! https://www.goodreads.com/topic/show/21788520-api-deprecation
// new api? https://www.librarything.com/services/
// https://openlibrary.org/
// https://developers.google.com/books/docs/v1/getting_started
// the google one has the review feature which is what we need

// setting up environmnet variables
//https://medium.com/flawless-app-stories/environment-variables-in-xcode-a78e07d223eds

//https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui
extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden().animation(.easeIn)
            }
        } else {
            self
        }
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let darkEnd = Color(red: 23 / 255, green: 23 / 255, blue: 27 / 255)
}
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}



struct ContentView: View {
//    @State private var showCaptureImageView: Bool = false
//    @State private var image: Image?
    /*
     Background of view is a cascading list of blurred book covers
     10-20 covers and they just loop as they scroll down or fasde in and out
     camera button is positioned in the center or down the bottom in the center
     photo is taken and
     */
    
    @State private var menuSelected: Bool = false
    
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
//            .padding()
        }
    }
    
    
    //MARK: Side menu
    fileprivate func SideMenu() -> some View {
        return ZStack {

            //MARK: Background
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.darkEnd)
                .frame(width: screenWidth * 0.6, height: screenHeight*0.7, alignment: .center )
                
            
            VStack {
                Text("Menu")
                    .foregroundColor(.orange)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Spacer()
                
                Button(action: {
                    self.menuSelected.toggle()
                }, label: {
                    Text("close")
                })
                Button(action: {
                    print("menu")
                }, label: {
                    Text("Button")
                        .foregroundColor(.white)
                })
            }.padding()
        }.frame(width: screenWidth * 0.6, height: screenHeight*0.7, alignment: .center )
    }
    
    var body: some View {
//        ZStack {
//            VStack {
//                Button(action: {
//                    self.showCaptureImageView.toggle()
//                }, label: {
//                    Text("Button")
//                })
//                image?.resizable()
//                    .frame(width: 250, height: 200)
//            }
//            if (showCaptureImageView) {
//                    CaptureImageView(isShown: $showCaptureImageView, image: $image)
//            }
//        }
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
                            self.menuSelected.toggle()
                        }, label: {
                            Image(systemName: "text.justify")
                                .foregroundColor(.orange)
                        })
                        Spacer()
                    }.padding(.leading)
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
                    .frame(width: screenWidth)
                    
                    
                    
                }.frame(width: screenWidth, height: screenHeight*0.7)
                
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
        }.ignoresSafeArea(.all)
        .blur(radius: self.menuSelected ? 6 : 0)
        
        // stick side menu here
        .overlay(
            HStack {
                SideMenu().padding()
                Spacer()
            }
            
            .isHidden(!self.menuSelected, remove: self.menuSelected ? false : true)
            
        )
        
    
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





