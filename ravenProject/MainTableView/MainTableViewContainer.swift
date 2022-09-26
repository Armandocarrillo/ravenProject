//
//  MainTableViewContainer.swift
//  ravenProject
//
//  Created by Armando Carillo - Bt on 25/09/22.
//

import UIKit



internal class MainTableViewContainer : UIView{
    weak var delegate: MainTableViewContainerDelegate?
    var isLoadingOptions = true
    var model : GetNewsResponse?
    
    
    lazy var tableView : UITableView = {
       var tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.backgroundColor = UIColor.clear
        tableview.allowsSelection = false
        tableview.refreshControl = refreshControl
        tableview.register(MainCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableview.register(MainCellShimer.self, forCellReuseIdentifier: "MainTableShimmerViewCell")
        return tableview
    }()
    
    public lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.pullRefresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func pullRefresh(){
        delegate?.pullRefresh()
    }
    
    
    public convenience init(
        delegate: MainTableViewContainerDelegate){
        self.init()
        self.delegate = delegate
        setupUIElements()
        setupConstraints()
        
        self.backgroundColor = UIColor.white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUIElements(){
        
        self.addSubview(tableView)

        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
    
    
    func validateDeletedItems(_ model : GetNewsResponse?) {
        
        
        tableView.refreshControl?.endRefreshing()
        
      
        
        self.model = model
        isLoadingOptions = false
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.reloadData()
        }

        
        
    }
    
}


extension MainTableViewContainer : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLoadingOptions ? 20 : (model?.hits.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainCell
        let cellShimmer = tableView.dequeueReusableCell(withIdentifier: "MainTableShimmerViewCell",for: indexPath) as! MainCellShimer
      
        
        if !isLoadingOptions{
            
            if let title = model?.hits[indexPath.row].storyTitle,
               let autor = model?.hits[indexPath.row].author {
                cell.titleDescription.text = title
                cell.autorDescription.text = autor
            }
    
        }
        return isLoadingOptions == false ? cell : cellShimmer
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = model?.hits[indexPath.row]
        
        delegate?.goToDetail(item: data)
    }
    
  
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            self.model?.hits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
              completion(true)
          }

          deleteAction.backgroundColor = UIColor.red
          return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    
}



