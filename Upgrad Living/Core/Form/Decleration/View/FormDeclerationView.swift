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
    var body: some View {
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
                    Text("1. I am enrolled as a Student of ATLAS and thus eligible to apply for the Student Housing accommodation provided by upGrad. \n\n 2. I shall not be entitled to stay in the Student Housing if I cease to be a Student of ATLAS for any reason whatsoever, and in such event I shall not be entitled to the receive the refund of the Security Deposit, Student Housing Fees or any other amounts paid by me to upGrad.\n\n 3. I have provided true and correct information to the best of my knowledge in this Application for Student Housing or any other document/s submitted by me. In the event upGrad learns about any false or misleading information provided by me in this Application for Student Housing or any other documents submitted by me, I may be asked to leave my accommodation in the Student Housing immediately and I will not receive a refund of any amounts paid by me to upGrad.\n\n 4. I am paying an amount of Rs. 50,000/- (Rupees Fifty Thousand Only) towards Security Deposit on submission of this Application for Student Housing.\n\n 5. In the event my Application for Student Housing is accepted, the full refund of the interest free Security Deposit will be received by me only after the competition of accommodation duration of Semester 1 (one) and Semester 2 (two) i.e, 11 (eleven) months, subject to refund policy as may be prescribed by upGrad from time to time.\n\n 6. In the event my application is rejected, the full refund of Security Deposit will be received as per the timeline prescribed by upGrad, subject to refund policy as may be prescribed by upGrad from time to time.\n\n 7. At the time of filling this Application for Student Housing and executing the Student Housing Agreement with upGrad, the Student Housing in question is under construction and yet to be completed. The proposed date for completion of the construction of the Student Housing is [ ] June 2023, such date is subject to a 1 (one) month grace period.\n\n 8. Pursuant to my Application for Student Housing being accepted by upGrad, I will read through and execute the Student Housing Agreement with upGrad enumerating the conditions of stay in the Student Housing. \n\n 9. Pursuant to the execution of the Student Housing Agreement by and between upGrad and me, the Student Housing Fees shall be paid by me in full for the preferred duration of accommodation as selected by me in Clause III hereinabove.\n\n 10. I will be required to pay the Student Housing Fees in advance for the duration of accommodation I opt to semester wise.\n\n 11. The Student Housing Fees are non-refundable, non-negotiable and may increase or decrease at upGrad’s sole discretion for the duration of my stay.\n\n 12. At the time of execution of the Student Housing Agreement I will be handed over a hard copy / sent a digital copy of the Student’s Handbook and I shall agree to the conditions mentioned therein as part of the application process.\n\n 13. The Student’s Handbook will be updated from time to time at upGrad’s sole discretion and I will abide by all terms and updated terms in the Student’s Handbook in its entirety, and not dispute the same.\n\n 14. I will live in a shared accommodation with other students.\n\n 15. I shall always maintain a friendly and cordial behavior towards everyone.\n\n 16. I shall not smoke, drink alcohol, vape, consume narcotics and psychotropic substances or do or indulge in any illegal or morally repugnant acts or any such other acts in the Student Housing or any other premises of upGrad and adhere to the Student Housing Agreement and the Student’s Handbook.\n\n 17. I shall not create any nuisance in the Student Housing, not do perform or commit any crime, fraud, negligence, wilful misconduct, or any intentional act or omission or any other any acts detrimental to the interest of upGrad or other students or any other person.\n\n 18. I am conscious about the cleanliness and shall maintain the same in my room, the common areas of the Student Housing and its surroundings.\n\n 19. I will not bring or keep any pets or animals in the Student Housing.\n\n 20. I shall switch off the lights, fans, other electrical appliances and/or air conditioner etc. when not in use.\n\n 21. I will abide by the circulars, and notices issued by upGrad from time to time, howsoever communicated.\n\n 22. I have disclosed my entire medical history in this Application for Student Housing and in the medical certificate of the doctor uploaded with this Application for Student Housing.\n\n 23. In the event upGrad learns about any concealment of any relevant medical history or any other requisite information from me, upGrad may initiate necessary action against me, including termination of my accommodation at the Student Housing.\n\n 24. I shall not cause any damage to the premises, building, land, furniture, fixtures of the Student Housing or any other property or services provided to me by upGrad and in the event any such damage is caused by me due to my negligence, mistake, or any act or omission by me, I shall be liable to get the same repaired and shall also bear all costs and expenses towards the same without any recourse to upGrad, upGrad also has the right to forfeit the full Security deposit or deduct such costs from the Security Deposit as may be incurred by upGrad for the damage occurred.\n\n 25. Neither upGrad nor any of its personnel, officers, employees, agents or representatives shall be liable in any way whatsoever for any actions involving me now or in the future.\n\n 26. Failure by me to abide by the terms of this Application for Student Housing, the Student Housing Agreement to be executed by and between upGrad and me and the Student’s Handbook to be received by me at the time of execution of the Student Housing Agreement, I may be asked to leave my accommodation at the Student Housing immediately, and I will not receive a refund of any amounts paid to upGrad.\n\n I , do hereby confirm that I have read and understood the above mentioned declaration and hereby accept to adhere by it.")
                }
                .padding(.horizontal)
                VStack{
                    Button {
                        
                    } label: {
                        Text("I Agree")
                            .frame(width: 250, alignment: .center)
                            .font(.custom(OpenSans_SemiBold, size: 14))
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: 0xEE2C3C),
                                             Color(hex: 0xB20710)],
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .clipShape(Capsule())
                            .padding(.top, 8)
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct FormDeclerationView_Previews: PreviewProvider {
    static var previews: some View {
        FormDeclerationView()
    }
}
