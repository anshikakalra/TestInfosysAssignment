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
    weak var datasource: GenericDataSource<FactModel>?
    private let apiClient: APIClient!
    var factListTitle: String?
    var facts: [FactModel]?
    
    //MARK: Initializers
    init(dataSource: GenericDataSource<FactModel>?, apiClient: APIClient) {
        self.datasource = dataSource
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
                    self.factListTitle = items.title
                    self.datasource?.data.value = items.rows ?? []
                } catch {
                    
                }
            case .failure(let error):
                print("\(self) retrive error: \(error) from resource: \(resource)")
            }
        }
        //after getting data set the main information model
        //after model is set than update the viewcontroller
    }
}
