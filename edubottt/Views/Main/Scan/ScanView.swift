//
//  ScanView.swift
//  edubottt
//
//  Created by Mochy on 2024-05-28.
//

import SwiftUI

struct ScanView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                })
                        }
                    }
                }
                else{
                    Text("No scan yet").font(.title)
                }
            }
                .navigationTitle("Scan OCR")
                .navigationBarItems(trailing:  Button(action: {
                    self.showScannerSheet = true
                }, label: {
                    CameraBtn(color: .black)
                })
                .sheet(isPresented: $showScannerSheet, content: {
                    self.makeScannerView()
                })
                )
        }
    }
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
