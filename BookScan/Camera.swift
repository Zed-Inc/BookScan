//
//  Camera.swift
//  BookScan
//
//  Created by Zed on 5/1/21.
// https://www.iosapptemplates.com/blog/swiftui/photo-camera-swiftui

import Foundation
import SwiftUI


struct CaptureImageView {
    /// MARK: - Properties
        @Binding var isShown: Bool
        @Binding var image: Image?
        
        func makeCoordinator() -> Coordinator {
          return Coordinator(isShown: $isShown, image: $image)
        }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
           let picker = UIImagePickerController()
           picker.delegate = context.coordinator
//            picker.sourceType = .camera // this will use the camera instead of deaulting to the photo library
           return picker
       }
       
       func updateUIViewController(_ uiViewController: UIImagePickerController,
                                   context: UIViewControllerRepresentableContext<CaptureImageView>) {
           
       }
}




