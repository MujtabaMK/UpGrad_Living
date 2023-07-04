//
//  StudentProfileView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 11/04/23.
//

import SwiftUI

struct StudentProfileView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    @StateObject private var viewModel = ProfileViewModel()
    
    var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var thwoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var oneColumnGrid = [GridItem(.flexible())]
    
    @State private var isCreativityWriting = false
    @State private var isCreativityDesign = false
    @State private var isCreativityArt = false
    @State private var isCreativitySinging = false
    @State private var isCreativityDancing = false
    @State private var isCreativityMakeUp = false
    @State private var isCreativityBanking = false
    @State private var isCreativityCooking = false
    @State private var isCreativityPhotography = false
    @State private var isCreativityVideography = false
    
    @State private var txtCreativityWriting = ""
    @State private var txtCreativityDesign = ""
    @State private var txtCreativityArt = ""
    @State private var txtCreativitySinging = ""
    @State private var txtCreativityDancing = ""
    @State private var txtCreativityMakeUp = ""
    @State private var txtCreativityBanking = ""
    @State private var txtCreativityCooking = ""
    @State private var txtCreativityPhotography = ""
    @State private var txtCreativityVideography = ""
    @State private var arrCreavity: [String] = []
    
    @State private var isSportsCircket = false
    @State private var isSportsFoodball = false
    @State private var isSportsAthletics = false
    @State private var isSportsBasketball = false
    @State private var isSportsBadminton = false
    @State private var isSportsSwimming = false
    @State private var isSportsTableTennis = false
    
    @State private var txtSportsCircket = ""
    @State private var txtSportsFoodball = ""
    @State private var txtSportsAthletics = ""
    @State private var txtSportsBasketball = ""
    @State private var txtSportsBadminton = ""
    @State private var txtSportsSwimming = ""
    @State private var txtSportsTableTennis = ""
    @State private var arrSports: [String] = []
    
    @State private var isEntertainmentReading = false
    @State private var isEntertainmentMusic = false
    @State private var isEntertainmentDancing = false
    @State private var isEntertainmentTVSeries = false
    @State private var isEntertainmentFlims = false
    
    @State private var txtEntertainmentReading = ""
    @State private var txtEntertainmentMusic = ""
    @State private var txtEntertainmentDancing = ""
    @State private var txtEntertainmentTVSeries = ""
    @State private var txtEntertainmentFlims = ""
    @State private var arrEntertainment: [String] = []
    
    @State private var isGoingOutCafe = false
    @State private var isGoingOutConcerts = false
    @State private var isGoingOutFestivals = false
    @State private var isGoingOutKaraoke = false
    @State private var isGoingOutStandUp = false
    @State private var isGoingOutTheatre = false
    @State private var isGoingOutMusems = false
    
    @State private var txtGoingOutCafe = ""
    @State private var txtGoingOutConcerts = ""
    @State private var txtGoingOutFestivals = ""
    @State private var txtGoingOutKaraoke = ""
    @State private var txtGoingOutStandUp = ""
    @State private var txtGoingOutTheatre = ""
    @State private var txtGoingOutMusems = ""
    @State private var arrGoingOut: [String] = []
    
    @State private var isStayingBoardGames = false
    @State private var isStayingVideoGames = false
    @State private var isStayingBaking = false
    @State private var isStayingCooking = false
    @State private var isStayingTakeOuts = false
    @State private var isStayingGardening = false
    
    @State private var txtStayingBoardGames = ""
    @State private var txtStayingVideoGames = ""
    @State private var txtStayingBaking = ""
    @State private var txtStayingCooking = ""
    @State private var txtStayingTakeOuts = ""
    @State private var txtStayingGardening = ""
    @State private var arrStayingIn: [String] = []
    
    @State private var isFoodVeg = false
    @State private var isFoodNonVeg = false
    @State private var isFoodVegan = false
    
    @State private var txtFoodVeg = ""
    @State private var txtFoodNonVeg = ""
    @State private var txtFoodVegan = ""
    @State private var arrFoodAndDrink: [String] = []
    
    @State private var isValuesAmbitious = false
    @State private var isValuesActive = false
    @State private var isValuesConfident = false
    @State private var isValuesCreative = false
    @State private var isValuesEmpathetic = false
    @State private var isValuesIntelligent = false
    @State private var isValuesOptimistic = false
    @State private var isValuesSelfAware = false
    @State private var isValuesFamilyOriented = false
    @State private var isValuesAdventurous = false
    @State private var isValuesSociallyAware = false
    @State private var isValuesFunny = false
    
    @State private var txtValuesAmbitious = ""
    @State private var txtValuesActive = ""
    @State private var txtValuesConfident = ""
    @State private var txtValuesCreative = ""
    @State private var txtValuesEmpathetic = ""
    @State private var txtValuesIntelligent = ""
    @State private var txtValuesOptimistic = ""
    @State private var txtValuesSelfAware = ""
    @State private var txtValuesFamilyOriented = ""
    @State private var txtValuesAdventurous = ""
    @State private var txtValuesSociallyAware = ""
    @State private var txtValuesFunny = ""
    @State private var arrValues: [String] = []
    
    @State private var isButtonClick = false
    
    @Binding var isBackButtonShow: Bool
    
    @State private var isBookingView = false
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
        
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading){
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
                        Text("Student Profile")
                            .font(.custom(OpenSans_Bold, size: 18))
                            .foregroundColor(colorScheme == .light ? Color(hex: 0x000000) : .white)
                            .padding(.trailing, 30)
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    Divider()
                        .padding(.bottom, 20)
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading){
                            HStack{
                                Text("Pick your preferences")
                                    .font(.custom(OpenSans_Bold, size: 20))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x333333) : Color(hex: 0xFFFFFF))
                                Image(colorScheme == .light ? "thumbs_Up_Profile_Light" : "thumbs_Up_Profile_Dark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 44, height: 35)
                            }
                            .padding(.bottom)
                            
                            
                            Text("Creativity")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                // Display the item
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Writing_Profile", titleName: "Writing", isSelect: $isCreativityWriting)
                                    .onTapGesture {
                                        isCreativityWriting.toggle()
                                        if isCreativityWriting{
                                            txtCreativityWriting = "Writing"
                                            arrCreavity.append(txtCreativityWriting)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityWriting = ""
                                            if let index = arrCreavity.firstIndex(of: "Writing")  {
                                                print("Index of \(txtCreativityWriting) is \(index)")
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityWriting) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Design_Profile", titleName: "Design", isSelect: $isCreativityDesign)
                                    .onTapGesture {
                                        isCreativityDesign.toggle()
                                        if isCreativityDesign{
                                            txtCreativityDesign = "Design"
                                            arrCreavity.append(txtCreativityDesign)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityDesign = ""
                                            if let index = arrCreavity.firstIndex(of: "Design")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityDesign) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Art_Profile", titleName: "Art", isSelect: $isCreativityArt)
                                    .onTapGesture {
                                        isCreativityArt.toggle()
                                        if isCreativityArt{
                                            txtCreativityArt = "Art"
                                            arrCreavity.append(txtCreativityArt)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityArt = ""
                                            if let index = arrCreavity.firstIndex(of: "Art")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityArt) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Singing_Profile", titleName: "Singing", isSelect: $isCreativitySinging)
                                    .onTapGesture {
                                        isCreativitySinging.toggle()
                                        if isCreativitySinging{
                                            txtCreativitySinging = "Singing"
                                            arrCreavity.append(txtCreativitySinging)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativitySinging = ""
                                            if let index = arrCreavity.firstIndex(of: "Singing")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativitySinging) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isCreativityDancing)
                                    .onTapGesture {
                                        isCreativityDancing.toggle()
                                        if isCreativityDancing{
                                            txtCreativityDancing = "Dancing"
                                            arrCreavity.append(txtCreativityDancing)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityDancing = ""
                                            if let index = arrCreavity.firstIndex(of: "Dancing")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityDancing) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "MakeUp_Profile", titleName: "Make-Up", isSelect: $isCreativityMakeUp)
                                    .onTapGesture {
                                        isCreativityMakeUp.toggle()
                                        if isCreativityMakeUp{
                                            txtCreativityMakeUp = "Make-Up"
                                            arrCreavity.append(txtCreativityMakeUp)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityMakeUp = ""
                                            if let index = arrCreavity.firstIndex(of: "Make-Up")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityMakeUp) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Banking_Profile", titleName: "Banking", isSelect: $isCreativityBanking)
                                    .onTapGesture {
                                        isCreativityBanking.toggle()
                                        if isCreativityBanking{
                                            txtCreativityBanking = "Banking"
                                            arrCreavity.append(txtCreativityBanking)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityBanking = ""
                                            if let index = arrCreavity.firstIndex(of: "Banking")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityBanking) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isCreativityCooking)
                                    .onTapGesture {
                                        isCreativityCooking.toggle()
                                        if isCreativityCooking{
                                            txtCreativityCooking = "Cooking"
                                            arrCreavity.append(txtCreativityCooking)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityCooking = ""
                                            if let index = arrCreavity.firstIndex(of: "Cooking")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityCooking) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Photography_Profile", titleName: "Photography", isSelect: $isCreativityPhotography)
                                    .onTapGesture {
                                        isCreativityPhotography.toggle()
                                        if isCreativityPhotography{
                                            txtCreativityPhotography = "Photography"
                                            arrCreavity.append(txtCreativityPhotography)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityPhotography = ""
                                            if let index = arrCreavity.firstIndex(of: "Photography")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityPhotography) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Videogarphy_Profile", titleName: "Videography", isSelect: $isCreativityVideography)
                                    .onTapGesture {
                                        isCreativityVideography.toggle()
                                        if isCreativityVideography{
                                            txtCreativityVideography = "Videography"
                                            arrCreavity.append(txtCreativityVideography)
                                            print(arrCreavity)
                                        }else{
                                            txtCreativityVideography = ""
                                            if let index = arrCreavity.firstIndex(of: "Videography")  {
                                                arrCreavity.remove(at: index)
                                                print(arrCreavity)
                                            } else {
                                                print("\(txtCreativityVideography) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        VStack(alignment: .leading) {
                            Text("Sports")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Circket_Profile", titleName: "Circket", isSelect: $isSportsCircket)
                                    .onTapGesture {
                                        isSportsCircket.toggle()
                                        if isSportsCircket{
                                            txtSportsCircket = "Circket"
                                            arrSports.append(txtSportsCircket)
                                            print(arrSports)
                                        }else{
                                            txtSportsCircket = ""
                                            if let index = arrSports.firstIndex(of: "Circket")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsCircket) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Foodball_Profile", titleName: "Foodball", isSelect: $isSportsFoodball)
                                    .onTapGesture {
                                        isSportsFoodball.toggle()
                                        if isSportsFoodball{
                                            txtSportsFoodball = "Foodball"
                                            arrSports.append(txtSportsFoodball)
                                            print(arrSports)
                                        }else{
                                            txtSportsFoodball = ""
                                            if let index = arrSports.firstIndex(of: "Foodball")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsFoodball) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Athletics_Profile", titleName: "Athletics", isSelect: $isSportsAthletics)
                                    .onTapGesture {
                                        isSportsAthletics.toggle()
                                        if isSportsAthletics{
                                            txtSportsAthletics = "Athletics"
                                            arrSports.append(txtSportsAthletics)
                                            print(arrSports)
                                        }else{
                                            txtSportsAthletics = ""
                                            if let index = arrSports.firstIndex(of: "Athletics")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsAthletics) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Basketball_Profile", titleName: "Basketball", isSelect: $isSportsBasketball)
                                    .onTapGesture {
                                        isSportsBasketball.toggle()
                                        if isSportsBasketball{
                                            txtSportsBasketball = "Basketball"
                                            arrSports.append(txtSportsBasketball)
                                            print(arrSports)
                                        }else{
                                            txtSportsBasketball = ""
                                            if let index = arrSports.firstIndex(of: "Basketball")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsBasketball) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Badminton_Profile", titleName: "Badminton", isSelect: $isSportsBadminton)
                                    .onTapGesture {
                                        isSportsBadminton.toggle()
                                        if isSportsBadminton{
                                            txtSportsBadminton = "Badminton"
                                            arrSports.append(txtSportsBadminton)
                                            print(arrSports)
                                        }else{
                                            txtSportsBadminton = ""
                                            if let index = arrSports.firstIndex(of: "Badminton")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsBadminton) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Swimming_Profile", titleName: "Swimming", isSelect: $isSportsSwimming)
                                    .onTapGesture {
                                        isSportsSwimming.toggle()
                                        if isSportsSwimming{
                                            txtSportsSwimming = "Swimming"
                                            arrSports.append(txtSportsSwimming)
                                            print(arrSports)
                                        }else{
                                            txtSportsSwimming = ""
                                            if let index = arrSports.firstIndex(of: "Swimming")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsSwimming) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Table_Tennis_Profile", titleName: "Table Tennis", isSelect: $isSportsTableTennis)
                                    .onTapGesture {
                                        isSportsTableTennis.toggle()
                                        if isSportsTableTennis{
                                            txtSportsTableTennis = "Table Tennis"
                                            arrSports.append(txtSportsTableTennis)
                                            print(arrSports)
                                        }else{
                                            txtSportsTableTennis = ""
                                            if let index = arrSports.firstIndex(of: "Table Tennis")  {
                                                arrSports.remove(at: index)
                                                print(arrSports)
                                            } else {
                                                print("\(txtSportsTableTennis) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        VStack(alignment: .leading) {
                            Text("Entertainment")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Reading_Profile", titleName: "Reading", isSelect: $isEntertainmentReading)
                                    .onTapGesture {
                                        isEntertainmentReading.toggle()
                                        if isEntertainmentReading{
                                            txtEntertainmentReading = "Reading"
                                            arrEntertainment.append(txtEntertainmentReading)
                                            print(arrEntertainment)
                                        }else{
                                            txtEntertainmentReading = ""
                                            if let index = arrEntertainment.firstIndex(of: "Reading")  {
                                                arrEntertainment.remove(at: index)
                                                print(arrEntertainment)
                                            } else {
                                                print("\(txtEntertainmentReading) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Music_Profile", titleName: "Music", isSelect: $isEntertainmentMusic)
                                    .onTapGesture {
                                        isEntertainmentMusic.toggle()
                                        if isEntertainmentMusic{
                                            txtEntertainmentMusic = "Music"
                                            arrEntertainment.append(txtEntertainmentMusic)
                                            print(arrEntertainment)
                                        }else{
                                            txtEntertainmentMusic = ""
                                            if let index = arrEntertainment.firstIndex(of: "Music")  {
                                                arrEntertainment.remove(at: index)
                                                print(arrEntertainment)
                                            } else {
                                                print("\(txtEntertainmentMusic) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isEntertainmentDancing)
                                    .onTapGesture {
                                        isEntertainmentDancing.toggle()
                                        if isEntertainmentDancing{
                                            txtEntertainmentDancing = "Dancing"
                                            arrEntertainment.append(txtEntertainmentDancing)
                                            print(arrEntertainment)
                                        }else{
                                            txtEntertainmentDancing = ""
                                            if let index = arrEntertainment.firstIndex(of: "Dancing")  {
                                                arrEntertainment.remove(at: index)
                                                print(arrEntertainment)
                                            } else {
                                                print("\(txtEntertainmentDancing) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "TV_Series_Profile", titleName: "TV Series", isSelect: $isEntertainmentTVSeries)
                                    .onTapGesture {
                                        isEntertainmentTVSeries.toggle()
                                        if isEntertainmentTVSeries{
                                            txtEntertainmentTVSeries = "TV Series"
                                            arrEntertainment.append(txtEntertainmentTVSeries)
                                            print(arrEntertainment)
                                        }else{
                                            txtEntertainmentTVSeries = ""
                                            if let index = arrEntertainment.firstIndex(of: "TV Series")  {
                                                arrEntertainment.remove(at: index)
                                                print(arrEntertainment)
                                            } else {
                                                print("\(txtEntertainmentTVSeries) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Films_Profile", titleName: "Films", isSelect: $isEntertainmentFlims)
                                    .onTapGesture {
                                        isEntertainmentFlims.toggle()
                                        if isEntertainmentFlims{
                                            txtEntertainmentFlims = "Films"
                                            arrEntertainment.append(txtEntertainmentFlims)
                                            print(arrEntertainment)
                                        }else{
                                            txtEntertainmentFlims = ""
                                            if let index = arrEntertainment.firstIndex(of: "Films")  {
                                                arrEntertainment.remove(at: index)
                                                print(arrEntertainment)
                                            } else {
                                                print("\(txtEntertainmentFlims) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        VStack(alignment: .leading) {
                            Text("Going out")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Cafe_Profile", titleName: "Cafe-hopping", isSelect: $isGoingOutCafe)
                                    .onTapGesture {
                                        isGoingOutCafe.toggle()
                                        if isGoingOutCafe{
                                            txtGoingOutCafe = "Cafe-hopping"
                                            arrGoingOut.append(txtGoingOutCafe)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutCafe = ""
                                            if let index = arrGoingOut.firstIndex(of: "Cafe-hopping")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutCafe) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Concerts_Profile", titleName: "Concerts", isSelect: $isGoingOutConcerts)
                                    .onTapGesture {
                                        isGoingOutConcerts.toggle()
                                        if isGoingOutConcerts{
                                            txtGoingOutConcerts = "Concerts"
                                            arrGoingOut.append(txtGoingOutConcerts)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutConcerts = ""
                                            if let index = arrGoingOut.firstIndex(of: "Concerts")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutConcerts) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Festivals_Profile", titleName: "Festivals", isSelect: $isGoingOutFestivals)
                                    .onTapGesture {
                                        isGoingOutFestivals.toggle()
                                        if isGoingOutFestivals{
                                            txtGoingOutFestivals = "Festivals"
                                            arrGoingOut.append(txtGoingOutFestivals)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutFestivals = ""
                                            if let index = arrGoingOut.firstIndex(of: "Festivals")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutFestivals) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Karaoke_Profile", titleName: "Karaoke", isSelect: $isGoingOutKaraoke)
                                    .onTapGesture {
                                        isGoingOutKaraoke.toggle()
                                        if isGoingOutKaraoke{
                                            txtGoingOutKaraoke = "Karaoke"
                                            arrGoingOut.append(txtGoingOutKaraoke)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutKaraoke = ""
                                            if let index = arrGoingOut.firstIndex(of: "Karaoke")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutKaraoke) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Stand_Up_Profile", titleName: "Stand-up", isSelect: $isGoingOutStandUp)
                                    .onTapGesture {
                                        isGoingOutStandUp.toggle()
                                        if isGoingOutStandUp{
                                            txtGoingOutStandUp = "Stand-up"
                                            arrGoingOut.append(txtGoingOutStandUp)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutStandUp = ""
                                            if let index = arrGoingOut.firstIndex(of: "Stand-up")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutStandUp) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Theatre_Profile", titleName: "Theatre", isSelect: $isGoingOutTheatre)
                                    .onTapGesture {
                                        isGoingOutTheatre.toggle()
                                        if isGoingOutTheatre{
                                            txtGoingOutTheatre = "Theatre"
                                            arrGoingOut.append(txtGoingOutTheatre)
                                            print(arrGoingOut)
                                        }else{
                                            txtGoingOutTheatre = ""
                                            if let index = arrGoingOut.firstIndex(of: "Theatre")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutTheatre) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            LazyVGrid(columns: thwoColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Museums_Profile", titleName: "Museums and Galleries", isSelect: $isGoingOutMusems)
                                    .onTapGesture {
                                        isGoingOutMusems.toggle()
                                        if isGoingOutMusems{
                                            txtGoingOutMusems = "Museums and Galleries"
                                            arrGoingOut.append(txtGoingOutMusems)
                                            print(arrGoingOut)
                                        }else{
                                            txtEntertainmentMusic = ""
                                            if let index = arrGoingOut.firstIndex(of: "Museums and Galleries")  {
                                                arrGoingOut.remove(at: index)
                                                print(arrGoingOut)
                                            } else {
                                                print("\(txtGoingOutMusems) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                            
                        }
                        VStack(alignment: .leading) {
                            Text("Staying in")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Board_Game_Profile", titleName: "Board Games", isSelect: $isStayingBoardGames)
                                    .onTapGesture {
                                        isStayingBoardGames.toggle()
                                        if isStayingBoardGames{
                                            txtStayingBoardGames = "Board Games"
                                            arrStayingIn.append(txtStayingBoardGames)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingBoardGames = ""
                                            if let index = arrStayingIn.firstIndex(of: "Board Games")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingBoardGames) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Video_Game_Profile", titleName: "Video Games", isSelect: $isStayingVideoGames)
                                    .onTapGesture {
                                        isStayingVideoGames.toggle()
                                        if isStayingVideoGames{
                                            txtStayingVideoGames = "Video Games"
                                            arrStayingIn.append(txtStayingVideoGames)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingVideoGames = ""
                                            if let index = arrStayingIn.firstIndex(of: "Video Games")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingVideoGames) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Banking_Profile", titleName: "Baking", isSelect: $isStayingBaking)
                                    .onTapGesture {
                                        isStayingBaking.toggle()
                                        if isStayingBaking{
                                            txtStayingBaking = "Baking"
                                            arrStayingIn.append(txtStayingBaking)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingBaking = ""
                                            if let index = arrStayingIn.firstIndex(of: "Baking")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingBaking) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isStayingCooking)
                                    .onTapGesture {
                                        isStayingCooking.toggle()
                                        if isStayingCooking{
                                            txtStayingCooking = "Cooking"
                                            arrStayingIn.append(txtStayingCooking)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingCooking = ""
                                            if let index = arrStayingIn.firstIndex(of: "Cooking")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingCooking) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Take_Outs_Profile", titleName: "Take-outs", isSelect: $isStayingTakeOuts)
                                    .onTapGesture {
                                        isStayingTakeOuts.toggle()
                                        if isStayingTakeOuts{
                                            txtStayingTakeOuts = "Take-0uts"
                                            arrStayingIn.append(txtStayingTakeOuts)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingTakeOuts = ""
                                            if let index = arrStayingIn.firstIndex(of: "Take-outs")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingTakeOuts) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Gardening_Profile", titleName: "Gardening", isSelect: $isStayingGardening)
                                    .onTapGesture {
                                        isStayingGardening.toggle()
                                        if isStayingGardening{
                                            txtStayingGardening = "Gardening"
                                            arrStayingIn.append(txtStayingGardening)
                                            print(arrStayingIn)
                                        }else{
                                            txtStayingGardening = ""
                                            if let index = arrStayingIn.firstIndex(of: "Gardening")  {
                                                arrStayingIn.remove(at: index)
                                                print(arrStayingIn)
                                            } else {
                                                print("\(txtStayingGardening) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        VStack(alignment: .leading) {
                            Text("Food & Drink")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Vegetarian_Profile", titleName: "Vegetarian", isSelect: $isFoodVeg)
                                    .onTapGesture {
                                        isFoodVeg.toggle()
                                        if isFoodVeg{
                                            txtFoodVeg = "Vegetarian"
                                            arrFoodAndDrink.append(txtFoodVeg)
                                            print(arrFoodAndDrink)
                                        }else{
                                            txtFoodVeg = ""
                                            if let index = arrFoodAndDrink.firstIndex(of: "Vegetarian")  {
                                                arrFoodAndDrink.remove(at: index)
                                                print(arrFoodAndDrink)
                                            } else {
                                                print("\(txtFoodVeg) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Non_Veg_Profile", titleName: "Non Vegetarian", isSelect: $isFoodNonVeg)
                                    .onTapGesture {
                                        isFoodNonVeg.toggle()
                                        if isFoodNonVeg{
                                            txtFoodNonVeg = "Non Vegetarian"
                                            arrFoodAndDrink.append(txtFoodNonVeg)
                                            print(arrFoodAndDrink)
                                        }else{
                                            txtFoodNonVeg = ""
                                            if let index = arrFoodAndDrink.firstIndex(of: "Non Vegetarian")  {
                                                arrFoodAndDrink.remove(at: index)
                                                print(arrFoodAndDrink)
                                            } else {
                                                print("\(txtFoodNonVeg) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Vegan_Profile", titleName: "Vegan", isSelect: $isFoodVegan)
                                    .onTapGesture {
                                        isFoodVegan.toggle()
                                        if isFoodVegan{
                                            txtFoodVegan = "Vegan"
                                            arrFoodAndDrink.append(txtFoodVegan)
                                            print(arrFoodAndDrink)
                                        }else{
                                            txtFoodVegan = ""
                                            if let index = arrFoodAndDrink.firstIndex(of: "Vegan")  {
                                                arrFoodAndDrink.remove(at: index)
                                                print(arrFoodAndDrink)
                                            } else {
                                                print("\(txtFoodVegan) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        VStack(alignment: .leading) {
                            Text("Values & Traits")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                .padding(.bottom, 4)
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Ambitious_Profile", titleName: "Ambition", isSelect: $isValuesAmbitious)
                                    .onTapGesture {
                                        isValuesAmbitious.toggle()
                                        if isValuesAmbitious{
                                            txtValuesAmbitious = "Ambition"
                                            arrValues.append(txtValuesAmbitious)
                                            print(arrValues)
                                        }else{
                                            txtValuesAmbitious = ""
                                            if let index = arrValues.firstIndex(of: "Ambition")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesAmbitious) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Active_Profile", titleName: "Being Active", isSelect: $isValuesActive)
                                    .onTapGesture {
                                        isValuesActive.toggle()
                                        if isValuesActive{
                                            txtValuesActive = "Being Active"
                                            arrValues.append(txtValuesActive)
                                            print(arrValues)
                                        }else{
                                            txtValuesActive = ""
                                            if let index = arrValues.firstIndex(of: "Being Active")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesActive) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Confidence_Profile", titleName: "Confidence", isSelect: $isValuesConfident)
                                    .onTapGesture {
                                        isValuesConfident.toggle()
                                        if isValuesConfident{
                                            txtValuesConfident = "Confidence"
                                            arrValues.append(txtValuesConfident)
                                            print(arrValues)
                                        }else{
                                            txtValuesConfident = ""
                                            if let index = arrValues.firstIndex(of: "Confidence")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesConfident) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Creative_Profile", titleName: "Creativity", isSelect: $isValuesCreative)
                                    .onTapGesture {
                                        isValuesCreative.toggle()
                                        if isValuesCreative{
                                            txtValuesCreative = "Creativity"
                                            arrValues.append(txtValuesCreative)
                                            print(arrValues)
                                        }else{
                                            txtValuesCreative = ""
                                            if let index = arrValues.firstIndex(of: "Creativity")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesCreative) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Empathetic_Profile", titleName: "Empathy", isSelect: $isValuesEmpathetic)
                                    .onTapGesture {
                                        isValuesEmpathetic.toggle()
                                        if isValuesEmpathetic{
                                            txtValuesEmpathetic = "Empathy"
                                            arrValues.append(txtValuesEmpathetic)
                                            print(arrValues)
                                        }else{
                                            txtValuesEmpathetic = ""
                                            if let index = arrValues.firstIndex(of: "Empathy")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesEmpathetic) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Intelligent_Profile", titleName: "Intelligency", isSelect: $isValuesIntelligent)
                                    .onTapGesture {
                                        isValuesIntelligent.toggle()
                                        if isValuesIntelligent{
                                            txtValuesIntelligent = "Intelligency"
                                            arrValues.append(txtValuesIntelligent)
                                            print(arrValues)
                                        }else{
                                            txtValuesIntelligent = ""
                                            if let index = arrValues.firstIndex(of: "Intelligency")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesIntelligent) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Optimistic_Profile", titleName: "Positivity", isSelect: $isValuesOptimistic)
                                    .onTapGesture {
                                        isValuesOptimistic.toggle()
                                        if isValuesOptimistic{
                                            txtValuesOptimistic = "Positivity"
                                            arrValues.append(txtValuesOptimistic)
                                            print(arrValues)
                                        }else{
                                            txtValuesOptimistic = ""
                                            if let index = arrValues.firstIndex(of: "Positivity")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesOptimistic) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Self_Aware_Profile", titleName: "Self-awareness", isSelect: $isValuesSelfAware)
                                    .onTapGesture {
                                        isValuesSelfAware.toggle()
                                        if isValuesSelfAware{
                                            txtValuesSelfAware = "Self-awareness"
                                            arrValues.append(txtValuesSelfAware)
                                            print(arrValues)
                                        }else{
                                            txtValuesSelfAware = ""
                                            if let index = arrValues.firstIndex(of: "Self-awareness")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesSelfAware) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Family_Oriented_Profile", titleName: "Being Family Oriented", isSelect: $isValuesFamilyOriented)
                                    .onTapGesture {
                                        isValuesFamilyOriented.toggle()
                                        if isValuesFamilyOriented{
                                            txtValuesFamilyOriented = "Being Family Oriented"
                                            arrValues.append(txtValuesFamilyOriented)
                                            print(arrValues)
                                        }else{
                                            txtValuesFamilyOriented = ""
                                            if let index = arrValues.firstIndex(of: "Being Family Oriented")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesFamilyOriented) is not in the list")
                                            }
                                        }
                                    }
                                
                            }
                            .padding(.trailing)
                            LazyVGrid(columns: threeColumnGrid){
                                StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Adventurous_Profile", titleName: "Sense of adventure", isSelect: $isValuesAdventurous)
                                    .onTapGesture {
                                        isValuesAdventurous.toggle()
                                        if isValuesAdventurous{
                                            txtValuesAdventurous = "Sense of adventure"
                                            arrValues.append(txtValuesAdventurous)
                                            print(arrValues)
                                        }else{
                                            txtValuesAdventurous = ""
                                            if let index = arrValues.firstIndex(of: "Sense of adventure")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesAdventurous) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Social_Aware_Profile", titleName: "Social awareness", isSelect: $isValuesSociallyAware)
                                    .onTapGesture {
                                        isValuesSociallyAware.toggle()
                                        if isValuesSociallyAware{
                                            txtValuesSociallyAware = "Social awareness"
                                            arrValues.append(txtValuesSociallyAware)
                                            print(arrValues)
                                        }else{
                                            txtValuesSociallyAware = ""
                                            if let index = arrValues.firstIndex(of: "Social awareness")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesSociallyAware) is not in the list")
                                            }
                                        }
                                    }
                                StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Funny_Profile", titleName: "Sense of humour", isSelect: $isValuesFunny)
                                    .onTapGesture {
                                        isValuesFunny.toggle()
                                        if isValuesFunny{
                                            txtValuesFunny = "Sense of humour"
                                            arrValues.append(txtValuesFunny)
                                            print(arrValues)
                                        }else{
                                            txtValuesFunny = ""
                                            if let index = arrValues.firstIndex(of: "Sense of humour")  {
                                                arrValues.remove(at: index)
                                                print(arrValues)
                                            } else {
                                                print("\(txtValuesFunny) is not in the list")
                                            }
                                        }
                                    }
                            }
                            .padding(.trailing)
                            .padding(.bottom, 20)
                        }
                        NavigationLink(
                            "",
                            destination: BookingView().navigationBarHidden(true),
                            isActive: $isBookingView).isDetailLink(false)
                        VStack(alignment: .center) {
                            DetailsViewBottom(textName: "Done", imageName: "Smile_Profile")
                                .padding()
                                .padding(.trailing)
                                .frame(alignment: .center)
                                .onTapGesture {
                                    if arrCreavity.count == 0{
                                        alertMessage = "Please pick favourites from Creativity"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrSports.count == 0{
                                        alertMessage = "Please pick favourites from Sports"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrEntertainment.count == 0{
                                        alertMessage = "Please pick favourites from Entertainment"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrGoingOut.count == 0{
                                        alertMessage = "Please pick favourites from Going Out"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrStayingIn.count == 0{
                                        alertMessage = "Please pick favourites from Staying In"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrFoodAndDrink.count == 0{
                                        alertMessage = "Please pick favourites from Food & Drink"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else if arrValues.count == 0{
                                        alertMessage = "Please pick favourites from Values & Traits"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else{
                                        if networkMonitor.isConnected{
                                            viewModel.postProfile(appId: studentAppID ?? "",
                                                                  creativity: arrCreavity as NSArray,
                                                                  sports: arrSports as NSArray,
                                                                  entertainment: arrEntertainment as NSArray,
                                                                  goingOut: arrGoingOut as NSArray,
                                                                  stayingIn: arrStayingIn as NSArray,
                                                                  foodAndDrink: arrFoodAndDrink as NSArray,
                                                                  values: arrValues as NSArray) { Profile in
                                                if Profile.status == 1{
                                                    alertMessage = Profile.msg ?? ""
                                                    AlertShow = "1"
                                                    showingAlert = true
                                                }else{
                                                    alertMessage = Profile.msg ?? ""
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
                .padding(.leading, 25)
                if viewModel.isLoadingData{
                    LoadingView()
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        isButtonClick = true
                        isBookingView = true
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

//struct StudentProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentProfileView(isBackButtonShow: .constant(false))
//    }
//}
