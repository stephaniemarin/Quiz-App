//
//  quiz3.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import SwiftUI

struct quiz3: View {
    
    @State private var randomNum : Int = 1
    @State private var randomNum2 : Int = 1
    @State private var labelAnswer : [String] = [ "Array", "Dictionary"]
    @State private var score : Int = 0
    @State private var totalQuestions : Int = 4
    @State private var totalAnswered : Int!
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Text("Matching Quiz")
                    .font(.largeTitle)
                    .padding(.top, 50.0)
                Spacer()
                VStack{
                    HStack{
                        HStack{
                            Spacer()
                            Image("quiz" + String(randomNum))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 190, height: 160)
                            Spacer()
                            Image("ans" + String(randomNum2))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 190, height: 140)
                            Spacer()
                        }
                    }
                    HStack{
                        HStack{
                            Spacer()
                            Image("quiz" + String(randomNum+1))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 190, height: 140)
                            Spacer()
                            
                            Image("ans" + String(randomNum2+1))
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 190, height: 140)
                            Spacer()
                        }
                    }
                }
                
            VStack{
                    
                
                HStack {
                    Spacer()
                    Button(action:{
                        self.randomNum = Int.random(in: 1...4)
                        
                   
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
                        
                            self.randomNum2 = Int.random(in: 1...4)
                     
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
                        if (self.randomNum == (self.randomNum2 )){
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
