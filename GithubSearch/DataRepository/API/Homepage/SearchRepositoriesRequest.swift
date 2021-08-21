import Foundation
import ObjectMapper

open class SearchRepositoriesRequestHeader: Mappable {
    public var accept: String?
    
    public init(accept: String) {
        self.accept = accept
    }
    
    public required init?(map: Map) { }
    
    open func mapping(map: Map) {
        accept <- map["accept"]
    }
}

open class SearchRepositoriesRequestQuery: Mappable {
    var q: String?
    var sort: String?
    var order: String?
    var per_page: Int?
    var page: Int?
    
    public init(
        q: String,
        sort: String,
        order: String,
        per_page: Int,
        page: Int
    ) {
        self.q = q
        self.sort = sort
        self.order = order
        self.per_page = per_page
        self.page = page
    }
    
    public required init?(map: Map) { }
    
    open func mapping(map: Map) {
        q <- map["q"]
        sort <- map["sort"]
        order <- map["order"]
        per_page <- map["per_page"]
        page <- map["page"]
    }
}
