//
//  LoginTopView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 23/03/23.
//

import SwiftUI

struct LoginTopView: View {
    var body: some View {
        VStack{
            Image("Login_Top_Image")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 500, alignment: .top)
            Spacer(minLength: 0)
        }
    }
}

struct LoginTopView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTopView()
    }
}
