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
    @StateObject private var viewModel = PostDocumentViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @State private var isImporting: Bool = false
    @State private var fileName = ""
    @State private var base64PDF = ""
    @State private var docName = ""
    @State private var docID = ""
    @State private var documentNameAbbr = ""
    var MainTitle = "Identity & Address proof"
    var getDocs: [Doc]
    
    @Binding var CallAPI: Bool
    @Binding var CallLoader: Bool
    @Binding var isShowPopup: Bool
    @Binding var popupMsg: String
   
    
    var body: some View {
        VStack{
            Text(MainTitle)
                .font(.custom(OpenSans_Bold, size: 16))
                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                .padding(.top)
            ForEach(getDocs) { docs in
                HStack{
                    Button {
                        docName = docs.documentName ?? ""
                        docID = docs.id ?? ""
                        documentNameAbbr = docs.documentNameAbbr ?? ""
                        isImporting = true
                    } label: {
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 30, height: 30)
                        Text(docs.documentNameAbbr ?? "")
                            .font(.custom(OpenSans_SemiBold, size: 16))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x33333) : Color(hex: 0x333333))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 100, alignment: .trailing)
                        Image(docs.status == "1" ? "Uploaded_Image" : "Upload_Image")
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
                .padding(.bottom, 15)
                .fileImporter(isPresented: $isImporting, allowedContentTypes: [.png, .jpeg, .pdf]) { result in
                    CallAPI = false
                    CallLoader = true
                    do{
                        CallAPI = false
                        let fileUrl = try result.get()
                        let NewFileNmae = fileUrl.lastPathComponent
                        let fullNameArr = NewFileNmae.components(separatedBy: ".")
                        if fullNameArr.count > 1{
                            self.fileName = fullNameArr[1]
                        }
                        if fileUrl.startAccessingSecurityScopedResource() {
                            CallAPI = false
                            defer {
                                DispatchQueue.main.async {
                                    CallAPI = false
                                    fileUrl.stopAccessingSecurityScopedResource()
                                }
                            }
                            do {
                                CallAPI = false
                                CallLoader = true
                                let fileData = try Data.init(contentsOf: fileUrl)
                                let array = [UInt8](fileData)
                                print("Image size in bytes:\(array.count)")
                                if array.count < 2168584{
                                    let fileStream:String = fileData.base64EncodedString()
                                    base64PDF = fileStream
                                    viewModel.postUploadDocument(file_name: docName,
                                                                 file_base64: base64PDF,
                                                                 file_ext: fileName,
                                                                 doc_upload_doc_id: docID,
                                                                 appId: studentAppID ?? "") { postDoc in
                                        if postDoc.status == 1{
                                            popupMsg = "\(documentNameAbbr) Upload Successfully"
                                            isShowPopup = true
                                            CallAPI = true
                                            CallLoader = false
                                        }else{
                                            popupMsg = postDoc.msg ?? ""
                                            isShowPopup = true
                                            CallAPI = false
                                            CallLoader = false
                                        }
                                    }
                                }else{
                                    popupMsg = "File Size Should be less than 2MB"
                                    isShowPopup = true
                                    CallAPI = false
                                    CallLoader = false
                                }
                            } catch {
                                CallAPI = false
                                CallLoader = false
                                print("error")
                                print(error.localizedDescription)
                            }
                        }
                    }catch{
                        CallAPI = false
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
        .onAppear{
            CallAPI = false
        }
    }
}

//struct UploadDocumentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadDocumentCell(CallAPI: [], CallLoader: .constant(false), isShowPopup: .constant(false))
//    }
//}
