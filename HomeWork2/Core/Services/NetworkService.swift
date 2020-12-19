//
//  NetworkService.swift
//  HomeWork2
//
//  Created by Anna Volkova on 19.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class NetworkService {
    func loadData(from url: URL, completion: @escaping (_ data: Data?,_ error: Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }
        task.resume()
    }
}
