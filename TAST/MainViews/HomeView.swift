//
//  ContentView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var showInstructionView = false
    
    var recents = RecentRecipes()
    
    var featured = FeaturedRecipe()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "AccentGreen")
       
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("Featured")
                    .font(.headline)
                    .padding()
                
               Button(action: {
                   self.showInstructionView.toggle()
               }){
                    HStack {
                        Spacer()
                        Image(uiImage: ((UIImage(data: self.featured.featured.recipeImage ?? Data())) ?? UIImage(named: "Logo"))!)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                        
                        
                        Spacer()
                    }
                }
                    .padding(.horizontal, 25)
                    Text("\(self.featured.featured.title!)")
                        .padding(.bottom,20)
                        .padding()
                        .font(. headline)
                    
                
                
                
                Text("Recent Recipes")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                
            }.navigationBarTitle(Text("Home"))
            
            
            
        }.navigationBarHidden(true)
            .padding(.bottom)
        .sheet(isPresented: $showInstructionView) {
            InstructionView(R: self.featured.featured)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
