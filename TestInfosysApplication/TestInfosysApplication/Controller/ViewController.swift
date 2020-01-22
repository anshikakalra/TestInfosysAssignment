//
//  ViewController.swift
//  TestInfosysApplication
//
//  Created by Anshika on 21/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variables
    let tableView = UITableView()
    let navBar = UINavigationBar()
    var safeArea: UILayoutGuide!
    let infoItemsManager = FactsManager.init(apiClient: APIClient())
    let dataSource = FactListDataSource()
    lazy var viewModel : FactListViewModel = {
        let viewModel = FactListViewModel(dataSource: dataSource, apiClient: APIClient())
        return viewModel
    }()
    
    //MARK: View functions
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setUpNavigationBar()
        setupTableView()

        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                   self?.tableView.reloadData()
            }
         
        }
        
        self.viewModel.getFactsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar.isHidden = false
        
    }
    
    //MARK: set up subviews
    func setUpNavigationBar() {
        view.addSubview(navBar)
        navBar.isTranslucent = false
        navBar.delegate = self
        navBar.backgroundColor = .white
        navBar.topItem?.title = "Set title"
        setupNavigationBarConstriants()
        
    }
    func setupTableView() {
        view.addSubview(tableView)
        self.tableView.dataSource = self.dataSource
        setupTableViewConstraints()
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.factCell.rawValue)
    }
}

 //MARK:Setting constraints progrmatically for views
extension ViewController {
    
    //Constraints for navigation bar
    fileprivate func setupNavigationBarConstriants() {
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        navBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        if #available(iOS 11, *) {
            navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
    }
    
    //Constraints for tableview
    fileprivate func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor ).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

//MARK: Navigation bar delegtae
extension ViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

