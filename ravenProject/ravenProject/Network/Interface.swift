//
//  ServiceInterface.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import Foundation
import Alamofire

protocol Interface {
    
    //Get news
    
    func getHackerNews(_ completion: @escaping (GetNewsResponse? , AFError?) -> Void)
    
}

