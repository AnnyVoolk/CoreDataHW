//
//  JobsViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 28.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class JobsViewModel: ObservableObject {
    
    @Published private(set) var jobList = [Jobs]()
    
    @Published private(set) var isPageLoading = false
    
    @Published private(set) var page = 0
    
    @Published private var jobsService: IJobsServiceCD?
    
    @Published private var loadService: ILoadService?
    
    private let userDefaults = UserDefaults.standard
    
    init() {
        self.jobsService = ServiceLocator.shared.getService(type: IJobsServiceCD.self)
        self.loadService = ServiceLocator.shared.getService(type: LoadService.self)
    }
    
    func upGreatPage() {
        self.page += 1
    }

    func fetchJobs() {
        self.isPageLoading = true
        self.loadService?.load(page: self.page) {
            let jobs = self.jobsService?.readJobs() ?? []
            let filteredJobs = jobs.filter { !self.jobList.contains($0) }
            self.jobList.append(contentsOf: filteredJobs)
            self.isPageLoading = false
        }
    }
    
    func checkOpeningScreen() -> Bool {
        let screenName = self.userDefaults.string(forKey: UserDefaultsName.currentScreen)
        if screenName != ViewControllers.jobList && screenName != nil {
            return false
        } else {
            self.userDefaults.set(ViewControllers.jobList, forKey: UserDefaultsName.currentScreen)
            self.fetchJobs()
            return true
        }
    }
}
