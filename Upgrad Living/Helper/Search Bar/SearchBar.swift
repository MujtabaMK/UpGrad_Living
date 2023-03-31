//
//  SearchBar.swift
//  ATLAS VMS
//
//  Created by Mujtaba Khan on 17/01/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .foregroundColor(Color(.systemGray))
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .keyboardType(.webSearch)
                
                .onTapGesture {
                    self.isEditing = true
                }
//            if isEditing {
//                Button(action: {
//                    self.isEditing = false
//                    self.text = ""
//                    hideKeyboard()
//                }) {
//                    if text.isEmpty{
//                        Text("Cancel")
//                    }else{
//                        Text("Done")
//                    }
//                }
//                .padding(.trailing, 10)
//                .transition(.move(edge: .trailing))
//                .animation(.default)
//            }
            Image("searchlight")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20, height: 20)
                .padding(.trailing, 25)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
