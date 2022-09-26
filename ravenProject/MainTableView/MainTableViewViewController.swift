//
//  MainTableViewViewControllers.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit

class MainTableViewViewController : UIViewController {
    public var presenter : MainTableViewPresenterProtocol?
    public var ui : MainTableViewContainer?
   
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
        
    }
    
    
    
}

extension MainTableViewViewController : MainTableViewViewProtocol{
    func errorGetNews() {
        
        if let data = UserDefaults.standard.data(forKey: "localModel") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Model
                let model = try decoder.decode(GetNewsResponse.self, from: data)
                presentAlert(title: "No cuentas con red", description: "Para descargar nuevas noticias activa wifi o red celular")
                ui?.validateDeletedItems(model)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        } else {
          presentAlert(title: "Algo salio mal", description: "Reintenta despues")
      
        }
        
      
    }
    
    func successGetNew(_ model: GetNewsResponse?) {
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(model)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "localModel")

        } catch {
            print("Unable to Encode Note (\(error))")
        }

        ui?.validateDeletedItems(model)
    }
    
    func presentAlert(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
