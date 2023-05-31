//
//  SearchBarEvent.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 15/05/23.
//

import SwiftUI

struct SearchBarEvent: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var text: String
    @Binding var isFilterClick: Bool
    @State private var isEditing = true
    var body: some View {
        ZStack(alignment: .trailing) {
            Capsule()
                .fill(colorScheme == .light ? Color(.systemGray6) : .gray)
                .frame(width: getRect().width - 40, height: 50)
                .cornerRadius(12)
                .overlay {
                    HStack(spacing: 3){
                        Image("searchlight")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                            .padding(.leading, 20)
                            .padding(.trailing, 5)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                        
                        Divider()
                            .frame(height: 20)
                        
                        TextField("Search ...", text: $text)
                            .foregroundColor(colorScheme == .light ? .black : .white)
                            .padding(7)
                            .keyboardType(.webSearch)
                            .onTapGesture {
                                self.isEditing = true
                            }
                        
                        Divider()
                            .frame(height: 20)
                        
                        Button {
                            withAnimation {
                                isFilterClick = true
                            }
                        } label: {
                            Image("Filter_Event")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(.trailing, 20)
                                .padding(.leading, 4)
                                .foregroundColor(colorScheme == .light ? .black : .white)
                        }
                    }
                }
        }
    }
}
