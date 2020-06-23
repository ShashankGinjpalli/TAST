//
//  instructionView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct InstructionView: View {
    
    
    
    var R = Recipe(servings: "8", readyIn: "25", likeCount: "723489", title: "Nachos", imageUrl: "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg", sourceName: "Buzzfeed", instructions: "Roasted Broccoli with Lemon and Garlic might be just the side dish you are searching for. One serving contains <b>58 calories</b>, <b>3g of protein</b>, and <b>2g of fat</b>. For <b>30 cents per serving</b>, this recipe <b>covers 14%</b> of your daily requirements of vitamins and minerals. Not a lot of people made this recipe, and 4 would say it hit the spot. Head to the store and pick up salt, ground pepper, garlic, and a few other things to make it today. From preparation to the plate, this recipe takes roughly <b>45 minutes</b>. It is a good option if you're following a <b>caveman, gluten free, primal, and whole 30</b> diet. All things considered, we decided this recipe <b>deserves a spoonacular score of 94%</b>. This score is great. Try <a href=\"https://spoonacular.com/recipes/roasted-broccoli-with-garlic-and-lemon-29354\">Roasted Broccoli With Garlic And Lemon</a>, <a href=\"https://spoonacular.com/recipes/roasted-broccoli-with-garlic-and-lemon-706892\">Roasted Broccoli with Garlic and Lemon</a>, and <a href=\"https://spoonacular.com/recipes/roasted-garlic-lemon-broccoli-110090\">Roasted Garlic Lemon Broccoli</a> for similar recipes.", vegetarian: true, vegan: true)
    
    
    
    var body: some View {
        
        List(){
            
            VStack(alignment: .leading) {
                HStack(alignment: .top){
                    
                    if R.vegan! {
                        BadgeView(badgeName: "vegan")
                    }
                    if R.vegetarian!{
                        BadgeView(badgeName: "vegetarian")
                        
                    } else{
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
                
            }
            .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading){
                
                Text(R.title!)
                    .font(.title)
                    
                    
                
                
                Text("by \(R.sourceName!)")
                    .fontWeight(.light)
                
                
                HStack{
                    
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .foregroundColor(.white)
                        .listRowInsets(EdgeInsets())
                    
                }.padding(.top)
                
                
                
                }.padding()
            .listRowInsets(EdgeInsets())
            
            
            
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                    .padding(.leading)
                    .font(.headline)
 
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(0..<20){ i in
                            Image(systemName: "folder.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height: 50)
                                .padding(.horizontal)
                            .shadow(radius: 5)
                            
                        }
                    }.padding()
                }
           
    
                
                HStack {
                    Spacer()
                    QuickInfoCard(servings: R.servings!, readyIn: R.readyIn! , likeCount: R.likeCount!)
                        .shadow(radius: 10)
                    Spacer()
                }.padding(.top)
            }
            .padding(.top)
            .padding(.bottom, 50)
            .listRowInsets(EdgeInsets())
            
            
            
            VStack(alignment: .leading, spacing: 3.0){
                Text("Instructions")
                    .font(.headline)
                
                Spacer()
                
               
                
                Text(R.instructions!)
                    .lineSpacing(1.7)
                    .font(.footnote)
                
                
                
            }.listRowInsets(EdgeInsets())
                .padding(.horizontal)
                .padding(.bottom)
            
            
            
            
            
            
            
            
            
            
        }
        .listRowInsets(EdgeInsets())
        .navigationBarHidden(true)
            
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        
        
        
        
    }
    
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
