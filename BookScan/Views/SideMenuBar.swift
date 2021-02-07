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
            
            Button(action: {
                print("")
            }, label: {
                HStack {
                    Image(systemName: "bookmark")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Wishlist")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }).padding(.top, 100)
            
            Button(action: {
                print("settings")
            }, label: {
                HStack {
                    Image(systemName: "gearshape")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Settings")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }).padding(.top, 30)
            
            
            Button(action: {
                print("about")
            }, label: {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("About")
                        .font(.headline)
                        .foregroundColor(Color.gray)
                        
                }
            }).padding(.top, 30)
            
            
            
            
            Button(action: {
                print("delete")
            }, label: {
                HStack {
                    Image(systemName: "trash")
                        .foregroundColor(.gray)
                        .imageScale(.medium)
                    Text("Clear recently scanned")
                        .font(.body)
                        .foregroundColor(Color.gray)
                        
                }
            }).padding(.top, 70)
            
           
            
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
