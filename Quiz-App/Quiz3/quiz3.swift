//
//  quiz3.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import SwiftUI

struct quiz3: View {
    
    @State private var randomNum = 1
    @State private var randomNum2 = 2
    @State private var score = 0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Matching Quiz")
                    .font(.largeTitle)
                    .padding(.top, 50.0)
                Spacer()
                HStack{
                    HStack{
                        Spacer()
                        Image("quiz" + String(randomNum))
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 140, height: 140)
                        Spacer()
                        Image("ans" + String(randomNum2))
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 140, height: 140)
                        Spacer()
                    }
                }
                
                
                
                HStack {
                    Spacer()
                    Button(action:{
                        self.randomNum = Int.random(in: 1...2)
                        self.randomNum2 = Int.random(in: 1...2)
                   
                    }){
                    label: do {
                        Text("New Cards")
                         .frame(width: 190, height: 40)
                         .background(Color.orange)
                         .font(.title)
                         .cornerRadius(15)
                }
                
                    }
                    
                    
                    Button(action:{
                        if (self.randomNum == (self.randomNum2 )){
                            score += 1
                     }
                    }){ label: do {
                        Text("Is a Match!")
                         .frame(width: 190, height: 40)
                         .background(Color.orange)
                         .font(.title)
                         .cornerRadius(15)
                    }
                    }
 
                    
                Spacer()
                        
                        
                        
                }
                HStack{
                    
                    Spacer()
                    Text("Score")
                        .font(.title)
                        .foregroundColor(Color(hue: 0.081, saturation: 1.0, brightness: 1.0))
                    Spacer()
                    Text(String(score))
                        .font(.title)
                    Spacer()
                    
                }; Spacer()
            }
             
        }
                
    }
}

struct quiz3_Previews: PreviewProvider {
    static var previews: some View {
        quiz3()
    }
}
