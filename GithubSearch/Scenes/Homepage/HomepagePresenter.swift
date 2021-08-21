protocol HomepagePresentationLogic {
    func presentSearchResults(_ response: Homepage.Search.Response)
    func presentError(_ response: Homepage.Error.Response)
}

class HomepagePresenter: HomepagePresentationLogic {
    weak var viewController: HomepageDisplayLogic?
    
    func presentSearchResults(_ response: Homepage.Search.Response) {
        viewController?.displaySearchResults(.init(searchResults: response.searchResults))
    }
    
    func presentError(_ response: Homepage.Error.Response) {
        viewController?.displayError(.init(message: response.message))
    }
}
