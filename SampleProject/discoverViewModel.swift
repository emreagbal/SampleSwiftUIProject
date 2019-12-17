//
//  discoverViewModel.swift
//  SampleProject
//
//  Created by Emre Ağbal on 17.12.2019.
//  Copyright © 2019 Emre Ağbal. All rights reserved.
//

import UIKit

class discoverViewModel: ObservableObject {
    
    var apiURL = "http://www.mocky.io/v2/5dea8bf6300000d23f2b09d0.json"
    
    @Published var discoverJSON = [discoverDataType]()
    
    init() {
        
        guard let url = URL(string: apiURL) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            
            do {
                let fetch = try JSONDecoder().decode([discoverDataType].self, from: data!)
                
                DispatchQueue.main.async {
                    
                    self.discoverJSON = fetch
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    
    }

}
