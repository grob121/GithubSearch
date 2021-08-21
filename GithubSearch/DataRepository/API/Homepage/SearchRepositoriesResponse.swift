import Foundation
import ObjectMapper

open class SearchRepositoriesResponse: Mappable {
    public var totalCount: Int?
    public var incomplete_results: Bool?
    public var items: [SearchRepositoriesResponseItem]?
    
    public init(
        totalCount: Int,
        incomplete_results: Bool,
        items: [SearchRepositoriesResponseItem]) {
        self.totalCount = totalCount
        self.incomplete_results = incomplete_results
        self.items = items
    }
    
    public required init?(map: Map) { }
    
    open func mapping(map: Map) {
        totalCount <- map["totalCount"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
}

open class SearchRepositoriesResponseItem: Mappable {
    public var id: Int?
    public var node_id: String?
    public var name: String?
    public var full_name: String?
    public var owner: SearchRepositoriesResponseOwner?
    public var isPrivate: Bool?
    public var html_url: String?
    public var description: String?
    public var fork: Bool?
    public var url: String?
    public var created_at: String?
    public var updated_at: String?
    public var pushed_at: String?
    public var homepage: String?
    public var size: Int?
    public var stargazers_count: Int?
    public var watchers_count: Int?
    public var language: String?
    public var forks_count: Int?
    public var open_issues_count: Int?
    public var master_branch: String?
    public var default_branch: String?
    public var score: Int?
    public var archive_url: String?
    public var assignees_url: String?
    public var blobs_url: String?
    public var branches_url: String?
    public var collaborators_url: String?
    public var comments_url: String?
    public var commits_url: String?
    public var compare_url: String?
    public var contents_url: String?
    public var contributors_url: String?
    public var deployments_url: String?
    public var downloads_url: String?
    public var events_url: String?
    public var forks_url: String?
    public var git_commits_url: String?
    public var git_refs_url: String?
    public var git_tags_url: String?
    public var git_url: String?
    public var issue_comment_url: String?
    public var issue_events_url: String?
    public var issues_url: String?
    public var keys_url: String?
    public var labels_url: String?
    public var languages_url: String?
    public var merges_url: String?
    public var milestones_url: String?
    public var notifications_url: String?
    public var pulls_url: String?
    public var releases_url: String?
    public var ssh_url: String?
    public var stargazers_url: String?
    public var statuses_url: String?
    public var subscribers_url: String?
    public var subscription_url: String?
    public var tags_url: String?
    public var teams_url: String?
    public var trees_url: String?
    public var clone_url: String?
    public var mirror_url: String?
    public var hooks_url: String?
    public var svn_url: String?
    public var forks: Int?
    public var open_issues: Int?
    public var watchers: Int?
    public var has_issues: Bool?
    public var has_projects: Bool?
    public var has_pages: Bool?
    public var has_wiki: Bool?
    public var has_downloads: Bool?
    public var archived: Bool?
    public var disabled: Bool?
    public var license: SearchRepositoriesResponsLicense?
    
    public init() { }
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        id <- map["id"]
        node_id <- map["node_id"]
        name <- map["name"]
        full_name <- map["full_name"]
        owner <- map["owner"]
        isPrivate <- map["private"]
        html_url <- map["html_url"]
        description <- map["description"]
        fork <- map["fork"]
        url <- map["url"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        pushed_at <- map["pushed_at"]
        homepage <- map["homepage"]
        events_url <- map["events_url"]
        size <- map["size"]
        stargazers_count <- map["stargazers_count"]
        watchers_count <- map["watchers_count"]
        language <- map["language"]
        forks_count <- map["forks_count"]
        open_issues_count <- map["open_issues_count"]
        master_branch <- map["master_branch"]
        default_branch <- map["default_branch"]
        score <- map["score"]
        archive_url <- map["archive_url"]
        assignees_url <- map["assignees_url"]
        blobs_url <- map["blobs_url"]
        branches_url <- map["branches_url"]
        collaborators_url <- map["collaborators_url"]
        comments_url <- map["comments_url"]
        commits_url <- map["commits_url"]
        compare_url <- map["compare_url"]
        contents_url <- map["contents_url"]
        contributors_url <- map["contributors_url"]
        deployments_url <- map["deployments_url"]
        downloads_url <- map["downloads_url"]
        events_url <- map["events_url"]
        forks_url <- map["forks_url"]
        git_commits_url <- map["git_commits_url"]
        git_refs_url <- map["git_refs_url"]
        git_tags_url <- map["git_tags_url"]
        git_url <- map["git_url"]
        issue_comment_url <- map["issue_comment_url"]
        issue_events_url <- map["issue_events_url"]
        issues_url <- map["issues_url"]
        keys_url <- map["keys_url"]
        labels_url <- map["labels_url"]
        languages_url <- map["languages_url"]
        merges_url <- map["merges_url"]
        milestones_url <- map["milestones_url"]
        notifications_url <- map["notifications_url"]
        pulls_url <- map["pulls_url"]
        releases_url <- map["releases_url"]
        ssh_url <- map["ssh_url"]
        stargazers_url <- map["stargazers_url"]
        statuses_url <- map["statuses_url"]
        subscribers_url <- map["subscribers_url"]
        subscription_url <- map["subscription_url"]
        tags_url <- map["tags_url"]
        teams_url <- map["teams_url"]
        trees_url <- map["trees_url"]
        clone_url <- map["clone_url"]
        mirror_url <- map["mirror_url"]
        hooks_url <- map["hooks_url"]
        svn_url <- map["svn_url"]
        forks <- map["forks"]
        open_issues <- map["open_issues"]
        watchers <- map["watchers"]
        has_issues <- map["has_issues"]
        has_projects <- map["has_projects"]
        has_pages <- map["has_pages"]
        has_wiki <- map["has_wiki"]
        has_downloads <- map["has_downloads"]
        archived <- map["archived"]
        disabled <- map["disabled"]
        license <- map["license"]
    }
}

open class SearchRepositoriesResponseOwner: Mappable {
    public var login: String?
    public var id: Int?
    public var node_id: String?
    public var avatar_url: String?
    public var gravatar_id: String?
    public var url: String?
    public var received_events_url: String?
    public var type: Int?
    public var html_url: String?
    public var followers_url: String?
    public var following_url: Int?
    public var gists_url: String?
    public var starred_url: String?
    public var subscriptions_url: Int?
    public var organizations_url: String?
    public var repos_url: String?
    public var events_url: String?
    public var site_admin: Bool?

    public init() { }
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        node_id <- map["node_id"]
        avatar_url <- map["avatar_url"]
        gravatar_id <- map["gravatar_id"]
        url <- map["url"]
        received_events_url <- map["received_events_url"]
        type <- map["type"]
        html_url <- map["html_url"]
        followers_url <- map["followers_url"]
        following_url <- map["following_url"]
        gists_url <- map["gists_url"]
        starred_url <- map["starred_url"]
        subscriptions_url <- map["subscriptions_url"]
        organizations_url <- map["organizations_url"]
        repos_url <- map["repos_url"]
        events_url <- map["events_url"]
        site_admin <- map["site_admin"]
    }
}

open class SearchRepositoriesResponsLicense: Mappable {
    public var key: String?
    public var name: String?
    public var url: String?
    public var spdx_id: String?
    public var node_id: String?
    public var html_url: String?

    public init() { }
    
    public required init?(map: Map) { }
    
    public func mapping(map: Map) {
        key <- map["key"]
        name <- map["name"]
        url <- map["url"]
        spdx_id <- map["spdx_id"]
        node_id <- map["node_id"]
        html_url <- map["html_url"]
    }
}

