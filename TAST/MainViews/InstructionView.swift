//
//  instructionView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct InstructionView: View {
    
    var servings = 8
    var preparationMinutes = 15
    var cookingMinutes = 25
    var likeCount = 2478324
    
    var title = "Nachos"
    var imageUrl = "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg"
    var sourceName = "BuzzFeed"
    var instructions = "PreparationFor spice rub: Combine all ingredients in small bowl. Do ahead: Can be made 2 days ahead. Store airtight at room temperature. For chimichurri sauce: Combine first 8 ingredients in blender; blend until almost smooth. Add 1/4 of parsley, 1/4 of cilantro, and 1/4 of mint; blend until incorporated. Add remaining herbs in 3 more additions, pureeing until almost smooth after each addition. Do ahead: Can be made 3 hours ahead. Cover; chill. For beef tenderloin: Let beef stand at room temperature 1 hour. Prepare barbecue (high heat). Pat beef dry with paper towels; brush with oil. Sprinkle all over with spice rub, using all of mixture (coating will be thick). Place beef on grill; sear 2 minutes on each side. Reduce heat to medium-high. Grill uncovered until instant-read thermometer inserted into thickest part of beef registers 130F for medium-rare, moving beef to cooler part of grill as needed to prevent burning, and turning occasionally, about 40 minutes. Transfer to platter; cover loosely with foil and let rest 15 minutes. Thinly slice beef crosswise. Serve with chimichurri sauce. *Available at specialty foods stores and from tienda.com"
    
    var vegetarian = false
    var vegan = false
    
    
    var R = Recipe(servings: 8, preparationMinutes: 15, cookingMinutes: 25, likeCount: 723489, title: "Nachos", imageUrl: "https://spoonacular.com/recipeImages/char-grilled-beef-tenderloin-with-three-herb-chimichurri-156992.jpg", sourceName: "Buzzfeed", instructions: "PreparationFor spice rub: Combine all ingredients in small bowl. Do ahead: Can be made 2 days ahead. Store airtight at room temperature. For chimichurri sauce: Combine first 8 ingredients in blender; blend until almost smooth. Add 1/4 of parsley, 1/4 of cilantro, and 1/4 of mint; blend until incorporated. Add remaining herbs in 3 more additions, pureeing until almost smooth after each addition. Do ahead: Can be made 3 hours ahead. Cover; chill. For beef tenderloin: Let beef stand at room temperature 1 hour. Prepare barbecue (high heat). Pat beef dry with paper towels; brush with oil. Sprinkle all over with spice rub, using all of mixture (coating will be thick). Place beef on grill; sear 2 minutes on each side. Reduce heat to medium-high. Grill uncovered until instant-read thermometer inserted into thickest part of beef registers 130F for medium-rare, moving beef to cooler part of grill as needed to prevent burning, and turning occasionally, about 40 minutes. Transfer to platter; cover loosely with foil and let rest 15 minutes. Thinly slice beef crosswise. Serve with chimichurri sauce. *Available at specialty foods stores and from tienda.com", vegetarian: true, vegan: true)
    
    
    
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
            
            VStack(alignment: .leading){
                
                Text(R.title!)
                    .font(.title)
                
                
                Text("by \(R.sourceName!)")
                
                
                HStack{
                    
                    Rectangle()
                        .aspectRatio(contentMode: .fit)
                    .cornerRadius(25)
                        .shadow(radius: 10)
                        .foregroundColor(.white)
                        .listRowInsets(EdgeInsets())
                    
                }.padding(.top)
            }.padding()
            
            
                
        
            
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
