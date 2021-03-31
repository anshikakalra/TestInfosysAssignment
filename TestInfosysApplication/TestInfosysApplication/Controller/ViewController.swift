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
    let tableDataSource = FactListDataSource()
    let navigationTitleDataSource = FactListNavigationDataSource()
    lazy var viewModel : FactListViewModel = {
        let viewModel = FactListViewModel(titleDataSource: navigationTitleDataSource, tableDataSource: tableDataSource, apiClient: APIClient())
        return viewModel
    }()

    //MARK: View functions
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setUpNavigationBar()
        setupTableView()
        setUpObservers()
        self.viewModel.getFactsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar.isHidden = false
        
    }
    
    //MARK: set up observers
    func setUpObservers() {
        // update navigation item based on title
        self.navigationTitleDataSource.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                let navItem = UINavigationItem(title:self?.navigationTitleDataSource.setUpNavigationTitle() ?? "")
                let doneItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(self?.refreshData))
                navItem.rightBarButtonItem = doneItem
                self?.navBar.setItems([navItem], animated: false)
                self?.navBar.setNeedsLayout()
                self?.navBar.layoutIfNeeded()
                self?.navBar.setNeedsDisplay()
            }
            
        }
        //update table view based on new table data
        self.tableDataSource.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
    
    //MARK: set up subviews
    func setUpNavigationBar() {
        view.addSubview(navBar)
        navBar.isTranslucent = false
        navBar.delegate = self
        navBar.backgroundColor = .white
        
        setupNavigationBarConstriants()
        
    }
    func setupTableView() {
        view.addSubview(tableView)
        self.tableView.dataSource = self.tableDataSource
        tableView.delegate = self
        setupTableViewConstraints()
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.factCell.rawValue)
    }
    
    //MARK: Refresh data
    @objc func refreshData() {
        self.viewModel.getFactsData()
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

//MARK: TableViewController delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.viewModel = tableDataSource.data.value[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


