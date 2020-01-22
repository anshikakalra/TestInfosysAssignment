//
//  FactListViewModel.swift
//  TestInfosysApplication
//
//  Created by Anshika on 22/01/20.
//  Copyright © 2020 Anshika. All rights reserved.
//

import Foundation

class FactListViewModel {
    //MARK: Variables
    weak var tableDatasource: GenericDataSource<FactModel>?
    weak var titleDatasource: GenericDataSource<String>?
    private let apiClient: APIClient!
    
    //MARK: Initializers
    init(titleDataSource:GenericDataSource<String>?, tableDataSource: GenericDataSource<FactModel>?, apiClient: APIClient) {
        self.titleDatasource = titleDataSource
        self.tableDatasource = tableDataSource
        self.apiClient = apiClient
    }

    //MARK: API calls
    
    //get facts data from server
    func getFactsData() {
        //make a call to server to get data
        let resource = Resource(url: URL(string: ResourceURL.resourceURL.rawValue)!)
        apiClient.load(resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(FactListModel.self, from: (data))
                    self.titleDatasource?.data.value = [items.title ?? ""]
                    self.tableDatasource?.data.value = items.rows ?? []
                } catch {
                    
                }
            case .failure(let error):
                print("\(self) retrive error: \(error) from resource: \(resource)")
            }
        }
    }
}
