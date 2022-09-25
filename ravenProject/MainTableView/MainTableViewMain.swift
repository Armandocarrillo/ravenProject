//
//  MainTableViewMain.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

open class MainTableViewMain {

    public static func createModule() -> UIViewController {

        let viewController  :  MainTableViewViewController?   = MainTableViewViewController()
        if let view = viewController {
            let presenter   =   MainTableViewPresenter()
            let router      =   MainTableViewRouter()
            let interactor  =   MainTableViewInteractor()

            view.presenter  =   presenter

            presenter.view          =   view
            presenter.interactor    =   interactor
            presenter.router        =   router

            interactor.presenter    =   presenter
            

            return view
        }

        return UIViewController()
    }
}
