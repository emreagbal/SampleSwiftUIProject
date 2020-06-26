//
//  discoverView.swift
//  SampleProject
//
//  Created by Emre Ağbal on 16.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct moviesView: View {
    
    @ObservedObject var moviesVM = moviesViewModel()
    
    var body: some View {
        
        NavigationView { 
            List {
                
//MARK: Recommended View
                VStack{
                    HStack{
                   Text("Recommended").font(.headline).padding(.leading, -29)
                       Text("For You")
                       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("View All").font(.headline)
                       }.frame(width: 65)
                        .padding(.leading, 57)
                        .foregroundColor(.purple)
                        .buttonStyle(PlainButtonStyle())
                    }
                
                    ScrollView(.horizontal , showsIndicators: false) {
                        HStack{
                            
                            ForEach(moviesVM.moviesJSON){ movie in
                                if(movie.isRecommended!){
                                    showMovie(movie: movie)
                                }
                            }
                        }.frame(height: 550).padding(.leading)
                    
                    }.frame(height: 550)
                }
                
//MARK: Popular View
                VStack{
                    HStack{
                        Text("Popular").font(.headline).padding(.leading, -29)
                       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("View All").font(.headline)
                                    
                       }.padding(.leading, 187)
                        .foregroundColor(.purple)
                        .buttonStyle(PlainButtonStyle())
                    }
                
                    ScrollView(.horizontal , showsIndicators: false) {
                    
                        HStack{
                            ForEach(moviesVM.moviesJSON){movie in
                                if(movie.isPopular ?? false){
                                    showMovie(movie: movie)
                                }
                            }
                        }.frame(height: 550).padding(.leading)
                    
                    
                    }.frame(height: 550)
                }
                
                }.navigationBarTitle(Text("Movies"))
        }
    }
    
}
//MARK: Show Movie View Struct
struct showMovie : View {
    var movie : movieDataType
    @State var isTouchingImage = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            AnimatedImage(url: URL(string: movie.movieImage!)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .frame(width: 250, height: 455, alignment: .leading)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(7)
                .onTapGesture {
                    self.isTouchingImage.toggle()
                }
//MARK: - Detail View
                .sheet(isPresented: $isTouchingImage, content: {
                    VStack {
                        ScrollView(.vertical , showsIndicators: false) {
                        AnimatedImage(url: URL(string: self.movie.movieImage!)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                        .frame(width: 375, height: 455, alignment: .top)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(7)
                            
                            Text("\(self.movie.movieTitle!)")
                                .font(.headline)
                            Text("Summary : \(self.movie.movieSummary!)").frame(width: 367, height: 599, alignment: .topLeading)
                                .font(.system(size: 13, weight: .light, design: .default))
                            
                      }
                    }
                })
            
            Text("\(movie.movieTitle!)").font(.headline).frame(width: 159, height: 25, alignment: .leading)
            Text("\(movie.movieYear!)").font(.caption).frame(width: 159, height: 25, alignment: .leading)
            Text("\(movie.movieGenre!)")
                .fontWeight(.heavy)
                .font(.caption).lineLimit(1)
                .padding(3)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(5)
            
        }
    }
    
}

struct moviesView_Previews: PreviewProvider {
    static var previews: some View {
        moviesView()
    }
}
