//
//  BadgeView.swift
//  TAST
//
//  Created by Shashank Ginjpalli on 6/17/20.
//  Copyright © 2020 Shashank Ginjpalli. All rights reserved.
//

import SwiftUI

struct BadgeView: View {
    var badgeName:String
    
    var body: some View {
        Image(self.badgeName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height:50)
            .cornerRadius(90)
            .shadow(radius: 5)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(badgeName: "vegan")
    }
}
