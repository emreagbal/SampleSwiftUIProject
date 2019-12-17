//
//  moviesViewModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import UIKit

class moviesViewModel: ObservableObject {
    
    var apiURL = "http://www.mocky.io/v2/5dea8d843000001d442b09da.json"
    
  
    @Published var moviesJSON = [movieDataType]()
    
    init() {
        
        guard let url = URL(string: apiURL) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            
            do {
                let fetch = try JSONDecoder().decode([movieDataType].self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.moviesJSON = fetch
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    
    }

}
