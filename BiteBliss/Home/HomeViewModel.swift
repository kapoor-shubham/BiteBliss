//
//  HomeViewModel.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import Foundation
 
class HomeViewModel {
    
    var categoryAPIResponse: ((_ responseData: [CategoriesResponseModel.Category]?, _ err: Error?) -> Void)?
    var categories = [CategoriesResponseModel.Category]()
    
    func getCategories() {
        let endPoint = Endpoint(path: .categories, httpMethod: .get, headers: nil, body: nil, qeryItems: nil)
        
        NetworkManager.shared.apiRequest(for: CategoriesResponseModel.self, from: endPoint) { [weak self] response in
            guard let weakSelf = self else { return }
            switch response {
            case .success(let result):
                guard let categoryAPIResponse = result else { return }
                weakSelf.categoryAPIResponse?(categoryAPIResponse.categories, nil)
            case .failure(let err):
                weakSelf.categoryAPIResponse?(nil, err)
            }
        }
    }
    
    func getSearchResponse(text: String) {
        let endPoint = Endpoint(path: .search, httpMethod: .get, headers: nil, body: nil, qeryItems: nil)
        
        NetworkManager.shared.apiRequest(for: CategoriesResponseModel.self, from: endPoint) { [weak self] response in
            guard let weakSelf = self else { return }
            switch response {
            case .success(let result):
                guard let categoryAPIResponse = result else { return }
                weakSelf.categoryAPIResponse?(categoryAPIResponse.categories, nil)
            case .failure(let err):
                weakSelf.categoryAPIResponse?(nil, err)
            }
        }
    }
}
