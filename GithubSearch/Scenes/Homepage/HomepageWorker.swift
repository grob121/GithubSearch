import Foundation
import Alamofire
import RxSwift
import ObjectMapper

protocol HomepageWorkerProtocol {
    func execute(
       q: String,
       sort: String,
       order: String,
       per_page: Int,
       page: Int,
       callback: @escaping (Swift.Result<SearchRepositoriesResponse, Error>) -> Void)
}

class HomepageWorker: HomepageWorkerProtocol {
     func execute(
        q: String,
        sort: String,
        order: String,
        per_page: Int,
        page: Int,
        callback: @escaping (Swift.Result<SearchRepositoriesResponse, Error>) -> Void) {
        
        let searchRequestQuery = SearchRepositoriesRequestQuery(
            q: q,
            sort: sort,
            order: order,
            per_page: per_page,
            page: page)
        
        let searchRequestHeaders = SearchRepositoriesRequestHeader(accept: "application/vnd.github.v3+json")
        
        Alamofire.request(
            Router.baseURL + Router.Endpoints.searchEndpoint,
            method: .get,
            parameters: searchRequestQuery.toJSON(),
            encoding: URLEncoding.queryString,
            headers: searchRequestHeaders.toJSON().mapValues { String(describing: $0) })
            .responseJSON { response in
            switch response.result {
                case .success(_):
                    let response = Mapper<SearchRepositoriesResponse>().map(JSONObject: response.result.value)
                    callback(.success(response ?? SearchRepositoriesResponse(totalCount: 0, incomplete_results: true, items: [])))
                case .failure(let error):
                    callback(.failure(error))
            }
        }
    }
}

