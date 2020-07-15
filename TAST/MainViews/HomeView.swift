//
//  ContentView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var toggleModal = false
    @State private var modalSelection = 1
    @State var query:String = ""
    @State var searchObj: SearchResults?
    @State var clickedRecipe:Recipe = Recipe()
    
    
    var recents = RecentRecipes()
    
    var featured = FeaturedRecipe()
    
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "AccentGreen")
        
    }
    
    var body: some View {
        NavigationView{
            ScrollView() {
                VStack(alignment: .leading) {
                    
                    Text("Featured")
                        .font(.headline)
                        .padding()
                    
                    Button(action: {
                        self.toggleModal.toggle()
                        self.modalSelection = 1
                        self.recents.insertToRecent(x: self.featured.featured)
                        self.clickedRecipe = self.featured.featured
                        var _ = IngredientImages(x: self.featured.featured.ingredientList)
                        
                    }){
                        HStack {
                            Spacer()
                            Image(uiImage: ((UIImage(data: self.featured.featured.recipeImage ?? Data())) ?? UIImage(named: "Logo"))!)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                            
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 25)
                    Text("\(self.featured.featured.title ?? "Title Not Found")")
                        .font(. headline)
                        .fontWeight(.light)
                        .padding(.bottom,20)
                        .padding()
                    
                    
                    
                    
                    if(self.recents.getRecentCount() > 0){
                        Text("Recents")
                            .font(.headline)
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(self.recents.recent){
                                    recipe in
                                    Button(action: {
                                        self.toggleModal.toggle()
                                        self.modalSelection = 1
                                        self.clickedRecipe = recipe
                                    }){
                                        HistoryCard(R: recipe)
                                    }
                                }
                            }.listRowInsets(EdgeInsets())
                        }.padding()
                            .listRowInsets(EdgeInsets())
                    }
                    
                    
                    
                    
                    VStack(alignment: .leading){
                        Text("Search")
                            .font(.headline)
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
                        
                        VStack(alignment: .center) {
                            ScrollView(.horizontal, showsIndicators: false ){
                                HStack {
                                    ForEach(self.searchObj?.searchresultsDat ?? []){
                                        recipe in
                                        Button(action: {
                                            
                                            self.toggleModal.toggle()
                                            self.modalSelection = 1
                                            print("Button Clicked")
                                            self.clickedRecipe = recipe
                                            var _ = IngredientImages(x: recipe.ingredientList)
                                            self.recents.insertToRecent(x: self.clickedRecipe)
                                            self.query = ""
                                            self.searchObj?.clearAllLists()
                                            
                                            
                                            
                                        }){
                                            HStack {
                                                Spacer()
                                                HistoryCard(R: recipe)
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }.padding()
                    
                    
                    
                    Spacer()
                    
                    
                    
                }
            }.navigationBarTitle(Text("TAST")
                .fontWeight(.semibold)
                .foregroundColor(Color.white))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
            
            
            
        }.navigationBarHidden(true)
            .edgesIgnoringSafeArea(.bottom)
            .padding(.bottom)
            .sheet(isPresented: $toggleModal) {
                if(self.modalSelection == 1){
                    InstructionView(R: self.clickedRecipe)
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
