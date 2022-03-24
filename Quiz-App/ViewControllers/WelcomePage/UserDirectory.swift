//
//  UserDirectory.swift
//  Quiz-App
//
//  Created by stephen weber on 3/23/22.
//

//

import SwiftUI

struct ScoreView:View {
    let name:String
    let score: Double
    var body: some View {
        Text("\(name) has a cumulative score of \(score)")
            .font(.largeTitle)
    }
    
}



struct UserDirectory: View {
    
    @State var userNames :[String] = ["Horses","Mouse","Giraffe","Elephant","Pony"]
    @State var Scores=[String:Double]()
    
    var body: some View {
        NavigationView{
            
            List {
                Section(header: Text("Current Quiz Users")
                            .multilineTextAlignment(.center)){
                    ForEach(userNames, id:\.self){
                        data in
                        
                        NavigationLink(destination:ScoreView(name: data, score:Scores[data]!)){
                        Text(data)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .cornerRadius(25)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .lineSpacing(/*@START_MENU_TOKEN@*/16.0/*@END_MENU_TOKEN@*/)
                        
                        }
                        
                        
                    }
                    .onDelete(perform:deleteData)
                    .onMove(perform:moveData)
                   
                    
                    
                    
                }
                
            }
            .navigationTitle("Animals")
            .navigationBarItems(leading:EditButton())
            .onAppear(perform:SETUSERNAMEDIRECTORY)
        }
    }
    
    func deleteData(indexSet:IndexSet){
        userNames.remove(atOffsets:indexSet)
        
        let defaults = UserDefaults.standard
        defaults.set(userNames, forKey:"Users")
        
        
        
    }
    func moveData(from source: IndexSet , to destination: Int) {
        userNames.move(fromOffsets:source, toOffset: destination)
    }
    
    func SETUSERNAMEDIRECTORY(){
        
        let defaults = UserDefaults.standard
    
        userNames = defaults.object(forKey:"Users") as! [String]
            
        Scores = defaults.object(forKey:"Scores") as! [String : Double]
        // I know make this inside a try
        
        //call user default and load in all of the users into UserNames
    }
    
    
    
    
    
}


struct SecondListView_Previews: PreviewProvider {
    static var previews: some View {
        UserDirectory()
    }
}

