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
    
    //MARK: View functions
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setUpNavigationBar()
        setupTableView()
        infoItemsManager.getItemsData { (result) in
            self.tableView.reloadData()
        }
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
        tableView.dataSource = self
        setupTableViewConstraints()
        tableView.register(InfoItemTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.factCell.rawValue)
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

//MARK:Table view delegate and datasource methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoItemsManager.infoListItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell.rawValue, for: indexPath) as! InfoItemTableViewCell
        cell.nameLabel.text = infoItemsManager.infoListItems[indexPath.row].title
        cell.detailLabel.text = infoItemsManager.infoListItems[indexPath.row].description
        return cell
    }
}

//MARK: Navigation bar delegtae
extension ViewController: UINavigationBarDelegate {
    public func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

