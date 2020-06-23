//
//  Recipe.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation


class Recipe{
    var servings: String?
    var readyIn: String?
    var likeCount: String?
    
    
    var title: String?
    var imageUrl: String?
    var recipeImage: Data?
    var sourceName: String?
    var instructions: String?
    
    var vegetarian:Bool?
    var vegan: Bool?
    
    var ingredientList:[ingredient] = []
    
    init(){}
    
    init(servings: String, readyIn: String, likeCount: String, title: String, imageUrl: String, sourceName: String, instructions: String, vegetarian: Bool, vegan: Bool){
        self.servings = servings
        self.readyIn = readyIn
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
    var ingredientImage: Data?
    
    init(iS: String, iN: String, aisle: String){
        self.imageString = iS
        self.ingredientName = iN
        self.aisle = aisle
    }
}
