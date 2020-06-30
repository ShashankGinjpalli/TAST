//
//  HistoryCard.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/26/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct HistoryCard: View {
    
    var R: Recipe
    
    var body: some View {
        VStack {
            Image(uiImage: ((UIImage(data: self.R.recipeImage ?? Data())) ?? UIImage(named: "Logo"))!)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.horizontal, 5)
                .padding(.bottom, 5)
            
            
            
            
            Text(self.R.title ?? "Title Not Found")
                .foregroundColor(.black)
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
        }
        
    }
}

struct HistoryCard_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCard(R: Recipe())
    }
}
