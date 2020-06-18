//
//  Recipe.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation


class Recipe{
    var servings: Int?
    var preparationMinutes: Int?
    var cookingMinutes: Int?
    var likeCount: Int?
    
    
    var title: String?
    var imageUrl: String?
    var sourceName: String?
    var instructions: String?
    
    var vegetarian:Bool?
    var vegan: Bool?
    
    var ingredientList:[ingredient] = []
    
    
    init(servings: Int, preparationMinutes: Int, cookingMinutes: Int, likeCount: Int, title: String, imageUrl: String, sourceName: String, instructions: String, vegetarian: Bool, vegan: Bool){
        self.servings = servings
        self.preparationMinutes = preparationMinutes
        self.cookingMinutes = cookingMinutes
        self.likeCount = likeCount
        
        self.title = title
        self.imageUrl = imageUrl
        self.sourceName = sourceName
        self.instructions = instructions
        
        self.vegetarian = vegetarian
        self.vegan = vegan
    }
    
    func appendIngredient(i: ingredient){
        ingredientList.append(i)
    }
    
    
    
}

class ingredient{
    var imageString: String?
    var ingredientName: String?
    var aisle: String?
    
    init(iS: String, iN: String, aisle: String){
        self.imageString = iS
        self.ingredientName = iN
        self.aisle = aisle
    }
}
