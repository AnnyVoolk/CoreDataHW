//
//  AppConfig.swift
//  HomeWork2
//
//  Created by Anna Volkova on 15.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

public class AppConfig {
    
    public static let shared = AppConfig()
    
    private init() {
        self.setup()
    }
    
    private func setup() {
        let databaseService = DatabaseService()
        let networkService = NetworkService()
        let jobService = JobsService(databaseService: databaseService)
        
        let loadService = LoadService(
            networkService: networkService,
            databaseService: databaseService,
            jobService: jobService
        )
        ServiceLocator.shared.addService(service: jobService as IJobsService)
        ServiceLocator.shared.addService(service: loadService as LoadService)
    }
}
