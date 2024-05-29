//
//  CameraView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-20.
//

import SwiftUI

struct ScanCameraView: View {
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false

    var body: some View {
        ZStack {
            if capturedImage != nil {
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else {
                Color(UIColor.systemBackground)
            }
            
            VStack {
                Spacer()
                Button(action: {
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    CameraBtn(color: .black)
                })
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    CustomCameraView(capturedImage: $capturedImage)
                })
            }
        }
    }
}

struct CameraBtn: View {
    let color: Color
    var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(0.8))
                .frame(width: 65, height: 65)

            Circle()
                .stroke(color, lineWidth: 2)
                .frame(width: 75, height: 75)
        }
    }
}
#Preview {
    ScanCameraView()
}
