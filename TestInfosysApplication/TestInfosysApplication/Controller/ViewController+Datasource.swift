//
//  ViewController+Datasource.swift
//  TestInfosysApplication
//
//  Created by Anshika on 22/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import UIKit
import SDWebImage
class FactListDataSource : GenericDataSource<FactModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.factCell.rawValue, for: indexPath) as! FactTableViewCell
        let factModel = self.data.value[indexPath.row]
        cell.setupCellData(fact: factModel)
        return cell
    }
}

class FactListNavigationDataSource: GenericDataSource<String> {
    func setUpNavigationTitle()->String {
        if data.value.count > 0 {
            return data.value[0]
        }
        return ""
    }
}
