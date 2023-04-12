//
//  UploadDocumentsView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 10/04/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct UploadDocumentsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @State private var document: InputDoument = InputDoument(input: "")
    @State private var isImporting: Bool = false
    @State private var fileName = ""
    
    @State private var isButtonClick = false
    @State private var isStudentProfile = false
    @Binding var isBackButtonShow: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    if isBackButtonShow{
                        Button {
                            withAnimation() {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Image("back_Button")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(.leading, 20)
                        }
                    }
                    Spacer(minLength: 0)
                    Text("Upload Documents")
                        .font(.custom(OpenSans_SemiBold, size: 18))
                        .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                        .padding(.trailing, 30)
                    Spacer(minLength: 0)
                }
                .padding(.top)
                Divider()
                ScrollView(showsIndicators: false) {
                    Image("Upload_Documents_Top_Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 198, height: 188)
                        .padding(.bottom)
                    VStack{
                        Image(colorScheme == .light ? "Submit_Upload_Document_Light" : "Submit_Upload_Document_Dark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 343, height: 58)
                            .padding(.bottom)
                        VStack{
                            Text("Identity & Address proof")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top)
                            
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

                            HStack{
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: 30, height: 30)
                                Text("Voter ID")
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 100, alignment: .trailing)
                                    .font(.custom(OpenSans_SemiBold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x33333) : Color(hex: 0x333333))
                                Image("Upload_Image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 43, height: 30)
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: 50, height: 30)
                            }
                            .padding(7)
                            .frame(width: UIScreen.main.bounds.width - 80)
                            .background(colorScheme == .light ? Color(hex: 0xFEF0F1, alpha: 1.0) : Color(hex: 0xFEF0F1, alpha: 1.0))
                            .padding(.bottom, 5)
                            
                            HStack{
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: 30, height: 30)
                                Text("Passport")
                                    .font(.custom(OpenSans_SemiBold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x33333) : Color(hex: 0x3333333))
                                    .multilineTextAlignment(.trailing)
                                    .frame(width: 100, alignment: .trailing)
                                Image("Upload_Image")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 43, height: 30)
                                Rectangle()
                                    .fill(.clear)
                                    .frame(width: 50, height: 30)
                            }
                            .padding(7)
                            .frame(width: UIScreen.main.bounds.width - 80)
                            .background(colorScheme == .light ? Color(hex: 0xFEF0F1, alpha: 1.0) : Color(hex: 0xFEF0F1, alpha: 1.0))
                            .padding(.bottom, 15)
                        }
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 15).strokeBorder(Color(hex: 0x00B2BA),
                                                               style: StrokeStyle(lineWidth: 1.0))
                                .padding(.top, -8)
                                .padding(.leading, -15)
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
                        
                        VStack{
                            Text("Passport size photograph*")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top)
                            
                            HStack{
                                Button {
                                    isImporting = true
                                } label: {
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 30, height: 30)
                                    Text("Photo")
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
                            
                            .padding(.bottom, 15)

                        }
                        .background(
                            RoundedRectangle(
                                cornerRadius: 15).strokeBorder(Color(hex: 0x00B2BA),
                                                               style: StrokeStyle(lineWidth: 1.0))
                                .padding(.top, -8)
                                .padding(.leading, -15)
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
                        
                        VStack{
                            Text("Certificate of Medical & Physical fitness by a registered doctor*")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top)
                            
                            HStack{
                                Button {
                                    isImporting = true
                                } label: {
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 30, height: 30)
                                    Text("Certificate")
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
                            
                            .padding(.bottom, 15)
                            //Text(document.input)
//                            .fileImporter(
//                                isPresented: $isImporting,
//                                allowedContentTypes: [.plainText],
//                                allowsMultipleSelection: false
//                            ) { result in
//                                do {
//                                    guard let selectedFile: URL = try result.get().first else { return }
//                                    if selectedFile.startAccessingSecurityScopedResource() {
//                                        guard let input = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
//                                        defer { selectedFile.stopAccessingSecurityScopedResource() }
//                                        document.input = input
//                                    } else {
//                                        // Handle denied access
//                                    }
//                                } catch {
//                                    // Handle failure.
//                                    print("Unable to read file contents")
//                                    print(error.localizedDescription)
//                                }
//                            }
                        }
                        .background(
                            RoundedRectangle(
                                cornerRadius: 15).strokeBorder(Color(hex: 0x00B2BA),
                                                               style: StrokeStyle(lineWidth: 1.0))
                                .padding(.top, -8)
                                .padding(.leading, -15)
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

                        VStack{
                            Text("Passport size photograph*")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0x333333))
                                .padding(.top)
                            
                            HStack{
                                Button {
                                    isImporting = true
                                } label: {
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(width: 30, height: 30)
                                    Text("Photo")
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
                            
                            .padding(.bottom, 25)
                            Text(fileName)
                                .fileImporter(isPresented: $isImporting, allowedContentTypes: [.audio, .pdf]) { result in
                                    do{
                                        let fileUrl = try result.get()
                                        self.fileName = fileUrl.lastPathComponent
                                    }catch{
                                        print("Error reading docs")
                                        print(error.localizedDescription)
                                    }
                                }
                        }
                        .background(
                            RoundedRectangle(
                                cornerRadius: 15).strokeBorder(Color(hex: 0x00B2BA),
                                                               style: StrokeStyle(lineWidth: 1.0))
                                .padding(.top, -8)
                                .padding(.leading, -15)
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
                        
                        NavigationLink(
                            "",
                            destination: StudentProfileView(isBackButtonShow: .constant(true)).navigationBarHidden(true),
                            isActive: $isStudentProfile).isDetailLink(false)
                        VStack(alignment: .center) {
                            DetailsViewBottom(textName: "Next", imageName: "")
                                .padding()
                                .frame(alignment: .center)
                                .onTapGesture {
                                    isButtonClick = true
                                    isStudentProfile = true
                                }
                                .shadow(
                                    color: isButtonClick ? .gray : .clear,
                                    radius: isButtonClick ? 10 : 0,
                                    x: 0,
                                    y: 0
                                )
                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct UploadDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        UploadDocumentsView(isBackButtonShow: .constant(false))
    }
}
