//
//  RecentRecipes.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/19/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import Foundation


class RecentRecipes{
    var recent:[Recipe] = []
    
    func insertToRecent(x: Recipe){
        self.recent.append(x)
    }
    
    func deleteFromRecent(index:Int){
        self.recent.remove(at: index)
    }
    
    func clearAll(){
        self.recent = []
    }
    
    func getRecentCount() ->Int{
        return recent.count
    }
}
