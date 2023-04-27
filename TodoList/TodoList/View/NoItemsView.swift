//
//  NoItemsView.swift
//  TodoList
//
//  Created by Ajinkya Adole on 26/04/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    
    let primaryColor = Color("PrimaryColor")
    let secondaryColor = Color("SecondaryColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No ITems")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Add your Todo List for today!! Lets do some productive... ")
                    .padding(.bottom , 30)
                NavigationLink(destination: AddView()) {
                    Text("Add New Task.")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? primaryColor : secondaryColor)
                        .cornerRadius(10)
                    
                }
                .padding(.horizontal , animate ? 30 : 60)
                .shadow(color: animate ? primaryColor.opacity(0.7) : secondaryColor.opacity(0.7),
                        radius:animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30.0 )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(44)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
    
    func addAnimation() {
        guard !animate else {  return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}
