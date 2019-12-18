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
           
           moviesView()
                .tabItem {
                    if(selectedTab == 0){
                        Image("homeOn")
                    }else{
                        Image("homeOff")
                    }
                    
            }.tag(0)
            
            
             discoverView()
                .tabItem {
                    if(selectedTab == 1){
                       Image("searchOn")
                    }else{
                       Image("search")
                    }
            }.tag(1)
        
        }
    }
}

struct appView_Previews: PreviewProvider {
    static var previews: some View {
        appView()
    }
}
