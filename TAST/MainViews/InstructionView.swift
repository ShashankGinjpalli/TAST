//
//  instructionView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct InstructionView: View {
    
    var R:Recipe
    
    var body: some View {
        
        List(){
            
            VStack(alignment: .leading) {
                HStack(alignment: .top){
                    
                    if R.vegan ?? false {
                        BadgeView(badgeName: "vegan")
                    }
                    if R.vegetarian ?? false{
                        BadgeView(badgeName: "vegetarian")
                        
                    } else{
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
                
            }
            .padding(.top)
            .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading){
                
                Text(R.title ?? "Error Getting Information")
                    .font(.title)
                
                Text("by \(R.sourceName ?? "N/A")")
                    .fontWeight(.light)
                
                HStack{
                    
                    Image(uiImage: ((UIImage(data: self.R.recipeImage ?? Data())) ?? UIImage(named: "Logo"))!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .shadow(color: Color( "ShadowDark"), radius: 5, x: 10, y: 10)
                        .shadow(color: Color.white, radius: 5, x: -10, y: -10)
                        .foregroundColor(.white)
                        .listRowInsets(EdgeInsets())
                    
                }.padding(.vertical)
                
            }.padding()
                .listRowInsets(EdgeInsets())
            
            VStack(alignment: .leading) {
                
                Text("Ingredients")
                    .padding(.leading)
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(self.R.ingredientList){
                            i in
                            IngredientCard(I: i)
                        }
                    }.padding(.top, 5)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                HStack {
                    Spacer()
                    QuickInfoCard(servings: self.R.servings ?? "Not Found", readyIn: self.R.readyIn ?? "Not Found" , likeCount: self.R.likeCount ?? "Not Found")
                        .shadow(color: Color( "ShadowDark"), radius: 15, x: 10, y: 10)
                        .shadow(color: Color.white, radius: 15, x: -10, y: -10)
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
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.white)
                    .cornerRadius(10)
                        .padding()
                    
                    
                    
                    Text(R.instructions ?? "Sorry No Instructions were found")
                        .lineSpacing(1.7)
                        .font(.footnote)
                        .padding()
                    .padding()
                }
                .shadow(color: Color( "ShadowDark"), radius: 15, x: 10, y: 10)
                .shadow(color: Color.white, radius: 15, x: -10, y: -10)
                
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
        
        
        InstructionView(R: Recipe(servings: "8", readyIn: "25", likeCount: "723489", title: "Nachos", imageUrl: "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg", sourceName: "Buzzfeed", instructions: "Roasted Broccoli with Lemon and Garlic might be just the side dish you are searching for. One serving contains <b>58 calories</b>, <b>3g of protein</b>, and <b>2g of fat</b>. For <b>30 cents per serving</b>, this recipe <b>covers 14%</b> of your daily requirements of vitamins and minerals. Not a lot of people made this recipe, and 4 would say it hit the spot. Head to the store and pick up salt, ground pepper, garlic, and a few other things to make it today. From preparation to the plate, this recipe takes roughly <b>45 minutes</b>. It is a good option if you're following a <b>caveman, gluten free, primal, and whole 30</b> diet. All things considered, we decided this recipe <b>deserves a spoonacular score of 94%</b>. This score is great. Try <a href=\"https://spoonacular.com/recipes/roasted-broccoli-with-garlic-and-lemon-29354\">Roasted Broccoli With Garlic And Lemon</a>, <a href=\"https://spoonacular.com/recipes/roasted-broccoli-with-garlic-and-lemon-706892\">Roasted Broccoli with Garlic and Lemon</a>, and <a href=\"https://spoonacular.com/recipes/roasted-garlic-lemon-broccoli-110090\">Roasted Garlic Lemon Broccoli</a> for similar recipes.", vegetarian: true, vegan: true))
    }
}
