//
//  UserIntrestsView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 02/06/23.
//

import SwiftUI

struct UserIntrestsView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject private var viewModelProfile = ProfileInfoViewModel()
    @StateObject private var viewModelPost = ProfileViewModel()
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
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
    @State private var arrCreavityServer: [ProfileCreativity] = []
    
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
    @State private var arrSportsServer: [ProfileSport] = []
    
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
    @State private var arrEntertainmentServer: [ProfileEntertainment] = []
    
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
    @State private var arrGoingOutServer: [ProfileGoingOut] = []
    
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
    @State private var arrStayingInServer: [ProfileStayingIn] = []
    
    @State private var isFoodVeg = false
    @State private var isFoodNonVeg = false
    @State private var isFoodVegan = false
    
    @State private var txtFoodVeg = ""
    @State private var txtFoodNonVeg = ""
    @State private var txtFoodVegan = ""
    @State private var arrFoodAndDrink: [String] = []
    @State private var arrFoodAndDrinkServer: [ProfileFoodAndDrink] = []
    
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
    @State private var arrValuesServer: [ProfileValuesAndTrait] = []
    
    @State private var alertMessage = String()
    @State private var showingalert = false
    @State private var AlertShow = String()
    
    
    @State private var isEditable = false
    
    var body: some View {
        NavigationView {
            ZStack{
                ScrollView(showsIndicators: false) {
                    ZStack{
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
                                Text("My Interests")
                                    .font(.custom(OpenSans_SemiBold, size: 18))
                                    .foregroundColor(colorScheme == .light ? .white : .white)
                                    .padding(.trailing, 30)
                                Spacer(minLength: 0)
                            }
                            Spacer()
                        }
                        .padding(.top, UIDevice.current.hasNotch ? 50 : 20)
                    }
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Refine your list of favourites, preferences and habits")
                                .font(.custom(OpenSans_Bold, size: 16))
                                .foregroundColor(colorScheme == .light ? Color(hex: 0x333333, alpha: 1.0) : Color(hex: 0xFFFFFF, alpha: 0.8))
                            
                            
                            Spacer()
                            
                            Image(isEditable ? "User_Profile_Select" : "User_Profile_UnSelect")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23, height: 24)
                                .onTapGesture {
                                    isEditable.toggle()
                                }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        VStack(alignment: .leading){
                            HStack{
                                Text("Creativity")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                    .padding(.top)
                                
                                Image("User_Profile_Creativity_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 22)
                                    .padding(.top)
                            }
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                // Display the item
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Writing", isSelect: $isCreativityWriting)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Design", isSelect: $isCreativityDesign)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Art", isSelect: $isCreativityArt)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Singing", isSelect: $isCreativitySinging)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Dancing", isSelect: $isCreativityDancing)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Make-Up", isSelect: $isCreativityMakeUp)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Banking", isSelect: $isCreativityBanking)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Cooking", isSelect: $isCreativityCooking)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Photography", isSelect: $isCreativityPhotography)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Videography", isSelect: $isCreativityVideography)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Sports")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Sports_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 23)
                            }
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Circket", isSelect: $isSportsCircket)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Foodball", isSelect: $isSportsFoodball)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Athletics", isSelect: $isSportsAthletics)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Basketball", isSelect: $isSportsBasketball)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1,titleName: "Badminton", isSelect: $isSportsBadminton)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Swimming", isSelect: $isSportsSwimming)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Table Tennis", isSelect: $isSportsTableTennis)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Entertainment")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Entertainment_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 19)
                            }
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Reading", isSelect: $isEntertainmentReading)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Music", isSelect: $isEntertainmentMusic)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Dancing", isSelect: $isEntertainmentDancing)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "TV Series", isSelect: $isEntertainmentTVSeries)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Films", isSelect: $isEntertainmentFlims)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Going out")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Going_out_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 23, height: 22)
                            }
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Cafe-hopping", isSelect: $isGoingOutCafe)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Concerts", isSelect: $isGoingOutConcerts)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Festivals", isSelect: $isGoingOutFestivals)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Karaoke", isSelect: $isGoingOutKaraoke)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Stand-up", isSelect: $isGoingOutStandUp)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Theatre", isSelect: $isGoingOutTheatre)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            LazyVGrid(columns: thwoColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Museums and Galleries", isSelect: $isGoingOutMusems)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                            
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Staying in")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Staying_in_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 16)
                            }
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Board Games", isSelect: $isStayingBoardGames)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Video Games", isSelect: $isStayingVideoGames)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Baking", isSelect: $isStayingBaking)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Cooking", isSelect: $isStayingCooking)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Take-outs", isSelect: $isStayingTakeOuts)
                                    .onTapGesture {
                                        if isEditable{
                                            isStayingTakeOuts.toggle()
                                            if isStayingTakeOuts{
                                                txtStayingTakeOuts = "Take-outs"
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Gardening", isSelect: $isStayingGardening)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Food & Drink")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Food_Drink_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21, height: 23)
                            }
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Vegetarian", isSelect: $isFoodVeg)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Non Vegetarian", isSelect: $isFoodNonVeg)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Vegan", isSelect: $isFoodVegan)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 15)
                            
                            Image("Profile_Seprator")
                                .resizable()
                                .frame(maxWidth: .infinity ,minHeight: 8,maxHeight: 8, alignment: .center)
                                .padding(.bottom, 12)
                        }
                        .padding(.leading)
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Values & Traits")
                                    .font(.custom(OpenSans_Bold, size: 16))
                                    .foregroundColor(colorScheme == .light ? Color(hex: 0x868686) : Color(hex: 0x868686))
                                    .padding(.bottom, 4)
                                
                                Image("User_Profile_Value_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 23)
                            }
                            
                            LazyVGrid(columns: threeColumnGrid) {
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Ambition", isSelect: $isValuesAmbitious)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Being Active", isSelect: $isValuesActive)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Confidence", isSelect: $isValuesConfident)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Creativity", isSelect: $isValuesCreative)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Empathy", isSelect: $isValuesEmpathetic)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Intelligency", isSelect: $isValuesIntelligent)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Positivity", isSelect: $isValuesOptimistic)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Self-awareness", isSelect: $isValuesSelfAware)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Being Family Oriented", isSelect: $isValuesFamilyOriented)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            LazyVGrid(columns: threeColumnGrid){
                                UserProfileCreativity(backgroundColour: Student_Profile1, titleName: "Sense of adventure", isSelect: $isValuesAdventurous)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile2, titleName: "Social awareness", isSelect: $isValuesSociallyAware)
                                    .onTapGesture {
                                        if isEditable{
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
                                    }
                                UserProfileCreativity(backgroundColour: Student_Profile3, titleName: "Sense of humour", isSelect: $isValuesFunny)
                                    .onTapGesture {
                                        if isEditable{
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
                            }
                            .padding(.trailing)
                            .padding(.bottom, 20)
                        }
                        .padding(.leading)
                        if isEditable{
                            VStack(alignment: .center) {
                                HStack{
                                    Spacer()
                                    
                                    DetailsViewBottom(textName: "Update", imageName: "Smile_Profile")
                                        .padding()
                                        .frame(alignment: .center)
                                        .onTapGesture {
                                            if arrCreavity.count == 0{
                                                alertMessage = "Please pick favourites from Creativity"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrSports.count == 0{
                                                alertMessage = "Please pick favourites from Sports"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrEntertainment.count == 0{
                                                alertMessage = "Please pick favourites from Entertainment"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrGoingOut.count == 0{
                                                alertMessage = "Please pick favourites from Going Out"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrStayingIn.count == 0{
                                                alertMessage = "Please pick favourites from Staying In"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrFoodAndDrink.count == 0{
                                                alertMessage = "Please pick favourites from Food & Drink"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else if arrValues.count == 0{
                                                alertMessage = "Please pick favourites from Values & Traits"
                                                AlertShow = "0"
                                                showingalert = true
                                            }else{
                                                if networkMonitor.isConnected{
                                                    viewModelPost.postProfile(appId: studentAppID ?? "",
                                                                              creativity: arrCreavity as NSArray,
                                                                              sports: arrSports as NSArray,
                                                                              entertainment: arrEntertainment as NSArray,
                                                                              goingOut: arrGoingOut as NSArray,
                                                                              stayingIn: arrStayingIn as NSArray,
                                                                              foodAndDrink: arrFoodAndDrink as NSArray,
                                                                              values: arrValues as NSArray) { Profile in
                                                        if Profile.status == 1{
                                                            alertMessage = "Interests Updates Successfully"
                                                            AlertShow = "0"
                                                            showingalert = true
                                                        }else{
                                                            alertMessage = Profile.msg ?? ""
                                                            AlertShow = "0"
                                                            showingalert = true
                                                        }
                                                    }
                                                }else{
                                                    alertMessage = "Please Check Your Internet Connection"
                                                    AlertShow = "0"
                                                    showingalert = true
                                                }
                                            }
                                        }
                                    Spacer()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: getRect().width)
                    .background(colorScheme == .light ? .white : .black)
                    .cornerRadius(15, corners: [.topLeft, .topRight])
                    .offset(y: -80)
                }
                if viewModelPost.isLoadingData{
                    LoadingView()
                }
                if viewModelProfile.isLoadingData{
                    LoadingView()
                }
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
            .onAppear{
                if networkMonitor.isConnected{
                    viewModelProfile.getProfileInfo(appId: studentAppID ?? "") { profile in
                        if profile.status == 1{
                            
                            //Creavity
                            arrCreavityServer = profile.data?.creativity ?? []
                            arrCreavity = arrCreavityServer.map { $0.creativityName ?? ""}
                            checkCreavityArray(creaty: arrCreavity)
                            
                            //Sports
                            arrSportsServer = profile.data?.sports ?? []
                            arrSports = arrSportsServer.map { $0.sportsName ?? "" }
                            checkShortArray(sport: arrSports)
                            
                            //Entertainment
                            arrEntertainmentServer = profile.data?.entertainment ?? []
                            arrEntertainment = arrEntertainmentServer.map { $0.entertainmentName ?? "" }
                            checkEntertainmentArray(entertainment: arrEntertainment)
                            
                            //GoingOut
                            arrGoingOutServer = profile.data?.goingOut ?? []
                            arrGoingOut = arrGoingOutServer.map { $0.goingOutName ?? "" }
                            checkGoingOut(Out: arrGoingOut)
                            
                            //StayingIn
                            arrStayingInServer = profile.data?.stayingIn ?? []
                            arrStayingIn = arrStayingInServer.map { $0.stayingInName ?? "" }
                            checkStayingIn(In: arrStayingIn)
                            
                            //Food & Drink
                            arrFoodAndDrinkServer = profile.data?.foodAndDrink ?? []
                            arrFoodAndDrink = arrFoodAndDrinkServer.map { $0.foodDrinkName ?? "" }
                            checkFoodDrink(Food: arrFoodAndDrink)
                            
                            //Value & Trails
                            arrValuesServer = profile.data?.valuesAndTraits ?? []
                            arrValues = arrValuesServer.map { $0.valuesName ?? "" }
                            checkValue(Value: arrValues)
                            
                        }else{
                            alertMessage = profile.msg ?? ""
                            AlertShow = "0"
                            showingalert = true
                        }
                    }
                }else{
                    alertMessage = "Please Check Your Internet Connection"
                    AlertShow = "0"
                    showingalert = true
                }
            }
            .alert(alertMessage, isPresented: $showingalert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        
                    }
                }
            }
        }
    }
    
    func checkCreavityArray(creaty: [String]){
        if arrCreavity.contains("Writing"){
            isCreativityWriting = true
        }
        if arrCreavity.contains("Design"){
            isCreativityDesign = true
        }
        if arrCreavity.contains("Art"){
            isCreativityArt = true
        }
        if arrCreavity.contains("Singing"){
            isCreativitySinging = true
        }
        if arrCreavity.contains("Dancing"){
            isCreativityDancing = true
        }
        if arrCreavity.contains("Make-Up"){
            isCreativityMakeUp = true
        }
        if arrCreavity.contains("Banking"){
            isCreativityBanking = true
        }
        if arrCreavity.contains("Cooking"){
            isCreativityCooking = true
        }
        if arrCreavity.contains("Photography"){
            isCreativityPhotography = true
        }
        if arrCreavity.contains("Videography"){
            isCreativityVideography = true
        }
    }
    
    func checkShortArray(sport: [String]){
        if arrSports.contains("Circket"){
            isSportsCircket = true
        }
        if arrSports.contains("Foodball"){
            isSportsFoodball = true
        }
        if arrSports.contains("Athletics"){
            isSportsAthletics = true
        }
        if arrSports.contains("Basketball"){
            isSportsBasketball = true
        }
        if arrSports.contains("Badminton"){
            isSportsBadminton = true
        }
        if arrSports.contains("Swimming"){
            isSportsSwimming = true
        }
        if arrSports.contains("Table Tennis"){
            isSportsTableTennis = true
        }
    }
    
    func checkEntertainmentArray(entertainment: [String]){
        if arrEntertainment.contains("Reading"){
            isEntertainmentReading = true
        }
        if arrEntertainment.contains("Music"){
            isEntertainmentMusic = true
        }
        if arrEntertainment.contains("Dancing"){
            isEntertainmentDancing = true
        }
        if arrEntertainment.contains("TV Series"){
            isEntertainmentTVSeries = true
        }
        if arrEntertainment.contains("Films"){
            isEntertainmentFlims = true
        }
    }
    
    func checkGoingOut(Out: [String]){
        if arrGoingOut.contains("Cafe-hopping"){
            isGoingOutCafe = true
        }
        if arrGoingOut.contains("Concerts"){
            isGoingOutConcerts = true
        }
        if arrGoingOut.contains("Festivals"){
            isGoingOutFestivals = true
        }
        if arrGoingOut.contains("Karaoke"){
            isGoingOutKaraoke = true
        }
        if arrGoingOut.contains("Stand-up"){
            isGoingOutStandUp = true
        }
        if arrGoingOut.contains("Theatre"){
            isGoingOutTheatre = true
        }
        if arrGoingOut.contains("Museums and Galleries"){
            isGoingOutMusems = true
        }
    }
    func checkStayingIn(In: [String]){
        if arrStayingIn.contains("Board Games"){
            isStayingBoardGames = true
        }
        if arrStayingIn.contains("Video Games"){
            isStayingVideoGames = true
        }
        if arrStayingIn.contains("Baking"){
            isStayingBaking = true
        }
        if arrStayingIn.contains("Cooking"){
            isStayingCooking = true
        }
        if arrStayingIn.contains("Take-outs"){
            isStayingTakeOuts = true
        }
        if arrStayingIn.contains("Gardening"){
            isStayingGardening = true
        }
    }
    func checkFoodDrink(Food: [String]){
        if arrFoodAndDrink.contains("Vegetarian"){
            isFoodVeg = true
        }
        if arrFoodAndDrink.contains("Non Vegetarian"){
            isFoodNonVeg = true
        }
        if arrFoodAndDrink.contains("Vegan"){
            isFoodVegan = true
        }
    }
    func checkValue(Value: [String]){
        if arrValues.contains("Ambition"){
            isValuesAmbitious = true
        }
        if arrValues.contains("Being Active"){
            isValuesActive = true
        }
        if arrValues.contains("Confidence"){
            isValuesConfident = true
        }
        if arrValues.contains("Creativity"){
            isValuesCreative = true
        }
        if arrValues.contains("Empathy"){
            isValuesEmpathetic = true
        }
        if arrValues.contains("Intelligency"){
            isValuesIntelligent = true
        }
        if arrValues.contains("Positivity"){
            isValuesOptimistic = true
        }
        if arrValues.contains("Self-awareness"){
            isValuesSelfAware = true
        }
        if arrValues.contains("Being Family Oriented"){
            isValuesFamilyOriented = true
        }
        if arrValues.contains("Sense of adventure"){
            isValuesAdventurous = true
        }
        if arrValues.contains("Social awareness"){
            isValuesSociallyAware = true
        }
        if arrValues.contains("Sense of humour"){
            isValuesFunny = true
        }
    }
}

struct UserIntrestsView_Previews: PreviewProvider {
    static var previews: some View {
        UserIntrestsView()
    }
}
