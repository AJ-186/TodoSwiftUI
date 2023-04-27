//
//  AddView.swift
//  TodoList
//
//  Created by Ajinkya Adole on 25/04/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var txtFieldText : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alretTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        
        ScrollView{
            VStack {
                TextField("Type something here...", text: $txtFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                
                Button (action :saveBtnPress , label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                )
                
            }
            .padding(14)
        }
        
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
    
    func saveBtnPress(){
        if txtFieldText.count < 3 {
            alretTitle = "Your New todo is short"
            showAlert.toggle()
        } else {
            listViewModel.addItem(title: txtFieldText.capitalized)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alretTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView {
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
