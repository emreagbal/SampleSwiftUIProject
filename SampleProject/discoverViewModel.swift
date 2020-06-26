//
//  discoverViewModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import UIKit

class discoverViewModel: ObservableObject {
    
    var apiURL = "https://jsonplaceholder.typicode.com/photos"
    
    @Published var discoverJSON = [discoverDataType]()
    
    init() {
        fetchDataFromServer()
    }
    
    func fetchDataFromServer(){
        
        guard let url = URL(string: apiURL) else { return }
               let session = URLSession(configuration: .default)
               session.dataTask(with: url) { (data, response, error) in
                   
                   do {
                       let fetch = try JSONDecoder().decode([discoverDataType].self, from: data!)
                       
                       DispatchQueue.main.async {
                        for i in 0 ... 100 {
                            self.discoverJSON.append(fetch[i])
                        }
                           
                       }
                   }
                   catch {
                       print(error.localizedDescription)
                   }
               }.resume()
           
    }
}
