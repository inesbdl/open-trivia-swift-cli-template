import Foundation

struct Question: Codable {

    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }


    func shuffledAnswers() -> [String] {

        var allAnswers = incorrectAnswers + [correctAnswer]
        allAnswers.shuffle()
        
        return allAnswers
    }
}