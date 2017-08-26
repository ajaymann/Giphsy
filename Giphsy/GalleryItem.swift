//
//  GalleryItem.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import Foundation
import Mapper


struct GalleryItem : Mappable {
  let identifier: String
  var images: [ImageItem] = []
  
  init(map: Mapper) throws {
    try identifier = map.from("id")
    try images = map.from("images")
  }
}
