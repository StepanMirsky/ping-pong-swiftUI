//
//  ImagePicker.swift
//  PinpongSwiftUI
//
//  Created by Кочетов Сергей Сергеевич on 05/07/2019.
//  Copyright © 2019 Лесников Александр Максимович. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

private struct ImagePickerViewController: UIViewControllerRepresentable {
    var delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    @Binding var dismissed: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerViewController>) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.delegate = delegate
        return pickerController
    }
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerViewController>) {
        if dismissed {
            uiViewController.dismiss(animated: true)
        }
    }
    
    typealias UIViewControllerType = UIImagePickerController
}



struct ImagePickerView: View {
    
    let delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    @Binding var dismissed: Bool
//    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    var body: some View {
        return ImagePickerViewController(delegate: delegate, dismissed: $dismissed)
    }
}
