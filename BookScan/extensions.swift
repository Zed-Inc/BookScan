//
//  extensions.swift
//  BookScan
//
//  Created by Zed on 6/2/21.
//

import Foundation
import SwiftUI



// capture image things??
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



// https://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftuihttps://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftui

// Goodreads api deprecated!!! https://www.goodreads.com/topic/show/21788520-api-deprecation
// new api? https://www.librarything.com/services/
// https://openlibrary.org/
// https://developers.google.com/books/docs/v1/getting_started
// the google one has the review feature which is what we need

// setting up environmnet variables
//https://medium.com/flawless-app-stories/environment-variables-in-xcode-a78e07d223eds

//https://stackoverflow.com/questions/56490250/dynamically-hiding-view-in-swiftui
//extension View {
//
//    /// Hide or show the view based on a boolean value.
//    ///
//    /// Example for visibility:
//    /// ```
//    /// Text("Label")
//    ///     .isHidden(true)
//    /// ```
//    ///
//    /// Example for complete removal:
//    /// ```
//    /// Text("Label")
//    ///     .isHidden(true, remove: true)
//    /// ```
//    ///
//    /// - Parameters:
//    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
//    ///   - remove: Boolean value indicating whether or not to remove the view.
//    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
//        if hidden {
//            if !remove {
//                self.hidden().animation(.easeIn)
//            }
//        } else {
//            self
//        }
//    }
//}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let darkEnd = Color(red: 23 / 255, green: 23 / 255, blue: 27 / 255)
}
extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
