//
//  SearchViewModel.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import Mapper
import Moya_ModelMapper

struct SearchViewModel {
  var searchQueryPath: Observable<String> = Observable.of("")
  
  let provider = RxMoyaProvider<APIService>()
  
  lazy var galleries: Driver<[GalleryItem]> = {
    return self.fetchGalleries().asDriver(onErrorJustReturn: [])
  }()
  
  func fetchGalleries() -> Observable<[GalleryItem]> {
    return searchQueryPath
      .flatMapLatest({ (query) -> Observable<[GalleryItem]> in
        return self.provider.request(.searchGalleries(filter: nil, query: query))
          .debug()
          .filterSuccessfulStatusCodes()
          .mapArray(type: GalleryItem.self)
          .catchErrorJustReturn([GalleryItem]())
      })
  }
}

