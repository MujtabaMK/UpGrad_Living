//
//  ParentRoomSuccessView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 19/06/23.
//

import SwiftUI

struct ParentRoomSuccessView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var isHome: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center){
                    
                    ParentRoomSuccessTopView()
                    
                    ParentRoomSuccessMiddleView()
                    
                    VStack(alignment: .center) {
                        DetailsViewBottom(textName: "View booking")
                            .onTapGesture {
                                
                            }
                            .padding(.bottom)
                        Button {
                            isHome = true
                        } label: {
                            Text("Go back home")
                                .underline()
                                .font(.custom(OpenSans_SemiBold, size: 15))
                                .foregroundColor(Color(hex: 0xDE1223))
                        }
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}
