//
//  MaterialDesignTextField.swift
//  ATLAS VMS
//
//  Created by Mujtaba Khan on 10/01/23.
//

import SwiftUI
import Combine

struct MaterialDesignTextField: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var ColourValue = Color(.white)
    var body: some View {
        ZStack {
            TextField("", text: $text)
                .padding(6.0)
                //.background(RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                    //.stroke(borderColor, lineWidth: borderWidth))
                .focused($focusField, equals: .textField)
            HStack {
                ZStack {
                    Color(colorScheme == .light ? .white : .black)
                    //Color(PlaceHolderBackgroundColour)
                        .cornerRadius(4.0)
                        .opacity(placeholderBackgroundOpacity)
                    Text(placeholder)
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
        //.frame(width: UIScreen.main.bounds.width - 50, height: 64.0)
    }
    
    private let placeholder: String
    @State private var borderColor = Color.gray
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
         valid: Binding<Bool>) {
        self._text = text
        self.placeholder = placeholder
        self._hint = hint
        self._editing = editing
        self._valid = valid
    }
    
    private func updateBorder() {
        updateBorderColor()
        updateBorderWidth()
        updatePlaceholder()
    }
    
    private func updateBorderColor() {
        //  borderColor = colorScheme == .light ? Color(hex: 0x72787E) : Color(hex: 0x72787E)
        
        if valid {
            borderColor = editing ? colorScheme == .light ? .clear : .clear : colorScheme == .light ? .clear : .clear
        } else if text.isEmpty {
            borderColor = editing ? .clear : colorScheme == .light ? .clear : .clear
        } else {
            borderColor = .clear
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
            placeholderColor = editing ? Color(hex: 0x5A5858) : Color(hex: 0x5A5858)
        } else if text.isEmpty {
            placeholderColor = editing ? Color(hex: 0x5A5858) : Color(hex: 0x5A5858)
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
            placeholderBottomPadding = 34.0
            placeholderLeadingPadding = 8.0
        } else {
            placeholderBottomPadding = 0.0
            placeholderLeadingPadding = 8.0
        }
    }
    
    private enum Field {
        case textField
    }
}

struct MaterialDesignTextField_Previews: PreviewProvider {
    static var previews: some View {
        MaterialDesignTextField(.constant(""), placeholder: "", hint: .constant(""), editing: .constant(false), valid: .constant(false))
    }
}
