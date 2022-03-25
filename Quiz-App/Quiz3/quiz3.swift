//
//  quiz3.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import SwiftUI

struct quiz3: View {

    
    @State  var randomQ : Int = 3
    @State  var randomA : Int = 2
    @State private var score : Int = 0
    @State private var totalQuestions : Int = 12
    @State private var totalwrong : Int = 12
    
   
    @State private var alerSubmit = false
    
    var body: some View {
        
        var topQ : Int = randomQ
        var topA : Int = randomQ
        
        var bottomQ : Int = randomA
        var bottomA : Int = randomA
        
        //section old
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Matching Quiz")
                    .font(.title)
                    .padding(.top)
                
                VStack{
                    VStack{
                            Image("quiz" + String(topQ))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 380, height: 210)
                                
                        
//                            Image("quiz" + String(bottomQ))
//                                .resizable()
//                                .aspectRatio( contentMode: .fit)
//                                .frame(width: 190, height: 140)

                        
                    }
                    VStack{
                    
                            Image("ans" + String(bottomA))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 380, height: 210)
//
//                            Image("ans" + String(bottomA))
//                                .resizable()
//                                .aspectRatio( contentMode: .fit)
//                                .frame(width: 190, height: 140)
                           
                        
                    }
                }
                .padding()
            VStack{
                HStack {
                    Spacer()
                    Button(action:{

                        randomQ = Int.random(in: 1..<totalQuestions)
                        
//                        randomA = Int.random(in: 1..<totalQuestions)
                        
//                        if (topQ == bottomQ)&&(bottomQ == topQ)
//                        {
//                            topQ = Int.random( in: 1..<5)
//                        }
//                        else{
//                            randomQ = Int.random(in: 1..<totalQuestions)
//                            randomA = Int.random(in: 1..<totalQuestions)
//                        }
                        
                   
                    }){
                    label: do {
                        Text("New Questions")
                         .frame(width: 190, height: 40)
                         .background(Color.yellow)
                         .font(.title)
                         .cornerRadius(15)
                    }
                
                    }
                    
                    Button(action:{
                        randomA = Int.random(in: 1..<totalQuestions)
                            
                     
                    }){ label: do {
                        Text("New Answers")
                         .frame(width: 190, height: 40)
                         .background(Color.yellow)
                         .font(.title)
                         .cornerRadius(15)
                    }
                        

                    }
                Spacer()
                }
                HStack {
                    Button(action:{
                        if (topQ == bottomA){
                            score += 1
                     }
//                        else
//                        {
//                            totalwrong += 1
//                        }
                    }){ label: do {
                        Text("Is a Match!")
                         .frame(width: 190, height: 40)
                         .background(Color.yellow)
                         .font(.title)
                         .cornerRadius(15)
                    }
                    
                    }
                }
                //button to verify match
                HStack{
                    
                }
                
                
            } .padding()
                HStack{
                    
                    Spacer()
                    Text("Score")
                        .font(.title)
                        .foregroundColor(Color(hue: 0.081, saturation: 1.0, brightness: 1.0))
                    Spacer()
                    Text(String(score) + "/")
                        .font(.title)
                    Text(String(totalwrong))
                        .font(.title)
                        .colorMultiply(Color.red)
                    Spacer()
                    
                } .padding()
                HStack {
                    Spacer()
                    Button(action: {
                        alerSubmit = true
                    
                    })
                    { label: do {
                        Text("Submit Quiz")
                         .frame(width: 190, height: 40)
                         .background(Color.white)
                         .font(.title)
                         .cornerRadius(15)
                         
                    }
                    
                    
                    }
                    .alert("Submit Quiz" , isPresented: $alerSubmit) {
                        Button("ok"){}
                    };Spacer()
                }
            }
             
        }
                
    }
}

struct quiz3_Previews: PreviewProvider {
    static var previews: some View {
        quiz3()
    }
}
