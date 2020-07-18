//
//  IngredientCard.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/29/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct IngredientCard: View {
    
    var I:ingredient
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: 230)
                .cornerRadius(20)
                .shadow(color: Color( "ShadowDark"), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                .padding()
            
            VStack(alignment: .center){
                Image(uiImage: ((UIImage(data: self.I.ingredientImage ?? Data())) ?? UIImage(named: "Logo"))!)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 135, height: 135)
                    .cornerRadius(20)
                    .padding(.horizontal, 5)
                    .padding(.bottom, 5)
                
                Text(self.I.ingredientName ?? "Name Not Found")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)

                
                
            }.frame(width: 175)
            
            
            
        }
    }
}

struct IngredientCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCard(I: ingredient())
    }
}
