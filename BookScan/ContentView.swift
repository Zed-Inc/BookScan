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
        GeometryReader { geometry in
            ZStack {
                MainView(menuSelected: $showMenu)
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





