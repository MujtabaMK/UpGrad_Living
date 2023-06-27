//
//  StudentDetailsFirstView.swift
//  UpGrad Living
//
//  Created by Mujtaba Khan on 24/06/23.
//

import SwiftUI

struct StudentDetailsFirstView: View {
    @State private var isStudentView = false
    var body: some View {
        NavigationView {
            ZStack{
                Image("Blank_Launch_Screen")
                    .resizable()
                    .scaledToFill()
                LoadingView()
                VStack{
                    NavigationLink(
                        "",
                        destination: StudentDetailsView(getIsEditable: "1").navigationBarHidden(true),
                        isActive: $isStudentView).isDetailLink(false)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
            .onAppear{
                isStudentView = true
            }
        }
    }
}

struct StudentDetailsFirstView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailsFirstView()
    }
}
