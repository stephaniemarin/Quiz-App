//
//  Matchquiz.swift
//  Quiz-App
//
//  Created by Stephanie Marin Velasquez on 3/22/22.
//

import Foundation
import SwiftUI

struct MatchQuiz: View {
    var body: some View {
        ZStack{
            Image("background")
                .ignoresSafeArea()
            VStack{
                Text("Matching Quiz")
                HStack{
                    VStack{
                        Image("test1-1")
                        Image("test1-2")
                    }
                    VStack{
                        Text("Score")
                        Text("0")
                    }
                }
            }
        }
    }
}
