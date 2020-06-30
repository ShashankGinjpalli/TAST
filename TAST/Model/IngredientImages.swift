//
//  IngredientImages.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/29/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation

class IngredientImages {
    
    var ingredientList:[ingredient]?
    
    let imageUrl = "https://spoonacular.com/cdn/ingredients_100x100/"
    
    init(x:[ingredient]){
        self.ingredientList = x
        fetchImages()
    }
    
    
    func fetchImages(){
        for i in ingredientList ?? []{
            print(i.imageString ?? "")
            let semaphore = DispatchSemaphore(value: 0)
            print("Attempting to get featured image")
            
            let url = (URL(string: i.imageString ??  "") ?? URL(string: ""))!
            
            
            
            let imageRequest = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error -> Void in
                if (error != nil) {
                    print(error!.localizedDescription)
                }
                
                var err: NSError?
                i.ingredientImage = data!
                semaphore.signal()
                
            })
            imageRequest.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        
    }
}
