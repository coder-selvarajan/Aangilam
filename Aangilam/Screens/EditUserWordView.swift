//
//  EditUserWordView.swift
//  Aangilam
//
//  Created by Selvarajan on 06/05/22.
//

import SwiftUI

struct EditUserWordView: View {
    @Binding var userWord: UserWord
    @Environment(\.presentationMode) var presentationMode
    
    enum FocusField: Hashable {
        case field
    }
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Your Word Here", text: $userWord.word.toUnwrapped(defaultValue: ""))
                        .font(.title2)
                        .focused($focusedField, equals: .field)
                    
                    VStack(alignment: .leading) {
                        Text("Meaning: ")
                        TextEditor(text: $userWord.meaning.toUnwrapped(defaultValue: ""))
                            .frame(height: 140)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                        
                    }.padding(.vertical, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Sample Sentences: ")
                        TextEditor(text: $userWord.sampleSentence.toUnwrapped(defaultValue: ""))
                            .frame(height: 120)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                        
                    }.padding(.vertical, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Tag: ")
                        TextEditor(text: $userWord.tag.toUnwrapped(defaultValue: ""))
                            .frame(height: 100)
                            .padding(4)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(.gray).opacity(0.5))
                        
                    }.padding(.vertical, 5)
                    
                    Button(action: {
                        userWord.save()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Update Word")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame (height: 55)
                            .frame (maxWidth: .infinity)
                            .background (Color.indigo)
                            .cornerRadius(10)
                    })
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    /// Anything over 0.5 seems to work
                    self.focusedField = .field
                }
            }
        }
    }
}

//struct EditUserWordView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditUserWordView()
//    }
//}
