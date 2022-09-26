//
//  MainTableViewInteractors.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation
import Alamofire


class MainTableViewInteractor {
    var presenter: MainTableViewPresenterProtocol?
    var itProvider = Provider()
    
}

extension MainTableViewInteractor : MainTableViewInteractorProtocol {
    func getNews() {
        
        itProvider.getHackerNews { response, error in
            
            if let response = response {
                self.presenter?.successGetNew(response)
            } else {
                self.presenter?.errorGetNews()
            }
            
        }
        
    }
    
    
    
}
