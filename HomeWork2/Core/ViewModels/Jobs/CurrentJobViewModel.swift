//
//  CurrentJobViewModel.swift
//  HomeWork2
//
//  Created by Anna Volkova on 18.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class CurrentJobViewModel: ObservableObject {
    
    @Published private var jobsService: IJobsServiceCD?
    @Published var job: Jobs?
    private let userDeafaults = UserDefaults.standard
    
    init(job: Jobs?) {
        self.jobsService = ServiceLocator.shared.getService(type: IJobsServiceCD.self)
        self.job = job
    }
    
    func checkCurrentScreen() -> Bool {
        guard userDeafaults.string(forKey: UserDefaultsName.currentScreen) != ViewControllers.currentJobDescription else {
            return false
        }
        self.userDeafaults.set(ViewControllers.currentJob, forKey: UserDefaultsName.currentScreen)
        guard let job = self.job else {
            let id = self.userDeafaults.string(forKey: UserDefaultsName.jobId)
            self.job = self.jobsService?.readJob(with: id ?? "")
            return true
        }
        self.userDeafaults.set(job.id, forKey: UserDefaultsName.jobId)
        return true
    }
    
    func removeJobId() {
        self.userDeafaults.set(ViewControllers.jobList, forKey: UserDefaultsName.currentScreen)
        self.userDeafaults.set(nil, forKey: UserDefaultsName.jobId)
    }
}
