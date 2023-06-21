//
//  MaterialDesignTextFieldDOB.swift
//  Upgrad Living
//
//  Created by Mujtaba Khan on 29/03/23.
//

import SwiftUI
import Combine

struct MaterialDesignTextFieldDOB: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var ColourValue = Color(.white)
    @Binding var BorderColor: Color
    @Binding var placeholderImage: String
    var body: some View {
        ZStack {
            HStack{
                TextField("", text: $text)
                    .focused($focusField, equals: .textField)
                    .font(.custom(OpenSans_SemiBold, size: 12))
                Spacer()
                Image(placeholderImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            
            HStack {
                ZStack {
                    Color(colorScheme == .light ? .white : .black)
                        .cornerRadius(4.0)
                        .opacity(placeholderBackgroundOpacity)
                    Text(placeholder)
                        .font(.custom(OpenSans_SemiBold, size: 10))
                        .foregroundColor(.white)
                        .colorMultiply(placeholderColor)
                        .animatableFont(size: placeholderFontSize)
                        .padding(2.0)
                        .layoutPriority(1)
                }
                .padding([.leading], placeholderLeadingPadding)
                .padding([.bottom], placeholderBottomPadding)
                Spacer()
            }
            //            HStack {
            //                VStack {
            //                    Spacer()
            //                    Text(hint)
            //                        .font(.system(size: 10.0))
            //                        .foregroundColor(.gray)
            //                        .padding([.leading], 10.0)
            //                }
            //                Spacer()
            //            }
        }
        .onChange(of: editing) {
            focusField = $0 ? .textField : nil
            withAnimation(.easeOut(duration: 0.1)) {
                updateBorder()
                updatePlaceholder()
            }
        }
        .onReceive(Just(editing), perform: { newValue in
            withAnimation(.easeOut(duration: 0.1)) {
                updateBorder()
                updatePlaceholder()
            }
        })
    }
    
    private let placeholder: String
    @State private var borderColor = Color.white
    @State private var borderWidth = 1.0
    @Binding private var editing: Bool
    @FocusState private var focusField: Field?
    @Binding private var hint: String
    @State private var placeholderBackgroundOpacity = 0.0
    @State private var placeholderBottomPadding = 0.0
    @State private var placeholderColor = Color.gray
    @State private var placeholderFontSize = 16.0
    @State private var placeholderLeadingPadding = 2.0
    @Binding private var text: String
    @Binding private var valid: Bool
    
    init(_ text: Binding<String>,
         placeholder: String,
         hint: Binding<String>,
         editing: Binding<Bool>,
         valid: Binding<Bool>,
         BorderColor: Binding<Color>,
         placeholderImage: Binding<String>) {
        self._text = text
        self.placeholder = placeholder
        self._hint = hint
        self._editing = editing
        self._valid = valid
        self._BorderColor = BorderColor
        self._placeholderImage = placeholderImage
    }
    
    private func updateBorder() {
        updateBorderColor()
        updateBorderWidth()
        updatePlaceholder()
    }
    
    private func updateBorderColor() {
        //  borderColor = colorScheme == .light ? Color(hex: 0x72787E) : Color(hex: 0x72787E)
        
        if valid {
            borderColor = editing ? BorderColor : BorderColor
        } else if text.isEmpty {
            borderColor = editing ? BorderColor : BorderColor
        } else {
            borderColor = BorderColor
        }
    }
    
    private func updateBorderWidth() {
        borderWidth = editing ? 2.0 : 1.0
    }
    
    private func updatePlaceholder() {
        updatePlaceholderBackground()
        updatePlaceholderColor()
        updatePlaceholderFontSize()
        updatePlaceholderPosition()
    }
    
    private func updatePlaceholderBackground() {
        if editing || !text.isEmpty {
            placeholderBackgroundOpacity = 1.0
        } else {
            placeholderBackgroundOpacity = 0.0
        }
    }
    
    private func updatePlaceholderColor() {
        if valid {
            placeholderColor = editing ? colorScheme == .light ? Color(hex: 0x5A5858) : Color(hex: 0xFFFFFF) : colorScheme == .light ? Color(hex: 0x5A5858) : Color(hex: 0xFFFFFF)
        } else if text.isEmpty {
            placeholderColor = editing ? colorScheme == .light ? Color(hex: 0x5A5858) : Color(hex: 0xFFFFFF) : colorScheme == .light ? Color(hex: 0x5A5858) : Color(hex: 0xFFFFFF)
        } else {
            placeholderColor = Color(hex: 0x5A5858)
        }
    }
    
    private func updatePlaceholderFontSize() {
        if !text.isEmpty {
            placeholderFontSize = 10.0
        } else {
            placeholderFontSize = 16.0
        }
    }
    
    private func updatePlaceholderPosition() {
        if  !text.isEmpty {
            placeholderBottomPadding = 52.0
            placeholderLeadingPadding = 15.0
        } else {
            placeholderBottomPadding = 0.0
            placeholderLeadingPadding = 15.0
        }
    }
    
    private enum Field {
        case textField
    }
}

//struct MaterialDesignTextFieldDOB_Previews: PreviewProvider {
//    static var previews: some View {
//        MaterialDesignTextFieldDOB(<#Binding<String>#>, placeholder: <#String#>, hint: <#Binding<String>#>, editing: <#Binding<Bool>#>, valid: <#Binding<Bool>#>, BorderColor: <#Binding<Color>#>, placeholderImage: <#Binding<String>#>)
//    }
//}
