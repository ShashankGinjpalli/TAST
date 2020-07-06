//
//  SearchView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/30/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var query:String = ""
    @State var searchObj: SearchResults?
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Search")
                .font(.title)
            TextField("Search", text: $query)
                .cornerRadius(10)
                
                
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            HStack {
            Spacer()
            Button(action: {
                self.searchObj = SearchResults(s: self.query)
                
            }){
                HStack{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                    
                }
            }.frame(width: 180, height: 50)
                .foregroundColor(.white)
                .font(.headline)
                .background(Color.blue)
                .cornerRadius(20)
            Spacer()
            }.padding(.vertical)
            
            Spacer()
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
