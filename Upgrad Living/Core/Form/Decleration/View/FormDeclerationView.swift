//
//  FormDeclerationView.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 30/03/23.
//

import SwiftUI

struct FormDeclerationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var borderColor = Color(hex: 0xE75798)
    @StateObject private var submitViewModel = SubmitDocumentaionViewModel()
    @StateObject private var GetViewModel = GetFormViewModel()
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var studentAppID = UserDefaults.standard.string(forKey: "studentAppID")
    
    @State private var alertMessage = String()
    @State private var showingAlert = false
    @State private var AlertShow = String()
    @State private var isAccept = false
    @State private var isSecurityDeposit = false
    
    @State private var isButtonClick = false
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
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
                        Spacer(minLength: 0)
                        Text("Declaration")
                            .font(.custom(OpenSans_SemiBold, size: 18))
                            .foregroundColor(Color(hex: 0x000000))
                            .padding(.trailing, 30)
                        Spacer(minLength: 0)
                    }
                    .padding(.top)
                    Divider()
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading){
                            Text("\n1. I am enrolled as a Student of ATLAS SkillTech University (“ATLAS”) and thus eligible to apply for the Student Housing provided by upGrad.\n\n2. I shall not be entitled to stay in the Student Housing if I cease to be a Student of ATLAS for any reason whatsoever, and in such event I shall not be entitled to the receive the refund of the Security Deposit, Student Housing Service Fees or any other amounts paid by me to upGrad.\n\n3. I shall not be entitled to stay in the Student Housing if I cease to be a Student of ATLAS for any reason whatsoever, and in such event I shall not be entitled to the receive the refund of the Security Deposit, Student Housing Service Fees or any other amounts paid by me to upGrad.\n\n4. I am paying an amount of Rs. 50,000/- (Rupees Fifty Thousand Only) towards interest free Security Deposit on submission of this Application for Student Housing.\n\n5. In the event my Application for Student Housing is accepted, the full refund of the interest free Security Deposit will be received by me only after the completion of the entire duration of 11 (eleven) months i.e. Semester 1 (one) and Semester 2 (two), subject to the refund policy as may be prescribed by upGrad from time to time.\n\n6. In the event my Application for Student Housing is accepted, the full refund of the interest free Security Deposit will be received by me only after the completion of the entire duration of 11 (eleven) months i.e. Semester 1 (one) and Semester 2 (two), subject to the refund policy as may be prescribed by upGrad from time to time.\n\n7. At the time of filling this Application for Student Housing and executing the Student Housing Services Agreement with upGrad, the Student Housing in question is under construction and yet to be completed. The proposed date for completion of the construction of the Student Housing is 30th June 2023, such date is subject to a 1 (one) month grace period.\n\n8. Pursuant to my Application for Student Housing being accepted by upGrad, I will read through and execute the Student Housing Services Agreement with upGrad enumerating the conditions of stay in the Student Housing.\n\n9. Pursuant to the execution of the Student Housing Services Agreement with upGrad, the Student Housing Service Fees shall be paid to confirm the accommodation as selected.\n\n10. The Student Housing Service Fees is to be paid in advance and failure to pay within the notified timeline will result in the Student being asked to leave the Student Housing immediately without refund of any amounts paid to upGrad.\n\n11. The Student Housing Service Fees are non-refundable and non-negotiable.\n\n12. At the time of execution of the Student Housing Services Agreement I will be handed over a digital copy of the Resident Student’s Handbook and I shall agree to and abide by the conditions mentioned therein as part of the application process.\n\n13. The Resident Student’s Handbook will be updated from time to time at upGrad’s sole discretion and I will abide by all terms and updated terms in the Resident Student’s Handbook in its entirety, and not dispute the same.\n\n14. I am aware that I will be living in a shared accommodation with other students.\n\n15. I shall always maintain a friendly and cordial behaviour towards everyone.\n\n16. I shall not smoke, vape, consume alcohol or narcotics and psychotropic substances or do or indulge in any illegal or morally repugnant acts or any such other acts in the Student Housing or any other premises of upGrad and adhere to the Student Housing Services Agreement and the Resident Student’s Handbook.\n\n17. I shall not create any nuisance in the Student Housing, nor perform or commit any crime, fraud, negligence, wilful misconduct, or any intentional act or omission or any other any acts detrimental to the interest of upGrad or other students or any other person including those of ATLAS.\n\n18. I have read and understood the provisions of the UGC Regulations on Curbing the Menace of Ragging in Higher Education Institutions, 2009, as amended from time to time (“Regulations”) as well as the provisions of any other law for the time being in force, and am aware of the prohibition of ragging and the punishments prescribed, both under penal laws as well as under the Regulations and affirm I have not been expelled and/or debarred by any institution and aver that I shall not indulge, actively or passively, in the act or abet the act of ragging and if found guilty of ragging and/or abetting ragging, am liable to be proceeded against under these Regulations or under any penal law or any other law for the time being in force and such action would include but is not limited to my debarment or expulsion.\n\n19. I am conscious about the cleanliness and shall maintain the same in my room, the common areas of the Student Housing and its surroundings.\n\n20. I will not bring or keep any pets or animals in the Student Housing.\n\n21. I shall switch off the lights, fans, other electrical appliances and/or air conditioner etc. when not in use.\n\n22. I will abide by the circulars, and notices issued by upGrad from time to time, howsoever communicated.\n\n23. I have disclosed my entire medical history in this Application for Student Housing and will upload the necessary certificate of medical & physical fitness by a registered doctor prior to signing of the Student Housing Services Agreement.\n\n24. In the event upGrad learns about any concealment of any relevant medical history or any other requisite information from the Student, upGrad may initiate necessary action against the Student, including termination of the Student’s accommodation at the Student Housing which will result in the Student being asked to leave the Student Housing immediately without refund of any amounts paid to upGrad.\n\n25. I shall not cause any damage to the premises, building, land, furniture, fixtures of the Student Housing or any other property or services provided to me by upGrad and in the event any such damage is caused by me due to my negligence, mistake, or any act or omission by me, I shall be liable to get the same repaired and shall also bear all costs and expenses towards the same without any recourse to upGrad, upGrad also has the right to forfeit the full Security Deposit or deduct such costs from the Security Deposit as may be incurred by upGrad for the damage occurred.\n\n26. Neither upGrad nor ATLAS nor any of its personnel, officers, employees, agents or representatives shall be liable in any way whatsoever for any actions involving me now or in the future.\n  27. Failure by me to abide by the terms of this Application for Student Housing, the Student Housing Services Agreement to be executed with upGrad and the Resident Student’s Handbook to be received by me at the time of execution of the Student Housing Services Agreement, I may be asked to leave my accommodation at the Student Housing immediately, and I will not receive a refund of any amounts paid to upGrad.\n\n I , do hereby confirm that I have read and understood the above mentioned declaration and hereby accept to adhere by it.")
                                .padding(.bottom, 20)
                            
                            Button {
                                isAccept.toggle()
                            } label: {
                                HStack{
                                    Image(isAccept ? "Form_Accept" : "Form_Not_Accept")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                    Text("I Accept*")
                                        .font(.custom(OpenSans_SemiBold, size: 14))
                                        .foregroundColor(Color(hex: 0x333333))
                                }
                                .padding(.bottom, 20)
                            }
                        }
                        .padding(.horizontal)
                        VStack{
                            DetailsViewBottom(textName: "Submit", imageName: "")
                                .onTapGesture {
                                    isButtonClick = true
                                    if !isAccept{
                                        alertMessage = "Please Accept"
                                        AlertShow = "0"
                                        showingAlert = true
                                    }else{
                                        if networkMonitor.isConnected{
                                            submitViewModel.fetchLoginDate(
                                                accept: "on",
                                                appId: studentAppID ?? "") { DocumentationData in
                                                    if DocumentationData.status == 1{
                                                        isSecurityDeposit = true
                                                    }else{
                                                        alertMessage = DocumentationData.msg ?? ""
                                                        AlertShow = "0"
                                                        showingAlert = true
                                                    }
                                                }
                                        }else{
                                            alertMessage = "Please Check Your Internet Connection"
                                            showingAlert = true
                                        }
                                    }
                                }
                                .shadow(color: isButtonClick ? .gray : .clear, radius: isButtonClick ? 10 : 0, x: 0, y: 0)
                        }
                        .padding(.bottom)
                        NavigationLink("", destination: SecurityDepositView().navigationBarHidden(true),isActive: $isSecurityDeposit).isDetailLink(false)
                    }
                    if submitViewModel.isLoadingData{
                        LoadingView()
                    }
                    if GetViewModel.isLoadingData{
                        LoadingView()
                    }
                }
            }
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    if AlertShow == "1"{
                        
                    }else{
                        isButtonClick = false
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: delayText)
    }
    private func delayText() {
        // Delay of 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if networkMonitor.isConnected{
                GetViewModel.fetchLoginDate(appId: studentAppID ?? "") { formData in
                    if formData.status == 1{
                        let CheckValue = formData.data?.accept ?? ""
                        if CheckValue == "on"{
                            isAccept = true
                        }else{
                            isAccept = false
                        }
                    }
                }
            }else{
                alertMessage = "Please Check Your Internet Connection"
                showingAlert = true
            }
        }
    }
}

struct FormDeclerationView_Previews: PreviewProvider {
    static var previews: some View {
        FormDeclerationView()
    }
}
