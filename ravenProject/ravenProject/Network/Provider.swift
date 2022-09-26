//
//  ServiceProvider.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit
import Alamofire

class Provider : Interface{
    
    // MARK: - Core methods
    
    func getHackerNews(_ completion: @escaping (GetNewsResponse?, AFError?) -> Void) {
    
        let request = AF.request("http://hn.algolia.com/api/v1/search_by_date?query=mobile").validate()
       
        request.responseDecodable(of: GetNewsResponse.self) { response in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                completion(nil, error)
            }
          
        }
        

    }
    
}
