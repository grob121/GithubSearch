enum Homepage {
    
    // MARK: Use cases
    enum Search {
        struct Request {
            let searchText: String
        }
        struct Response {
            let searchResults: [Result]
        }
        struct ViewModel {
            let searchResults: [Result]
        }
    }
    
    struct Result {
        let text: String
    }
    
    enum Error {
        struct Response {
            let message: String
        }
        struct ViewModel {
            let message: String
        }
    }
}
