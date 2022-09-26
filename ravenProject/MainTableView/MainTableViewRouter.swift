//
//  MainTableViewRouters.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

class MainTableViewRouter {
    public var navigation : UINavigationController?
}

extension MainTableViewRouter : MainTableViewWireframeProtocol {
    func goToWebView(url: String) {
        
        if let nav = navigation{
            let view =  WebViewDetailMain.createModule(navigation: nav, URL: url)
            nav.pushViewController(view, animated: true)
        }
          
       
    }
    
   

    
}
