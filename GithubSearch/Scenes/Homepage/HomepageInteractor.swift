import UIKit
import RxSwift

protocol HomepageBusinessLogic {
    func getSearchData(_ request: Homepage.Search.Request)
}

class HomepageInteractor: NSObject {
    private let APIWorker: HomepageWorkerProtocol
    var presenter: HomepagePresentationLogic?
    
    init(_ apiWorker: HomepageWorkerProtocol){
        APIWorker = apiWorker
    }
}

extension HomepageInteractor: HomepageBusinessLogic {
    func getSearchData(_ request: Homepage.Search.Request) {
        APIWorker.execute(q: request.searchText, sort: "best match", order: "desc", per_page: 30, page: 1) { [unowned self] (callback) in
            switch callback{
            case .success(let response):
                prepareSearchResults(response)
            case .failure(let error):
                presenter?.presentError(.init(message: error.localizedDescription))
            }
        }
    }
    
    private func prepareSearchResults(_ response: SearchRepositoriesResponse) {
        guard let items = response.items, items.count != 0 else {
            presenter?.presentError(.init(message: "No search results"))
            return
        }
        let searchResults = items.map({
            Homepage.Result.init(text: $0.owner?.html_url ?? "")
        })
        presenter?.presentSearchResults(.init(searchResults: searchResults))
    }
}
