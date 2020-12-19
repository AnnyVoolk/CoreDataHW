//
//  JobScreenList.swift
//  HomeWork2
//
//  Created by Anna Volkova on 01.10.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import SwiftUI
import OtusUI

struct JobsScreenList: View {
    
    @ObservedObject var viewModel: JobsViewModel
    @EnvironmentObject private var navViewModel: NavControllerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.jobList) { job in
                JobsScreenJobCell(
                    title: job.title ?? "",
                    description: "Company: \(job.company ?? "")") .onAppear() {
                        if self.viewModel.jobList.isLast(job) {
                        self.viewModel.upGreatPage()
                        self.viewModel.fetchJobs()
                    }
                }.onTapGesture {
                    self.navViewModel.push(CurrentJobScreen(job: job))
                }
            }
            if viewModel.isPageLoading {
                ActivityIndicatorView(style: .medium)
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
