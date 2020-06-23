//
//  ContentView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI
import URLImage

struct HomeView: View {
    
    var recents = RecentRecipes()
    var featured = FeaturedRecipe()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("Featured")
                    .font(.headline)
                    .padding()

                
                
                HStack {
                    Spacer()
                    Image(uiImage: ((UIImage(data: Data())) ?? UIImage(named: "Logo"))!)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                    .shadow(radius: 10)
                     .cornerRadius(15)
                        
                        
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 25)
                

                
                Text("Recent Recipes")
                    .font(.headline)
                    .padding()
                
                Spacer()
                    
                
            }.navigationBarTitle(Text("Home"))
        
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
