//
//  moviesViewModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import UIKit

class moviesViewModel: ObservableObject {
    
    var apiURL = "http://api.tvmaze.com/shows/"
    
  
    @Published var moviesJSON = [movieDataType]()
    var moviesDatas = [String:AnyObject](){
        didSet {
            if((moviesDatas["name"]?.isEqual(to: "Not Found")) != false){

            }else{
                moviesJSON.append(movieDataType(result: moviesDatas))
            }
        }
    }
    
    init() {
        for i in 55 ... 100{
            apiURL = apiURL + String(i)
            fetchDataFromServer()
            apiURL = "http://api.tvmaze.com/shows/"
        }
    }
    
    func fetchDataFromServer() {
        
        guard let url = URL(string: apiURL) else { return }
               let session = URLSession(configuration: .default)
               session.dataTask(with: url) { (data, response, error) in
                   
                   do {
                       let fetch = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? Dictionary<String,AnyObject>
                       
                       DispatchQueue.main.async {
                           
                        self.moviesDatas = fetch!
                        
                       }
                   }
                   catch {
                       print(error.localizedDescription)
                   }
               }.resume()
    }

}
