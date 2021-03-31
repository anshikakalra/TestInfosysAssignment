//
//  DetailViewController.swift
//  MovieDB
//
//  Created by Anshika on 31/03/21.
//  Copyright © 2021 Anshika. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    //MARK: Variables
    var viewModel: FactModel?
    var viewDetailModel: MovieDetailViewModel?
    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    
    //MARK: View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        viewDetailModel = MovieDetailViewModel(movieModel: viewModel)
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(SingleLabelTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.titleLabelCell.rawValue)
        tableView.register(SingleImageTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.imageCell.rawValue)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableViewConstraints()
    }
    
}

//MARK:Setting constraints progrmatically for views
extension DetailViewController {
    //Constraints for tableview
    fileprivate func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor ).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

//MARK: TableViewControllerDatasource and delegate methods
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewDetailModel?.viewModelDetails.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
           let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.imageCell.rawValue, for: indexPath) as! SingleImageTableViewCell
            guard let movieModel = self.viewDetailModel?.viewModelDetails[indexPath.row] else { return UITableViewCell() }
            cell.setupCellData(image: movieModel)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.titleLabelCell.rawValue, for: indexPath) as! SingleLabelTableViewCell
        guard let movieModel = self.viewDetailModel?.viewModelDetails[indexPath.row] else { return UITableViewCell() }
            cell.setupCellData(title: movieModel)
        return cell
        
    }
    
  
}
