//
//  ContentView.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
//

import SwiftUI




struct ContentView: View {
    
    @State var showMenu = false
    
    
    var body: some View{
//        https://blckbirds.com/post/side-menu-hamburger-menu-in-swiftui/
        
        
        let drag = DragGesture()
                .onEnded {
                    if $0.translation.width < -100 {
                        withAnimation {
                            self.showMenu = false
                        }
                    }
                }
        
        
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                MainView(menuSelected: self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(.move(edge: .leading))
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
//                    .opacity(self.showMenu ? 0.9: 1.0)
                    .blur(radius: self.showMenu ? 0.9 : 0.0)
                    .disabled(self.showMenu ? true : false)
                
                
                if self.showMenu {
                    SideMenuBar(showMenu: $showMenu)
                        .frame(width: geometry.size.width/2)
                        .transition(.move(edge: .leading))
                }
            }.gesture(drag)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





