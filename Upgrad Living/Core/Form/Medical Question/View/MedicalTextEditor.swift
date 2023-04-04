//
//  MedicalTextEditor.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 01/04/23.
//

import SwiftUI
import Introspect

struct MedicalTextEditor: View {
    @Binding var textField: String
    var isYesSelect: Bool
    @State private var borderColor = Color(hex: 0xE75798)
    var body: some View {
        VStack(alignment: .leading){
            Text(isYesSelect ? "If yes, please specify in detail" : "If other, please specify in detail")
                .font(.custom(OpenSans_SemiBold, size: 12))
                .foregroundColor(Color(hex: 0x969696))
                .padding(.bottom, 4)
            TextField("", text: $textField)
                .font(.custom(OpenSans_SemiBold, size: 14))
                .frame(width: UIScreen.main.bounds.width - 80, height: 30)
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                )
                .introspectTextField(customize: {
                    (textField) in
                    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
                    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
                    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
                    doneButton.tintColor = .blue
                    toolBar.items = [flexButton, doneButton]
                    toolBar.setItems([flexButton, doneButton], animated: true)
                    textField.inputAccessoryView = toolBar
                })
        }
        .padding(.leading, 40)
        .padding(.top, 8)
     
    }
}

struct MedicalTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MedicalTextEditor(textField: .constant(""), isYesSelect: false)
    }
}