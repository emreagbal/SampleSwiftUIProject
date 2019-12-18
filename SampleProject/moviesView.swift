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
                                if(movie.isRecommended){
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
                                if(movie.isPopular){
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
    var body: some View {
        VStack(alignment: .leading){
            
            AnimatedImage(url: URL(string: movie.movieImage)).resizable(capInsets: EdgeInsets(), resizingMode: Image.ResizingMode.stretch)
                .frame(width: 250, height: 455, alignment: .leading)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(7)
            
            Text("\(movie.movieTitle)").font(.headline).frame(width: 159, height: 25, alignment: .leading)
            Text("\(movie.movieYear)").font(.caption).frame(width: 159, height: 25, alignment: .leading)
            Text("\(movie.movieGenre)")
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
