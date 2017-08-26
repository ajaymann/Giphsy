//
//  SearchController.swift
//  Giphsy
//
//  Created by Ajay Mann on 8/26/17.
//  Copyright © 2017 Ajay Mann. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class SearchController: UIViewController {
  
  let disposeBag = DisposeBag()
  var searchViewModel: SearchViewModel!
  
  let searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    return searchBar
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    observeChanges()
  }
  
  override func viewWillLayoutSubviews() {
    setupViews()
  }
  
  func setupViews() {
    //Setup Search
    view.addSubview(searchBar)
    searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    searchBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
  }
  
  func observeChanges() {
    searchViewModel = SearchViewModel()
    
    var searchPath: Observable<String> {
      return searchBar
        .rx
        .text
        .orEmpty
        .debounce(1, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
        .filter{!$0.isEmpty}
    }
    
    searchViewModel.searchQueryPath = searchPath
    
    searchViewModel.galleries.asObservable().subscribe(onNext: { gallery in
      print(gallery.first ?? "Nothing nothing")
    }).addDisposableTo(disposeBag)
    
  }

}

