// To parse the JSON, add this file to your project and do:
//
//   let posts = try? newJSONDecoder().decode(Posts.self, from: jsonData)

import Foundation

struct Post: Codable {
    let tags: [String]
    let owner: Owner
    let isAnswered: Bool
    let viewCount, answerCount, score, lastActivityDate: Int
    let creationDate: Int
    let lastEditDate: Int?
    let questionID: Int
    let link: String
    let title, body: String
    let acceptedAnswerID, closedDate: Int?
    let closedReason: String?
    
    enum CodingKeys: String, CodingKey {
        case tags, owner
        case isAnswered = "is_answered"
        case viewCount = "view_count"
        case answerCount = "answer_count"
        case score
        case lastActivityDate = "last_activity_date"
        case creationDate = "creation_date"
        case lastEditDate = "last_edit_date"
        case questionID = "question_id"
        case link, title, body
        case acceptedAnswerID = "accepted_answer_id"
        case closedDate = "closed_date"
        case closedReason = "closed_reason"
    }
}
