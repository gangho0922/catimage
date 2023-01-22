//
//  CatViewModel.swift
//  catimage
//
//  Created by AnnKangHo on 2023/01/22.
//

import Foundation

protocol CatModelOutput: AnyObject {
    func loadComplete()
}
final class CatViewModel {
    
    private var currentpage = 0
    
    private var limit = 3 * 7
    
    private let service = CatService()
    
    var data: [CatResponse] = []
    
    weak var delegate: CatModelOutput?
    func load() {
        self.service.getCats(page: self.currentpage, limit: self.limit){
            result in
            
            switch result {
            case .failure(let error):
                break
            case .success(let response):
                self.data.append(contentsOf: response)
                self.delegate?.loadComplete()
            }
        }
    }
}
