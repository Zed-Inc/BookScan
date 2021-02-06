//
//  SideMenuBar.swift
//  BookScan
//
//  Created by Zed on 6/2/21.
//

import SwiftUI

struct SideMenuBar: View {
    
    @Binding var showMenu: Bool
    
    
    var body: some View {
        VStack(alignment:.leading) {
            
            HStack {
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                    .onTapGesture {
                        withAnimation {
                            self.showMenu = false
                        }
                    }
            }.padding(.top, 100)
            
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("search")
                    .foregroundColor(.gray)
                    .font(.headline)
            }.padding(.top, 30)
            // put other items in here
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 32/255, green: 32/255, blue: 32/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SideMenuBar_Previews: PreviewProvider {
    @State static var i = false
    static var previews: some View {
        SideMenuBar(showMenu: $i)
    }
}
