//
//  BedDetailsShowView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 04/05/23.
//

import SwiftUI

struct BedDetailsShowView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showSheetPopup: Bool
    var getData: [BedDetail]
    var roomName: String
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                }
            }
            Text("You have selected")
            HStack{
                Text(roomName)
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(.white)
                
                Divider()
                    .frame(height: 45)
                
                Text("Triple sharing room")
                    .font(.custom(OpenSans_Bold, size: 16))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: getRect().width - 40, maxHeight: 54)
            .background(Color(hex: 0x79CB8A))
        }
        .interactiveDismissDisabled()
        .onAppear{
            showSheetPopup = true
        }
        .onChange(of: getData) { newValue in
            showSheetPopup = true
        }
    }
}

struct BedDetailsShowView_Previews: PreviewProvider {
    static var previews: some View {
        BedDetailsShowView(showSheetPopup: .constant(false), getData: [], roomName: "")
    }
}
