//
//  ServiceLocator.swift
//  HomeWork2
//
//  Created by Anna Volkova on 15.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

public protocol IServiceLocator {
    
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

public class ServiceLocator: IServiceLocator {
    
    public static let shared = ServiceLocator()
    
    private init() {}
    
    private var services: [String: Any] = [:]
    
    public func getService<T>(type: T.Type) -> T? {
        return self.services[String(describing: type)] as? T
    }
    
    public func addService<T>(service: T) {
        let type = String(describing: T.self)
        if self.services[type] == nil {
            self.services[type] = service
        }
    }
}
