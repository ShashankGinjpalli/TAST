//
//  SearchResults.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 7/1/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation

class SearchResults{
    var searchresultsIds:[Int] = []
    var searchresultsDat:[Recipe] = []
    var query:String = ""
    
    
    init(s: String){
        self.query = s
        getSearchResultsIds()
        getSearchResultsDat()
    }
    
    
    func getSearchResultsIds(){
        let url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=82c5b7acc77342f69584ee04330b5ec8&query="
        query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        
        let request = NSMutableURLRequest(url: NSURL(string: url + query)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
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
                
                if("\(jsonResult["status"] ?? "")" == "failure"){
                    print("Fail")
                    
                }
                
                
                let results = jsonResult["results"] as! NSArray
                for i in results{
                    let result = i as! [String:AnyObject]
                    print(result)
                    self.searchresultsIds.append(result["id"] as! Int)
                }
                
                
                print("Finished Loading Data")
            }
            
            semaphore.signal()
            
        })
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        
    }
    
    func getSearchResultsDat(){
        var ids = ""
        for id in searchresultsIds{
            ids += String(id)+","
        }
        print(ids)
        let url = "https://api.spoonacular.com/recipes/informationBulk?apiKey=82c5b7acc77342f69584ee04330b5ec8&ids=\(ids)"
        
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        var semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("Error Request Timed Out")
                
            } else {
                var err: NSError?
                let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSArray
                if (err != nil) {
                    print("JSON Error \(err!.localizedDescription)")
                    
                }
                
                
                
                
                let results = jsonResult as! NSArray
                for i in results{
                    let result = i as! [String:AnyObject]
                    print(result)
                    
                    var searchResult = Recipe()
                    
                    searchResult.servings = "\(result["servings"]!)"
                    searchResult.instructions = result["instructions"] as? String
                    
                    searchResult.title = result["title"] as? String
                    searchResult.sourceName = result["sourceName"] as? String
                    searchResult.readyIn = "\(result["readyInMinutes"]!)"
                    searchResult.likeCount = "\(result["aggregateLikes"]!)"
                    
                    searchResult.imageUrl = result["image"] as? String
                    
                    print("\(result["vegan"]!)")
                    print("\(result["vegetarian"]!)")
                    
                    if("\(result["vegetarian"]!)" == "0"){
                        searchResult.vegetarian = false
                    }else{
                        searchResult.vegetarian = true
                    }
                    
                    if("\(result["vegan"]!)" == "0"){
                        searchResult.vegan = false
                    }else{
                        searchResult.vegan = true
                    }
                    
                    let imageUrl = "https://spoonacular.com/cdn/ingredients_100x100/"
                    
                    for i in (result["extendedIngredients"] as! [Any]){
                        let ingredientInfo = i as! [String:AnyObject]
                        let ingred = ingredient(iS: imageUrl + (ingredientInfo["image"] as? String ?? "not_found"), iN: ingredientInfo["originalString"] as? String ?? "Not Found", aisle: ingredientInfo["aisle"] as? String ?? "Not Found")
                        searchResult.appendIngredient(i: ingred)
                        
                    }
                    
                    self.searchresultsDat.append(searchResult)
                    
                }
                
                
                
                
                print("Finished Loading Data")
            }
            
            semaphore.signal()
            
        })
        
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        
        
        
        for i in self.searchresultsDat{
            semaphore = DispatchSemaphore(value: 0)
            print("Attempting to get featured image")
            
            let url = (URL(string: i.imageUrl ?? "") ?? URL(string: ""))!
            
            print(i.imageUrl!)
            
            let imageRequest = session.dataTask(with: url, completionHandler: { data, response, error -> Void in
                if (error != nil) {
                    print(error!.localizedDescription)
                }
                
                var err: NSError?
                i.recipeImage = data!
                semaphore.signal()
                
            })
            imageRequest.resume()
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        }
        
        print(searchresultsDat)
        
        
        
    }
    
    func clearIDList(){
        searchresultsIds = []
    }
    
    func clearDataList(){
        searchresultsDat = []
    }
    
    func clearAllLists(){
        clearIDList()
        clearDataList()
    }
    
}
