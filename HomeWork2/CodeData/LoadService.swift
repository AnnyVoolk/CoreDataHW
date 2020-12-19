//
//  LoadService.swift
//  HomeWork2
//
//  Created by Anna Volkova on 14.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

protocol ILoadService{
    func load(page: Int, _ completion: @escaping () -> Void)
}

class LoadService {
    private let baseUrl = "https://jobs.github.com/positions.json"
    
    private let networkService: NetworkService
    
    private let databaseService: DatabaseService
    private let jobService: IJobsServiceCD
    
    init(networkService: NetworkService,
         databaseService: DatabaseService,
         jobService: IJobsServiceCD
    ) {
        self.networkService = networkService
        self.databaseService = databaseService
        self.jobService = jobService
    }
    
    private func setUrl(page: Int) -> URL? {
        URL(string: self.baseUrl + "?description=ios&page=\(page)")
    }
}

extension LoadService: ILoadService {
    
    func load(page: Int, _ completion: @escaping () -> Void) {
        guard let url = self.setUrl(page: page) else { return }
        self.networkService.loadData(from: url, completion: {  (resultData, error) in
            guard let someData = resultData else {
                completion()
                return
            }
            self.jobService.writeJobs(from: someData, completion)
        })
    }
}
