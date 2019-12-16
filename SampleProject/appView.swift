//
//  discoverView.swift
//  SampleProject
//
//  Created by Emre Ağbal on 16.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import SwiftUI

struct appView: View {
    @State var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab){
            discoverView()
                .tabItem {
                    Image("homeOn")
            }.tag(0)
            
            moviesView()
                .tabItem {
                    Image("search")
            }.tag(1)
        
        }
    }
}

struct appView_Previews: PreviewProvider {
    static var previews: some View {
        appView()
    }
}
