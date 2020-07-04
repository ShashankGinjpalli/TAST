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
                        .padding(.bottom,20)
                        .padding()
                        .font(. headline)
                    
                    
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
                                    }){
                                        HistoryCard(R: recipe)
                                    }
                                }
                            }.listRowInsets(EdgeInsets())
                        }.padding()
                            .listRowInsets(EdgeInsets())
                    }
                    
                    
                    
                    
                    Text("Search")
                        .font(.headline)
                        .padding()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            self.toggleModal.toggle()
                            self.modalSelection = 2
                            
                        }){
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                                
                            }
                        }.frame(width: 200, height: 50)
                            .foregroundColor(.white)
                            .font(.headline)
                            .background(Color.blue)
                            .cornerRadius(10)
                        Spacer()
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    
                }
            }.navigationBarTitle(Text("Home"))
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
            }
            
            
            
        }.navigationBarHidden(true)
            .padding(.bottom)
            .sheet(isPresented: $toggleModal) {
                if(self.modalSelection == 1){
                    InstructionView(R: self.featured.featured)
                }
                if(self.modalSelection == 2){
                    SearchView()
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
