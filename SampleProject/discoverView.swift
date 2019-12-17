//
//  ContentView.swift
//  SampleProject
//
//  Created by Emre Ağbal on 16.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct discoverView: View {
    
    @ObservedObject var discoverVM = discoverViewModel()
    
    var searchButton: some View {
        Button(action: { }){
            Image("search").imageScale(.medium)
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                
                HStack{                       Text("Stories").font(.headline)
                    Button(action: { }){
                        Text("View Archive").font(.headline)
                    }
                    .padding(.trailing)
                     .foregroundColor(.purple)
                        .buttonStyle(PlainButtonStyle())
                }
                
                ScrollView(.horizontal , showsIndicators: false) {
                        HStack{
                            ForEach(discoverVM.discoverJSON){post in
                                showStory(post: post)
                        }
                        }
                    
                }.frame(height: 100)
                 .padding(.bottom)
                
                    VStack(alignment: .leading){
                        ForEach(discoverVM.discoverJSON){post in
                            showPost(post: post)
                        }
                    }
            }.navigationBarTitle(Text("Discover"))
            
            }
   }
}

//MARK: Story View Struct
struct showStory: View {
    var post: discoverDataType
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: post.userImageUrl))
                .resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .clipShape(Circle())
                .frame(width: 70, height: 70)
                .clipped()
                .aspectRatio(contentMode: .fit)
                .imageScale(.large)
            Text("\(post.userFullName)")
        }
    }
}

//MARK: Post View Struct
struct showPost: View {
    var post: discoverDataType
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("\(post.userFullName)").font(.headline)
            Text("\(post.createdAt)").font(.caption)
            Text("\(post.postMessage)").font(.body)
            AnimatedImage(url: URL(string: post.postImage)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .listRowInsets(EdgeInsets())
                .frame(width: 399, height: 455, alignment: .leading)
            .aspectRatio(contentMode: .fill)
            
        }.padding(.leading, -2)
        
    }
}

struct discoverView_Previews: PreviewProvider {
    static var previews: some View {
        discoverView()
    }
}
