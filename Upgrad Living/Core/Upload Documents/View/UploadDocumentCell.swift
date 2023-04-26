//
//  UploadDocumentCell.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 26/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct UploadDocumentCell: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var document: InputDoument = InputDoument(input: "")
    @State private var isImporting: Bool = false
    @State private var fileName = ""
    
    @State private var base64PDF = ""
    
    var MainTitle = "Identity & Address proof"
    
    var body: some View {
        VStack{
            Text(MainTitle)
                .font(.custom(OpenSans_Bold, size: 16))
                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                .padding(.top)
            ForEach(1...5, id: \.self) { index in
                HStack{
                    Button {
                        isImporting = true
                    } label: {
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 30, height: 30)
                        Text("Aadhar Card")
                            .font(.custom(OpenSans_SemiBold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x33333) : Color(hex: 0x333333))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100, alignment: .trailing)
                        Image("Upload_Image")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 43, height: 30, alignment: .leading)
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 50, height: 30)
                    }
                }
                .padding(7)
                .frame(width: UIScreen.main.bounds.width - 80)
                .background(colorScheme == .light ? Color(hex: 0xFEF0F1, alpha: 1.0) : Color(hex: 0xFEF0F1, alpha: 1.0))
                .padding(.bottom, 5)
                .fileImporter(isPresented: $isImporting, allowedContentTypes: [.png,.jpeg, .pdf]) { result in
                    do{
                        let fileUrl = try result.get()
                        self.fileName = fileUrl.lastPathComponent
                        print(fileUrl)
                        if fileUrl.startAccessingSecurityScopedResource() {
                            defer {
                                DispatchQueue.main.async {
                                    fileUrl.stopAccessingSecurityScopedResource()
                                }
                            }
                            do {
                                let fileData = try Data.init(contentsOf: fileUrl)
                                let fileStream:String = fileData.base64EncodedString()
                                print(fileStream)
                                base64PDF = fileStream
                                print(base64PDF)
                                
                            } catch {
                                print("error")
                                print(error.localizedDescription)
                            }
                        }
                    }catch{
                        print("Error reading docs")
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(
                cornerRadius: 15).strokeBorder(Color(hex: 0x00B2BA),
                                               style: StrokeStyle(lineWidth: 1.0))
                .padding(.top, -10)
                .padding(.leading, -25)
                .padding(.trailing, -10)
                .padding(.bottom, 5)
        )
        .frame(width: UIScreen.main.bounds.width - 80)
        //.background(colorScheme == .light ? Color(hex: 0xFDE1E3, alpha: 1.0) : Color(hex: 0xFDE1E3, alpha: 1.0))
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(colorScheme == .light ? Color(hex: 0xFDE1E3, alpha: 1.0) : Color(hex: 0xFDE1E3, alpha: 1.0))
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
        )
        .padding(.bottom)
    }
}

struct UploadDocumentCell_Previews: PreviewProvider {
    static var previews: some View {
        UploadDocumentCell()
    }
}
