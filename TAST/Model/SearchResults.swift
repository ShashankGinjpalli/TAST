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
        
        
        
    }
    
    func getSearchResultsDat(){
        for ids in searchresultsIds{
            
        }
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
