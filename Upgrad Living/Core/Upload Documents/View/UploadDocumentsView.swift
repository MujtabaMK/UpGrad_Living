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
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var verifyViewModel = VerifyDocumentViewModel()
    @StateObject private var ViewModel = GetDocumentViewModel()
    
    @State private var document: InputDoument = InputDoument(input: "")
    @State private var isImporting: Bool = false
    @State private var fileName = ""
    
    @State private var isButtonClick = false
    @State private var isStudentProfile = false
    @Binding var isBackButtonShow: Bool
    @State private var base64PDF = ""
    @State private var callAPI = false
    @State private var showLoader = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    
    @State private var arrDoc = [GetDocument]()
    
    var body: some View {
        NavigationView {
            ZStack{
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
                            .font(.custom(OpenSans_Bold, size: 18))
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
                                ForEach(arrDoc) { document in
                                    UploadDocumentCell(
                                        MainTitle: document.title ?? "",
                                        getDocs: document.docs ?? [],
                                        CallAPI: $callAPI,
                                        CallLoader: $showLoader,
                                        isShowPopup: $showingAlert,
                                        popupMsg: $alertMessage)
                                }
                            }
                            
                            NavigationLink(
                                "",
                                destination: StudentProfileView(isBackButtonShow: .constant(false)).navigationBarHidden(true),
                                isActive: $isStudentProfile).isDetailLink(false)
                            VStack(alignment: .center) {
                                DetailsViewBottom(textName: "Next", imageName: "")
                                    .padding()
                                    .frame(alignment: .center)
                                    .onTapGesture {
                                        if networkMonitor.isConnected{
                                            verifyViewModel.verifyUploadDocument(appId: studentAppID ?? "") { verify in
                                                if verify.status == 1{
                                                    isButtonClick = true
                                                    isStudentProfile = true
                                                }else{
                                                    alertMessage = verify.msg ?? ""
                                                    AlertShow = "0"
                                                    showingAlert = true
                                                }
                                            }
                                        }else{
                                            alertMessage = "Please Check Your Internet Connection"
                                            AlertShow = "0"
                                            showingAlert = true
                                        }
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
                .alert(alertMessage, isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        if callAPI{
                            isButtonClick = false
                            if networkMonitor.isConnected{
                                ViewModel.getUploadDocument(appId: studentAppID ?? "") { document in
                                    if document.status == 1{
                                        arrDoc = document.data ?? []
                                    }else{
                                        alertMessage = document.msg ?? ""
                                        AlertShow = "0"
                                        showingAlert = true
                                    }
                                }
                            }else{
                                alertMessage = "Please Check Your Internet Connection"
                                AlertShow = "0"
                                showingAlert = true
                            }
                        }else{
                            if AlertShow == "1"{
                                
                            }else{
                                isButtonClick = false
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
                if ViewModel.isLoadingData{
                    LoadingView()
                }
                if verifyViewModel.isLoadingData{
                    LoadingView()
                }
                if showLoader{
                    LoadingView()
                }
            }
            .onAppear{
                if networkMonitor.isConnected{
                    ViewModel.getUploadDocument(appId: studentAppID ?? "") { document in
                        if document.status == 1{
                            print(document)
                            
                            arrDoc = document.data ?? []
                            print(document.data ?? [])
                        }else{
                            alertMessage = document.msg ?? ""
                            AlertShow = "0"
                            showingAlert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingAlert = true
                }
            }
        }
    }
}

struct UploadDocumentsView_Previews: PreviewProvider {
    static var previews: some View {
        UploadDocumentsView(isBackButtonShow: .constant(false))
    }
}
