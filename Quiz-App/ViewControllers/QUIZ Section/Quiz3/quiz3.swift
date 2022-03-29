//
//  quiz3.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import SwiftUI

struct quiz3: View {

    
    @State  var randomQ : Int = 1
    @State  var randomA : Int = 6
    @State private var score : Int = 0
    @State private var totalQuestions : Int = 10
    @State private var QuestiosAnswered : Int = 0
    
   
    @State private var alerSubmit = false
    
    var body: some View {
        
        
        //section old
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Matching Quiz")
                    .font(.title)
                    .padding(.top)
                
                VStack{
                    HStack{
                        Spacer()
                        Text("Question")
                            .font(.headline)
                        
                        Spacer()
                        Button(action:{
                            
                            randomQ += 1
                            if( randomQ > totalQuestions){
                                randomQ = 1
                            }
                            
                            
//                            for question in 1...totalQuestions{
//
//                                print(question)
//
//                                guard (question == randomQ) else
//                                {
//                                    randomQ += question
//                                    print(randomQ)
//                                    break
//                                }
//                                if (question >= totalQuestions){
//
//                                }
//
//                            }
                           // randomQ = Int.random(in: 1..<totalQuestions)
                            
                       
                        }){
                        label: do {
                            Text("New Question")
                             .frame(width: 190, height: 40)
                             .background(Color.yellow)
                             .font(.title)
                             .cornerRadius(15)
                        }
                    
                        };Spacer()
                            
                    }
                        Image("quiz" + String(randomQ))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 380, height: 210)
                                
                                .padding()
//                            Image("quiz" + String(bottomQ))
//                                .resizable()
//                                .aspectRatio( contentMode: .fit)
//                                .frame(width: 190, height: 140)

                    
                    
                    VStack{
                        HStack{
                            Spacer()
                            Text("Answer:")
                                .font(.headline)
                                .padding(.top)
                            Spacer()
                            Button(action:{
                                randomA += 1
                                if( randomA > totalQuestions){
                                    randomA = 1
                                }
                             
                            }){ label: do {
                                Text("New Answer")
                                 .frame(width: 190, height: 40)
                                 .background(Color.yellow)
                                 .font(.title)
                                 .cornerRadius(15)
                            }
                                

                            }
                        Spacer()
                        }
                    
                            Image("ans" + String(randomA))
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
                  
                    
                    
                }
                HStack {
                    Button(action:{
                        QuestiosAnswered += 1
                        if (randomQ == randomA){
                            score += 1
                     }
        
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

            }
                HStack{
                    
                    Spacer()
                    Text("Score")
                        .font(.title)
                        .foregroundColor(Color(hue: 0.081, saturation: 1.0, brightness: 1.0))
                    Spacer()
                    Text(String(score) + "/")
                        .font(.title)
                    Text(String(QuestiosAnswered))
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

func sameQuestion(){
    
}

struct quiz3_Previews: PreviewProvider {
    static var previews: some View {
        quiz3()
.previewInterfaceOrientation(.portrait)
    }
}
