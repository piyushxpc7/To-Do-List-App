//
//  NoView.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import SwiftUI

struct NoView: View {
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack{
                Text("No Viewssss!!!")
                    .font(.title
                    )
                    .fontWeight(.semibold)
                Text("Are you a Productive Guy?Start by Adding Tasks...")
                    .padding(.bottom,20)
                NavigationLink(destination: AddView(), label:{ Text("Add Something..")})
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(animate ? Color.pink.opacity(0.6) : Color.accentColor )
                    .cornerRadius(10)
                    .padding(.horizontal,animate ? 30 : 50)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7:0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .shadow(radius: 10)
                .onAppear(perform: addAnimation)
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView{
        NoView()
            .navigationTitle("Hello")
    }
}
