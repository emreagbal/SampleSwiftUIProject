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
//MARK: Story View
                
                VStack{
                HStack{                       Text("Stories").font(.headline)
                    Button(action: { }){
                        Text("View Archive").font(.headline)
                    }
                    .padding(.leading, 175)
                     .foregroundColor(.purple)
                        .buttonStyle(PlainButtonStyle())
                }
                
                ScrollView(.horizontal , showsIndicators: false) {
                    HStack{

                        VStack{
                                Image("group2").resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                                .clipped()
                                .aspectRatio(contentMode: .fit)
                                .imageScale(.small)
                                Text("You")
                        }.padding(.leading)
                            ForEach(discoverVM.discoverJSON){post in
                                showStory(post: post)
                        }
                    }.frame(height: 100)
                    
                }.frame(height: 100)
                }
//MARK: Post View
                
                VStack(alignment: .leading){
                    ForEach(discoverVM.discoverJSON){post in
                        showPost(post: post)
                    }
                }
            }.navigationBarTitle(Text("Discover")).navigationBarItems(trailing: searchButton)
            
            }
   }
}

//MARK: Show Story View Struct
struct showStory: View {
    var post: discoverDataType
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string: post.thumbnailUrl))
                .resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .clipShape(Circle())
                .frame(width: 70, height: 70)
                .clipped()
                .aspectRatio(contentMode: .fit)
                .imageScale(.large)
            Text("User")
        }.padding(.leading)
    }
}

//MARK: Show Post View Struct
struct showPost: View {
    var post: discoverDataType
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: post.thumbnailUrl)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                    .listRowInsets(EdgeInsets())
                    .clipShape(Circle())
                    .frame(width: 70, height: 70, alignment: .leading)
                    .aspectRatio(contentMode: .fill)
                    
                VStack{
                    Text("Lorem").font(.headline).lineLimit(1)
                    
                }
                Image("more").padding(.leading, 139)
                
            }
            
           
            Text("\(post.title)").font(.body)
            AnimatedImage(url: URL(string: post.url)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .listRowInsets(EdgeInsets())
                .frame(width: 411, height: 455, alignment: .leading)
                .aspectRatio(contentMode: .fit).padding(.leading, -13)
            HStack{
                Image("like")
                Text("\(post.id)")
                Image("comment").padding(.init(top: 0, leading: 99, bottom: 0, trailing: 0))
                Text("\(post.albumId)")
                Image("share").padding(.init(top: 0, leading: 119, bottom: 0, trailing: 0))
            }
        }.padding(.leading, -2)
        
    }
}

struct discoverView_Previews: PreviewProvider {
    static var previews: some View {
        discoverView()
    }
}
