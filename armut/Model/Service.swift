//
//  Service.swift
//  armut
//
//  Created by Cem Eke on 15.12.2021.
//

import Foundation

struct Service: Codable {
    let id, serviceID: Int?
    let name, longName: String?
    let imageURL: String?
    let proCount: Int?
    let averageRating: Double?
    let completedJobsOnLastMonth: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case serviceID = "service_id"
        case name
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
        case averageRating = "average_rating"
        case completedJobsOnLastMonth = "completed_jobs_on_last_month"
    }
}


// MARK: - Result
struct Result: Codable {
    let allServices, popular: [AllService]
    let posts: [Post]

    enum CodingKeys: String, CodingKey {
        case allServices = "all_services"
        case popular, posts
    }
}

// MARK: - AllService
struct AllService: Codable {
    let id, serviceID: Int
    let name, longName: String
    let imageURL: String?
    let proCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case serviceID = "service_id"
        case name
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
    }
}

// MARK: - Post
struct Post: Codable {
    let title, category: String
    let imageURL: String
    let link: String

    enum CodingKeys: String, CodingKey {
        case title, category
        case imageURL = "image_url"
        case link
    }
}
