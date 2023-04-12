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
    
    @State private var isGoingOutCafe = false
    @State private var isGoingOutConcerts = false
    @State private var isGoingOutFestivals = false
    @State private var isGoingOutKaraoke = false
    @State private var isGoingOutStandUp = false
    @State private var isGoingOutTheatre = false
    
    @State private var txtGoingOutCafe = ""
    @State private var txtGoingOutConcerts = ""
    @State private var txtGoingOutFestivals = ""
    @State private var txtGoingOutKaraoke = ""
    @State private var txtGoingOutStandUp = ""
    @State private var txtGoingOutTheatre = ""
    
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
    
    @State private var isFoodVeg = false
    @State private var isFoodNonVeg = false
    @State private var isFoodVegan = false
    
    @State private var txtFoodVeg = ""
    @State private var txtFoodNonVeg = ""
    @State private var txtFoodVegan = ""
    
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
    
    @State private var isButtonClick = false
    
    @Binding var isBackButtonShow: Bool
    
    var body: some View {
        NavigationView {
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
                        .font(.custom(OpenSans_SemiBold, size: 18))
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
                                    }else{
                                        txtCreativityWriting = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Design_Profile", titleName: "Design", isSelect: $isCreativityDesign)
                                .onTapGesture {
                                    isCreativityDesign.toggle()
                                    if isCreativityDesign{
                                        txtCreativityDesign = "Design"
                                    }else{
                                        txtCreativityDesign = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Art_Profile", titleName: "Art", isSelect: $isCreativityArt)
                                .onTapGesture {
                                    isCreativityArt.toggle()
                                    if isCreativityArt{
                                        txtCreativityArt = "Art"
                                    }else{
                                        txtCreativityArt = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Singing_Profile", titleName: "Singing", isSelect: $isCreativitySinging)
                                .onTapGesture {
                                    isCreativitySinging.toggle()
                                    if isCreativitySinging{
                                        txtCreativitySinging = "Singing"
                                    }else{
                                        txtCreativitySinging = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isCreativityDancing)
                                .onTapGesture {
                                    isCreativityDancing.toggle()
                                    if isCreativityDancing{
                                        txtCreativityDancing = "Dancing"
                                    }else{
                                        txtCreativityDancing = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "MakeUp_Profile", titleName: "Make Up", isSelect: $isCreativityMakeUp)
                                .onTapGesture {
                                    isCreativityMakeUp.toggle()
                                    if isCreativityMakeUp{
                                        txtCreativityMakeUp = "Make Up"
                                    }else{
                                        txtCreativityMakeUp = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Banking_Profile", titleName: "Banking", isSelect: $isCreativityBanking)
                                .onTapGesture {
                                    isCreativityBanking.toggle()
                                    if isCreativityBanking{
                                        txtCreativityBanking = "Banking"
                                    }else{
                                        txtCreativityBanking = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isCreativityCooking)
                                .onTapGesture {
                                    isCreativityCooking.toggle()
                                    if isCreativityCooking{
                                        txtCreativityCooking = "Cooking"
                                    }else{
                                        txtCreativityCooking = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Photography_Profile", titleName: "Photography", isSelect: $isCreativityPhotography)
                                .onTapGesture {
                                    isCreativityPhotography.toggle()
                                    if isCreativityPhotography{
                                        txtCreativityPhotography = "Photography"
                                    }else{
                                        txtCreativityPhotography = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Videogarphy_Profile", titleName: "Videography", isSelect: $isCreativityVideography)
                                .onTapGesture {
                                    isCreativityVideography.toggle()
                                    if isCreativityVideography{
                                        txtCreativityVideography = "Videography"
                                    }else{
                                        txtCreativityVideography = ""
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
                                    }else{
                                        txtSportsCircket = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Foodball_Profile", titleName: "Foodball", isSelect: $isSportsFoodball)
                                .onTapGesture {
                                    isSportsFoodball.toggle()
                                    if isSportsFoodball{
                                        txtSportsFoodball = "Foodball"
                                    }else{
                                        txtSportsFoodball = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Athletics_Profile", titleName: "Athletics", isSelect: $isSportsAthletics)
                                .onTapGesture {
                                    isSportsAthletics.toggle()
                                    if isSportsAthletics{
                                        txtSportsAthletics = "Athletics"
                                    }else{
                                        txtSportsAthletics = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Basketball_Profile", titleName: "Basketball", isSelect: $isSportsBasketball)
                                .onTapGesture {
                                    isSportsBasketball.toggle()
                                    if isSportsBasketball{
                                        txtSportsBasketball = "Basketball"
                                    }else{
                                        txtSportsBasketball = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Badminton_Profile", titleName: "Badminton", isSelect: $isSportsBadminton)
                                .onTapGesture {
                                    isSportsBadminton.toggle()
                                    if isSportsBadminton{
                                        txtSportsBadminton = "Badminton"
                                    }else{
                                        txtSportsBadminton = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Swimming_Profile", titleName: "Swimming", isSelect: $isSportsSwimming)
                                .onTapGesture {
                                    isSportsSwimming.toggle()
                                    if isSportsSwimming{
                                        txtSportsSwimming = "Swimming"
                                    }else{
                                        txtSportsSwimming = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Table_Tennis_Profile", titleName: "Table Tennis", isSelect: $isSportsTableTennis)
                                .onTapGesture {
                                    isSportsTableTennis.toggle()
                                    if isSportsTableTennis{
                                        txtSportsTableTennis = "Table Tennis"
                                    }else{
                                        txtSportsTableTennis = ""
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
                                    }else{
                                        txtEntertainmentReading = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Music_Profile", titleName: "Music", isSelect: $isEntertainmentMusic)
                                .onTapGesture {
                                    isEntertainmentMusic.toggle()
                                    if isEntertainmentMusic{
                                        txtEntertainmentMusic = "Music"
                                    }else{
                                        txtEntertainmentMusic = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isEntertainmentDancing)
                                .onTapGesture {
                                    isEntertainmentDancing.toggle()
                                    if isEntertainmentDancing{
                                        txtEntertainmentDancing = "Dancing"
                                    }else{
                                        txtEntertainmentDancing = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "TV_Series_Profile", titleName: "TV Series", isSelect: $isEntertainmentTVSeries)
                                .onTapGesture {
                                    isEntertainmentTVSeries.toggle()
                                    if isEntertainmentTVSeries{
                                        txtEntertainmentTVSeries = "TV Series"
                                    }else{
                                        txtEntertainmentTVSeries = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Films_Profile", titleName: "Films", isSelect: $isEntertainmentFlims)
                                .onTapGesture {
                                    isEntertainmentFlims.toggle()
                                    if isEntertainmentFlims{
                                        txtEntertainmentFlims = "Films"
                                    }else{
                                        txtEntertainmentFlims = ""
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
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Cafe_Profile", titleName: "Cafe hopping", isSelect: $isGoingOutCafe)
                                .onTapGesture {
                                    isGoingOutCafe.toggle()
                                    if isGoingOutCafe{
                                        txtGoingOutCafe = "Cafe hopping"
                                    }else{
                                        txtGoingOutCafe = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Concerts_Profile", titleName: "Concerts", isSelect: $isGoingOutConcerts)
                                .onTapGesture {
                                    isGoingOutConcerts.toggle()
                                    if isGoingOutConcerts{
                                        txtGoingOutConcerts = "Concerts"
                                    }else{
                                        txtGoingOutConcerts = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Festivals_Profile", titleName: "Festivals", isSelect: $isGoingOutFestivals)
                                .onTapGesture {
                                    isGoingOutFestivals.toggle()
                                    if isGoingOutFestivals{
                                        txtGoingOutFestivals = "Festivals"
                                    }else{
                                        txtGoingOutFestivals = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Karaoke_Profile", titleName: "Karaoke", isSelect: $isGoingOutKaraoke)
                                .onTapGesture {
                                    isGoingOutKaraoke.toggle()
                                    if isGoingOutKaraoke{
                                        txtGoingOutKaraoke = "Karaoke"
                                    }else{
                                        txtGoingOutKaraoke = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Stand_Up_Profile", titleName: "Stand Up", isSelect: $isGoingOutStandUp)
                                .onTapGesture {
                                    isGoingOutStandUp.toggle()
                                    if isGoingOutStandUp{
                                        txtGoingOutStandUp = "Stand Up"
                                    }else{
                                        txtGoingOutStandUp = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Theatre_Profile", titleName: "Theatre", isSelect: $isGoingOutTheatre)
                                .onTapGesture {
                                    isGoingOutTheatre.toggle()
                                    if isGoingOutTheatre{
                                        txtGoingOutTheatre = "Theatre"
                                    }else{
                                        txtGoingOutTheatre = ""
                                    }
                                }
                        }
                        .padding(.trailing)
                        LazyVGrid(columns: thwoColumnGrid) {
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Museums_Profile", titleName: "Museums & Galleries", isSelect: $isEntertainmentMusic)
                                .onTapGesture {
                                    isEntertainmentMusic.toggle()
                                    if isEntertainmentMusic{
                                        txtEntertainmentMusic = "Museums & Galleries"
                                    }else{
                                        txtEntertainmentMusic = ""
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
                                    }else{
                                        txtStayingBoardGames = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Video_Game_Profile", titleName: "Video Games", isSelect: $isStayingVideoGames)
                                .onTapGesture {
                                    isStayingVideoGames.toggle()
                                    if isStayingVideoGames{
                                        txtStayingVideoGames = "Video Games"
                                    }else{
                                        txtStayingVideoGames = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Banking_Profile", titleName: "Baking", isSelect: $isStayingBaking)
                                .onTapGesture {
                                    isStayingBaking.toggle()
                                    if isStayingBaking{
                                        txtStayingBaking = "Theatre"
                                    }else{
                                        txtStayingBaking = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isStayingCooking)
                                .onTapGesture {
                                    isStayingCooking.toggle()
                                    if isStayingCooking{
                                        txtStayingCooking = "Cooking"
                                    }else{
                                        txtStayingCooking = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Take_Outs_Profile", titleName: "Take-Outs", isSelect: $isStayingTakeOuts)
                                .onTapGesture {
                                    isStayingTakeOuts.toggle()
                                    if isStayingTakeOuts{
                                        txtStayingTakeOuts = "Take-Outs"
                                    }else{
                                        txtStayingTakeOuts = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Gardening_Profile", titleName: "Gardening", isSelect: $isStayingGardening)
                                .onTapGesture {
                                    isStayingGardening.toggle()
                                    if isStayingGardening{
                                        txtStayingGardening = "Gardening"
                                    }else{
                                        txtStayingGardening = ""
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
                                    }else{
                                        txtFoodVeg = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Non_Veg_Profile", titleName: "Non-vegetarian", isSelect: $isFoodNonVeg)
                                .onTapGesture {
                                    isFoodNonVeg.toggle()
                                    if isFoodNonVeg{
                                        txtFoodNonVeg = "Non-vegetarian"
                                    }else{
                                        txtFoodNonVeg = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Vegan_Profile", titleName: "Vegan", isSelect: $isFoodVegan)
                                .onTapGesture {
                                    isFoodVegan.toggle()
                                    if isFoodVegan{
                                        txtFoodVegan = "Vegan"
                                    }else{
                                        txtFoodVegan = ""
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
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Ambitious_Profile", titleName: "Ambitious", isSelect: $isValuesAmbitious)
                                .onTapGesture {
                                    isValuesAmbitious.toggle()
                                    if isValuesAmbitious{
                                        txtValuesAmbitious = "Ambitious"
                                    }else{
                                        txtValuesAmbitious = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Active_Profile", titleName: "Active", isSelect: $isValuesActive)
                                .onTapGesture {
                                    isValuesActive.toggle()
                                    if isValuesActive{
                                        txtValuesActive = "Active"
                                    }else{
                                        txtValuesActive = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Confidence_Profile", titleName: "Confidence", isSelect: $isValuesConfident)
                                .onTapGesture {
                                    isValuesConfident.toggle()
                                    if isValuesConfident{
                                        txtValuesConfident = "Confidence"
                                    }else{
                                        txtValuesConfident = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Creative_Profile", titleName: "Creative", isSelect: $isValuesCreative)
                                .onTapGesture {
                                    isValuesCreative.toggle()
                                    if isValuesCreative{
                                        txtValuesCreative = "Creative"
                                    }else{
                                        txtValuesCreative = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Empathetic_Profile", titleName: "Empathetic", isSelect: $isValuesEmpathetic)
                                .onTapGesture {
                                    isValuesEmpathetic.toggle()
                                    if isValuesEmpathetic{
                                        txtValuesEmpathetic = "Empathetic"
                                    }else{
                                        txtValuesEmpathetic = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Intelligent_Profile", titleName: "Intelligent", isSelect: $isValuesIntelligent)
                                .onTapGesture {
                                    isValuesIntelligent.toggle()
                                    if isValuesIntelligent{
                                        txtValuesIntelligent = "Intelligent"
                                    }else{
                                        txtValuesIntelligent = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Optimistic_Profile", titleName: "Optimistic", isSelect: $isValuesOptimistic)
                                .onTapGesture {
                                    isValuesOptimistic.toggle()
                                    if isValuesOptimistic{
                                        txtValuesOptimistic = "Optimistic"
                                    }else{
                                        txtValuesOptimistic = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Self_Aware_Profile", titleName: "Self Aware", isSelect: $isValuesSelfAware)
                                .onTapGesture {
                                    isValuesSelfAware.toggle()
                                    if isValuesSelfAware{
                                        txtValuesSelfAware = "Self Aware"
                                    }else{
                                        txtValuesSelfAware = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Family_Oriented_Profile", titleName: "Family Oriented", isSelect: $isValuesFamilyOriented)
                                .onTapGesture {
                                    isValuesFamilyOriented.toggle()
                                    if isValuesFamilyOriented{
                                        txtValuesFamilyOriented = "Family Oriented"
                                    }else{
                                        txtValuesFamilyOriented = ""
                                    }
                                }
                            
                        }
                        .padding(.trailing)
                        LazyVGrid(columns: threeColumnGrid){
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Adventurous_Profile", titleName: "Adventurous", isSelect: $isValuesAdventurous)
                                .onTapGesture {
                                    isValuesAdventurous.toggle()
                                    if isValuesAdventurous{
                                        txtValuesAdventurous = "Adventurous"
                                    }else{
                                        txtValuesAdventurous = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Social_Aware_Profile", titleName: "Social Aware", isSelect: $isValuesSociallyAware)
                                .onTapGesture {
                                    isValuesSociallyAware.toggle()
                                    if isValuesSociallyAware{
                                        txtValuesSociallyAware = "Social Aware"
                                    }else{
                                        txtValuesSociallyAware = ""
                                    }
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Funny_Profile", titleName: "Funny", isSelect: $isValuesFunny)
                                .onTapGesture {
                                    isValuesFunny.toggle()
                                    if isValuesFunny{
                                        txtValuesFunny = "Funny"
                                    }else{
                                        txtValuesFunny = ""
                                    }
                                }
                        }
                        .padding(.trailing)
                        .padding(.bottom, 20)
                    }
                    VStack(alignment: .center) {
                        DetailsViewBottom(textName: "Done", imageName: "Smile_Profile")
                            .padding()
                            .frame(alignment: .center)
                            .onTapGesture {
                                isButtonClick = true
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
            .navigationBarHidden(true)
        }
    }
}

//struct StudentProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentProfileView(isBackButtonShow: .constant(false))
//    }
//}
