//
//  CameraView.swift
//  Product Finder
//
//  Created by user279679 on 7/16/25.
//

import SwiftUI
import AVFoundation
struct CameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController{
        return CameraViewController()
        
    }
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
}

struct CameraContentView2: View{
    var body: some View{
        CameraView()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CameraView()
}
