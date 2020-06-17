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
    var preperationMinutes: Int?
    var cookingMinutes: Int?
    var likeCount: Int?
    
    
    var title: String?
    var imageUrl: String?
    var sourceName: String?
    var instructions: String?
    
    var vegetarian:Bool?
    var vegan: Bool?
    
}

class ingredient{
    var imageString: String?
    var ingredientName: String?
    var aisle: String?
}
