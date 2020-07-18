//
//  RecipeObj+CoreDataProperties.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 7/18/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//
//

import Foundation
import CoreData


extension RecipeObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeObj> {
        return NSFetchRequest<RecipeObj>(entityName: "RecipeObj")
    }

    @NSManaged public var servings: String?
    @NSManaged public var readyIn: String?
    @NSManaged public var likeCount: String?
    @NSManaged public var title: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var recipeImage: Data?
    @NSManaged public var sourceName: String?
    @NSManaged public var instructions: String?
    @NSManaged public var vegetarian: Bool
    @NSManaged public var vegan: Bool
    @NSManaged public var ingredientList: [ingredient]?

}
