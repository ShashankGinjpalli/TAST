//
//  FeaturedRecipe.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/19/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation


class FeaturedRecipe {
    
    var featured = Recipe()
    
    init(){
        getRandomRecipe()
    }
    
    
    let request = NSMutableURLRequest(url: NSURL(string: "https://api.spoonacular.com/recipes/random?apiKey=82c5b7acc77342f69584ee04330b5ec8&number=1")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    
    
    func getRandomRecipe() {
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("Error Request Timed Out")
            } else {
                var err: NSError?
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                if (err != nil) {
                    print("JSON Error \(err!.localizedDescription)")
                }
                
                let results = jsonResult["recipes"] as! NSArray
                let result = results[0] as! [String:AnyObject]
                
                
                self.featured.servings = result["serving"] as? String
                self.featured.instructions = result["instructions"] as? String
                
                self.featured.title = result["instructions"] as? String
                self.featured.sourceName = result["sourceName"] as? String
                self.featured.readyIn = result["readyInMinutes"] as? String
                self.featured.likeCount = result["aggregateLikes"] as? String
                
                self.featured.imageUrl = result["image"] as? String
                
                if(result["vegetarian"] as? String == "NO"){
                    self.featured.vegetarian = false
                }else{
                    self.featured.vegetarian = true
                }
                
                if(result["vegan"] as? String == "NO"){
                    self.featured.vegan = false
                }else{
                    self.featured.vegan = true
                }
                
                var imageUrl = "https://spoonacular.com/cdn/ingredients_100x100/"
                
                for i in (result["extendedIngredients"] as! [Any]){
                    let ingredientInfo = i as! [String:AnyObject]
                    var ingred = ingredient(iS: imageUrl + (ingredientInfo["image"] as? String ?? "not_found"), iN: ingredientInfo["originalString"] as? String ?? "Not Found", aisle: ingredientInfo["aisle"] as? String ?? "Not Found")
                    self.featured.appendIngredient(i: ingred)
                    
                }
                
                print("Finished Loading Data")
                
        
                
            }
            semaphore.signal()
            
        })
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    
}
