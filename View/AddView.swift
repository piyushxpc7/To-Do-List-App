//
//  AddView.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import SwiftUI

struct AddView: View {
    //POP BACK
    @Environment(\.presentationMode)var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textfield : String = ""
    @State var alertTitle : String = "Must be more than 3 words nigga "
    @State var showalert : Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here",text: $textfield)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: {
                    saveButton()
                }
                       , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
            
 
        }
        .navigationTitle("Add an Item ✍🏻")
        .alert(isPresented: $showalert, content: {
                    Alert(title: Text(alertTitle))
                })
    }
    func saveButton() {
        if approtext(){
            listViewModel.additem(title: textfield)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func approtext() -> Bool{
        if textfield.count < 3 {
            return false
        }
        return true
    }
    
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
