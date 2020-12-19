//
//  Error.swift
//  HomeWork2
//
//  Created by Anna Volkova on 19.12.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

enum NSEntityDescriptionError: Error {
  case cantCreateDescriptionForEntityName
}
