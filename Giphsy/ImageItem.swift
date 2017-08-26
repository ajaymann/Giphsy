//
//  ImageItem.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import Foundation
import Mapper

struct ImageItem : Mappable {
  let identifier: String
  let title: String
  let link: String
  let commentCount: Int
  var tags : [TagItem] = []
  
  
  init(map: Mapper) throws {
    try identifier = map.from("id")
    try title = map.from("title")
    try link = map.from("link")
    try commentCount = map.from("comment_count")
    try tags = map.from("tags")
  }
}
