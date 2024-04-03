//
//  HomeViewModel.swift
//  BiteBliss
//
//  Created by Shubham Kapoor on 28/03/24.
//

import Foundation
 
class HomeViewModel {
    
    var categoryAPIResponse: ((_ responseData: [CategoriesResponseModel.Category]?, _ err: Error?) -> Void)?
    var searchAPIResponse: ((_ responseData: SearchResponseModel?, _ err: Error?) -> Void)?
    
    /// Get Categories from API
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
    
    
    /// Get Search Response from API
    func getSearchResponse(searchText: String) {
        
        let queryParams = [URLQueryItem(name: "s", value: searchText)]
        let endPoint = Endpoint(path: .search, httpMethod: .get, headers: nil, body: nil, qeryItems: queryParams)
        
        NetworkManager.shared.apiRequest(for: SearchResponseModel.self, from: endPoint) { [weak self] response in
            guard let weakSelf = self else { return }
            switch response {
            case .success(let result):
                guard let searchAPIResponse = result else { return }
                weakSelf.searchAPIResponse?(searchAPIResponse, nil)
            case .failure(let err):
                weakSelf.categoryAPIResponse?(nil, err)
            }
        }
    }
}
