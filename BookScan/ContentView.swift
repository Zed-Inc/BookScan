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

struct ContentView: View {
    @State private var showCaptureImageView: Bool = false
    @State private var image: Image?
    /*
     Background of view is a cascading list of blurred book covers
     10-20 covers and they just loop as they scroll down or fasde in and out
     camera button is positioned in the center or down the bottom in the center
     photo is taken and
     */
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showCaptureImageView.toggle()
                }, label: {
                    Text("Button")
                })
                image?.resizable()
                    .frame(width: 250, height: 200)
            }
            if (showCaptureImageView) {
                    CaptureImageView(isShown: $showCaptureImageView, image: $image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





