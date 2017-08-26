//
//  TagItem.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import Foundation
import Mapper


struct TagItem: Mappable  {
  let name: String
  let accent: String
  init(map: Mapper) throws {
    try name = map.from("name")
    try accent = map.from("accent")
  }
}
