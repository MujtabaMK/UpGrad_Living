//
//  UserProfileDetailsView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 02/06/23.
//

import SwiftUI

struct UserProfileDetailsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    //
    @State private var bloodGroup = ""
    @State private var DateOfBirth = ""
    @State private var cityName = ""
    @State private var stateName = ""
    @State private var dieatry = ""
    @State private var fatherName = ""
    @State private var fatherMobile = ""
    @State private var fatherEmail = ""
    @State private var motherName = ""
    @State private var motherMobile = ""
    @State private var motherEmail = ""
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false){
                    ZStack(alignment: .top){
                        Image("Home_Top_Background")
                            .resizable()
                            .scaledToFit()
                            .frame(width: getRect().width, height: 290)
                            .padding(.top, -90)
                        VStack{
                            HStack{
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image("back_Button")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding(.leading, 20)
                                }
                                Spacer(minLength: 0)
                                Text("Profile Details")
                                    .font(.custom(OpenSans_SemiBold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Student’s Details")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.top, 30)
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Blood Group")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(bloodGroup)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Date of Birth")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(DateOfBirth)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("City of Permanent Address")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(cityName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("State")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(stateName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Dietary Preference")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(dieatry)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                            }
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Parent’s Details")
                                        .font(.custom(OpenSans_Bold, size: 16))
                                        .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                        .padding(.leading)
                                    Spacer()
                                }
                                .padding(.top, 30)
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Father’s Name")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(fatherName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Father’s Mobile No.")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(fatherMobile)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Father’s Email id")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(fatherEmail)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .accentColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Mother’s Name")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(motherName)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Mother’s Mobile No.")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(motherMobile)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                                
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Text("Mother’s Email id")
                                            .font(.custom(OpenSans_SemiBold, size: 12))
                                            .foregroundColor(colorScheme == .light ? Color(hex: 0x969696) : Color(hex: 0x969696))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Text(motherEmail)
                                            .font(.custom(OpenSans_SemiBold, size: 14))
                                            .accentColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                                            .padding(.leading)
                                        Spacer()
                                    }
                                }
                                .frame(width: getRect().width - 40, height: 75)
                                .background(colorScheme == .light ? Color(hex: 0xFFFAFA) : Color(hex: 0x2E2E2E))
                                .cornerRadius(10)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .strokeBorder(Color(hex: 0xF36773), lineWidth: 1)
                                }
                                .padding(.leading, 20)
                                .padding(.bottom)
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if let data = UserDefaults.standard.data(forKey: "profileInfo") {
                    do {
                        let decoder = JSONDecoder()
                        // Decode Note
                        let notes = try decoder.decode(ProfileInfoModel.self, from: data)
                        print(notes)
                        bloodGroup = notes.data?.profile?.livSBlood ?? ""
                        DateOfBirth = notes.data?.profile?.livSDob ?? ""
                        cityName = notes.data?.profile?.cityName ?? ""
                        stateName = notes.data?.profile?.stateName ?? ""
                        dieatry = notes.data?.profile?.livSDietary ?? ""
                        fatherName = notes.data?.profile?.fathersName ?? ""
                        fatherMobile = notes.data?.profile?.fmob ?? ""
                        fatherEmail = notes.data?.profile?.femail ?? ""
                        motherName = notes.data?.profile?.mothersName ?? ""
                        motherMobile = notes.data?.profile?.mmob ?? ""
                        motherEmail = notes.data?.profile?.memail ?? ""
                        
                    }catch {
                        print("Unable to Decode Notes (\(error))")
                    }
                }
            }
        }
    }
}

struct UserProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileDetailsView()
    }
}
