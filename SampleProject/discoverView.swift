//
//  ContentView.swift
//  SampleProject
//
//  Created by Emre Ağbal on 16.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import SwiftUI

struct discoverView: View {
    
    let example = ["first", "second", "third", "first", "second", "third", "first", "second", "third", "first",]
    
    var body: some View {
        NavigationView {
            List {
                
                HStack{                       Text("Stories").font(.headline)
                    Button(action: { }){
                        Text("View Archive").font(.headline)
                    }.padding(.leading, 175)
                }
                
                ScrollView(.horizontal , showsIndicators: false) {
                    VStack(alignment: .leading){
                        HStack{
                        ForEach(example, id: \.self){ex in
                            Text(ex)
                        }
                        }
                    }
                    }.frame(height: 150)
                    .padding(.top , -61)
                
                    
                    
            
            
                ForEach(example, id: \.self){ex in
                    post()
                }
            }.navigationBarTitle(Text("Movies"))
            
            
        }.padding(.top ,-12)
   }
}

struct post: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("User Name").font(.headline)
            Text("Hala seviyotum ne yapsanda ne etsende geçmez biliyorum azalsandaaaa çoğalsandaaa bende üzdüm sende üzdün boş verelimmi bende küstüm sende küstün vazgeçelim mi?")
            Image("emre").resizable()
        }.padding(.leading, -2)
        
    }
}

struct discoverView_Previews: PreviewProvider {
    static var previews: some View {
        discoverView()
    }
}
