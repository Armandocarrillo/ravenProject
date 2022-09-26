//
//  WebViewDetailMain.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 26/09/22.
//

import Foundation
import UIKit

open class WebViewDetailMain {

    public static func createModule(navigation: UINavigationController, URL : String) -> UIViewController {

        let viewController  :   WebViewDetailViewControllers?   =  WebViewDetailViewControllers()
        if let view = viewController {
            let presenter   =    WebViewDetailPresenters()
            let router      =    WebViewDetailRouters()
            let interactor  =    WebViewDetailInteractors()

            view.presenter  =   presenter

            presenter.view          =   view
            presenter.interactor    =   interactor
            presenter.router        =   router

            interactor.presenter    =   presenter
            router.navigation = navigation
            
            view.url = URL

            return view
        }

        return UIViewController()
    }
}
