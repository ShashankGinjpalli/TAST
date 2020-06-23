//
//  QuickInfoCard.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/18/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct QuickInfoCard: View {
    
    var servings:String
    var readyIn: String
    var likeCount:String
    
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Quick Info")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        
                        Text(" 🍚 \(self.servings)")
                            .foregroundColor(Color.green)
                        
                        Text(" ⏲ \(self.readyIn)")
                            .foregroundColor(Color.green)
                        Text(" 👍 \(self.likeCount)")
                            .foregroundColor(Color.green)
                        
                    }
                    
                }
                .padding()
                Spacer()
                
                Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .cornerRadius(90)
                    .frame(width:130)
                .padding()
                    
                
            }
        }
        .frame(width: 320.0, height: 220.0)
        .background(Color.white)
        .cornerRadius(20)
        
    }
}

struct QuickInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        QuickInfoCard(servings: "8", readyIn: "75", likeCount: "47829")
    }
}
