//
//  CheckboxField.swift
//  ChatApp
//
//  Created by Madiapps on 18/10/2022.
//

import SwiftUI

struct CheckboxField: View {
    
    // MARK: PROPERTIES
    
    @State var isMarked:Bool = false
    
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    // MARK: INITIALIZATION
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
    ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    // MARK: BODY
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 5) {
                Image(systemName: self.isMarked ? "checkmark.square.fill" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(.custom("Roboto-Regular", size: CGFloat(textSize)))
                    .foregroundColor(.black.opacity(0.8))
                Spacer()
            }
        }
    }
}

struct CheckboxField_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxField(id: "", label: "Checkbox", size: 13, color: .gray, textSize: 11) { _,_  in }
    }
}
