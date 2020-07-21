//
//  WebManager.swift
//  Pryaniky
//
//  Created by Anton Larchenko on 20.07.2020.
//  Copyright © 2020 Anton Larchenko. All rights reserved.
//

import Foundation

class WebManager {
    
    func loadPryanik(completion: @escaping (Pryanik)->()) {
        
        let url = URL(string: "https://pryaniky.com/static/json/sample.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let pryanik = try JSONDecoder().decode(Pryanik.self, from: data)
                completion(pryanik)
                print(pryanik)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
}
