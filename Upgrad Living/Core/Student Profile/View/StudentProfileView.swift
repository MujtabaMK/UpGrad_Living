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
    
    @State private var isSportsCircket = false
    @State private var isSportsFoodball = false
    @State private var isSportsAthletics = false
    @State private var isSportsBasketball = false
    @State private var isSportsBadminton = false
    @State private var isSportsSwimming = false
    @State private var isSportsTableTennis = false
    
    @State private var isEntertainmentReading = false
    @State private var isEntertainmentMusic = false
    @State private var isEntertainmentDancing = false
    @State private var isEntertainmentTVSeries = false
    @State private var isEntertainmentFlims = false
    
    @State private var isGoingOutCafe = false
    @State private var isGoingOutConcerts = false
    @State private var isGoingOutFestivals = false
    @State private var isGoingOutKaraoke = false
    @State private var isGoingOutStandUp = false
    @State private var isGoingOutTheatre = false
    
    @State private var isStayingBoardGames = false
    @State private var isStayingVideoGames = false
    @State private var isStayingBaking = false
    @State private var isStayingCooking = false
    @State private var isStayingTakeOuts = false
    @State private var isStayingGardening = false
    
    @State private var isFoodVeg = false
    @State private var isFoodNonVeg = false
    @State private var isFoodVegan = false
    
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Design_Profile", titleName: "Design", isSelect: $isCreativityDesign)
                                .onTapGesture {
                                    isCreativityDesign.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Art_Profile", titleName: "Art", isSelect: $isCreativityArt)
                                .onTapGesture {
                                    isCreativityArt.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Singing_Profile", titleName: "Singing", isSelect: $isCreativitySinging)
                                .onTapGesture {
                                    isCreativitySinging.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isCreativityDancing)
                                .onTapGesture {
                                    isCreativityDancing.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "MakeUp_Profile", titleName: "Make Up", isSelect: $isCreativityMakeUp)
                                .onTapGesture {
                                    isCreativityMakeUp.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Banking_Profile", titleName: "Banking", isSelect: $isCreativityBanking)
                                .onTapGesture {
                                    isCreativityBanking.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isCreativityCooking)
                                .onTapGesture {
                                    isCreativityCooking.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Photography_Profile", titleName: "Photography", isSelect: $isCreativityPhotography)
                                .onTapGesture {
                                    isCreativityPhotography.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Videogarphy_Profile", titleName: "Videography", isSelect: $isCreativityVideography)
                                .onTapGesture {
                                    isCreativityVideography.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Foodball_Profile", titleName: "Foodball", isSelect: $isSportsFoodball)
                                .onTapGesture {
                                    isSportsFoodball.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Athletics_Profile", titleName: "Athletics", isSelect: $isSportsAthletics)
                                .onTapGesture {
                                    isSportsAthletics.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Basketball_Profile", titleName: "Basketball", isSelect: $isSportsBasketball)
                                .onTapGesture {
                                    isSportsBasketball.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Badminton_Profile", titleName: "Badminton", isSelect: $isSportsBadminton)
                                .onTapGesture {
                                    isSportsBadminton.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Swimming_Profile", titleName: "Swimming", isSelect: $isSportsSwimming)
                                .onTapGesture {
                                    isSportsSwimming.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Table_Tennis_Profile", titleName: "Table Tennis", isSelect: $isSportsTableTennis)
                                .onTapGesture {
                                    isSportsTableTennis.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Music_Profile", titleName: "Music", isSelect: $isEntertainmentMusic)
                                .onTapGesture {
                                    isEntertainmentMusic.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Dancing_Profile", titleName: "Dancing", isSelect: $isEntertainmentDancing)
                                .onTapGesture {
                                    isEntertainmentDancing.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "TV_Series_Profile", titleName: "TV Series", isSelect: $isEntertainmentTVSeries)
                                .onTapGesture {
                                    isEntertainmentTVSeries.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Films_Profile", titleName: "Films", isSelect: $isEntertainmentFlims)
                                .onTapGesture {
                                    isEntertainmentFlims.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Concerts_Profile", titleName: "Concerts", isSelect: $isGoingOutConcerts)
                                .onTapGesture {
                                    isGoingOutConcerts.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Festivals_Profile", titleName: "Festivals", isSelect: $isGoingOutFestivals)
                                .onTapGesture {
                                    isGoingOutFestivals.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Karaoke_Profile", titleName: "Karaoke", isSelect: $isGoingOutKaraoke)
                                .onTapGesture {
                                    isGoingOutKaraoke.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Stand_Up_Profile", titleName: "Stand Up", isSelect: $isGoingOutStandUp)
                                .onTapGesture {
                                    isGoingOutStandUp.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Theatre_Profile", titleName: "Theatre", isSelect: $isGoingOutTheatre)
                                .onTapGesture {
                                    isGoingOutTheatre.toggle()
                                }
                        }
                        .padding(.trailing)
                        LazyVGrid(columns: thwoColumnGrid) {
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Museums_Profile", titleName: "Museums & Galleries", isSelect: $isEntertainmentMusic)
                                .onTapGesture {
                                    isEntertainmentMusic.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Video_Game_Profile", titleName: "Video Games", isSelect: $isStayingVideoGames)
                                .onTapGesture {
                                    isStayingVideoGames.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Banking_Profile", titleName: "Baking", isSelect: $isStayingBaking)
                                .onTapGesture {
                                    isStayingBaking.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Cooking_Profile", titleName: "Cooking", isSelect: $isStayingCooking)
                                .onTapGesture {
                                    isStayingCooking.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Take_Outs_Profile", titleName: "Take-Outs", isSelect: $isStayingTakeOuts)
                                .onTapGesture {
                                    isStayingTakeOuts.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Gardening_Profile", titleName: "Gardening", isSelect: $isStayingGardening)
                                .onTapGesture {
                                    isStayingGardening.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Non_Veg_Profile", titleName: "Non-vegetarian", isSelect: $isFoodNonVeg)
                                .onTapGesture {
                                    isFoodNonVeg.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Vegan_Profile", titleName: "Vegan", isSelect: $isFoodVegan)
                                .onTapGesture {
                                    isFoodVegan.toggle()
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
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Active_Profile", titleName: "Active", isSelect: $isValuesActive)
                                .onTapGesture {
                                    isValuesActive.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Confidence_Profile", titleName: "Confidence", isSelect: $isValuesConfident)
                                .onTapGesture {
                                    isValuesConfident.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Creative_Profile", titleName: "Creative", isSelect: $isValuesCreative)
                                .onTapGesture {
                                    isValuesCreative.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Empathetic_Profile", titleName: "Empathetic", isSelect: $isValuesEmpathetic)
                                .onTapGesture {
                                    isValuesEmpathetic.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Intelligent_Profile", titleName: "Intelligent", isSelect: $isValuesIntelligent)
                                .onTapGesture {
                                    isValuesIntelligent.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Optimistic_Profile", titleName: "Optimistic", isSelect: $isValuesOptimistic)
                                .onTapGesture {
                                    isValuesOptimistic.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Self_Aware_Profile", titleName: "Self Aware", isSelect: $isValuesSelfAware)
                                .onTapGesture {
                                    isValuesSelfAware.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Family_Oriented_Profile", titleName: "Family Oriented", isSelect: $isValuesFamilyOriented)
                                .onTapGesture {
                                    isValuesFamilyOriented.toggle()
                                }

                        }
                        .padding(.trailing)
                        LazyVGrid(columns: threeColumnGrid){
                            StudentProfileCreativity(backgroundColour: Student_Profile1, imageName: "Adventurous_Profile", titleName: "Adventurous", isSelect: $isValuesAdventurous)
                                .onTapGesture {
                                    isValuesAdventurous.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile2, imageName: "Social_Aware_Profile", titleName: "Social Aware", isSelect: $isValuesSociallyAware)
                                .onTapGesture {
                                    isValuesSociallyAware.toggle()
                                }
                            StudentProfileCreativity(backgroundColour: Student_Profile3, imageName: "Funny_Profile", titleName: "Funny", isSelect: $isValuesFunny)
                                .onTapGesture {
                                    isValuesFunny.toggle()
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
