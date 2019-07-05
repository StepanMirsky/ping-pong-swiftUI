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
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerViewController>) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.delegate = delegate
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerViewController>) {
    }
    
    typealias UIViewControllerType = UIImagePickerController
    

    
}



struct ImagePickerView: View {
    let delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate //= Coordinator1()
    
    var body: some View {
        ImagePickerViewController(delegate: delegate)
        
    }
    
}
