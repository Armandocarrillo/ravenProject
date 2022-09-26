//
//  MainTableViewViewControllers.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

class MainTableViewViewController : UIViewController {
    public var presenter : MainTableViewPresenterProtocol?
    private var ui : MainTableViewContainer?
    let defaults = UserDefaults.standard
    
   
    override func loadView() {
        ui = MainTableViewContainer(delegate: self)
        view = ui
    }
    
    override func viewDidLoad() {
        configureNavigationBar()
        presenter?.getNews()
    }
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.backgroundColor = UIColor.white
        title = "Hacker News"
        navigationItem.rightBarButtonItem?.tintColor = .systemBlue
        
    }
    
    
    
}

extension MainTableViewViewController : MainTableViewViewProtocol{
    func errorGetNews() {
        let alert = UIAlertController(title: "Algo salio mal", message: "Reintenta despues", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func successGetNew(_ model: GetNewsResponse?) {
        
        ui?.validateDeletedItems(model)
    }
    
   
}

extension MainTableViewViewController : MainTableViewContainerDelegate {
    func goToDetail(item: Hit?) {
        if let itemURL = item?.storyURL {
           presenter?.goToWebView(url: itemURL)
        }
    }
    
    func pullRefresh() {
        ui?.tableView.separatorStyle = .none
        ui?.isLoadingOptions = true
        ui?.model = nil
        ui?.tableView.allowsSelection = false
        self.ui?.tableView.reloadData()
        presenter?.getNews()
    }
    
    
}
