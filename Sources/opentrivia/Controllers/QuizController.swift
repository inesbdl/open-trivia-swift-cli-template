import Foundation
import Alamofire

class QuizController {

    private let view = Printers()
    private var score = 0

    func fetchQuestions() {

        let url = "https://opentdb.com/api.php?amount=10"

        AF.request(url).responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                if apiResponse.responseCode == 0 {
                    self.startQuiz(with: apiResponse.results)
                } else {
                    self.view.printError(message: "Erreur api : \(apiResponse.responseCode)")
                }
            case .failure(let error):
                self.view.printError(message: error.localizedDescription)
            }
        }
    }


    // lancer quiz
    private func startQuiz(with questions: [Question]) {

        view.printHeader(text: "SUPER QUIZ  (O _ O)")
        let totalQuestions = questions.count

        for (index, question) in questions.enumerated() {
            askQuestion(question: question, questionNumber: index + 1, totalQuestions: totalQuestions)
        }

        // afficher resultat
        view.printScore(score: score, total: totalQuestions)

        exit(EXIT_SUCCESS)
    }



    // poser question et verif
    private func askQuestion(question: Question, questionNumber: Int, totalQuestions: Int) {

        view.printLine()
        print("\u{001B}[34mQuestion \(questionNumber) sur \(totalQuestions)\u{001B}[0m")
        view.printCategory(text: question.category)
        view.printDifficulty(text: question.difficulty)
        view.printQuestion(text: question.question)

        let shuffledAnswers = question.shuffledAnswers()
        for (index, answer) in shuffledAnswers.enumerated() {
            view.printAnswerOption(index: index + 1, text: answer)
        }

        var userInput: Int?
        repeat {
            print("Entrez le numéro de votre réponse : ", terminator: "")
            if let input = readLine(), let number = Int(input), number > 0, number <= shuffledAnswers.count {
                userInput = number
            } else {
                view.printError(message: "Merci de rentrer une réponse valide.")
            }
        } while userInput == nil

        let userAnswer = shuffledAnswers[userInput! - 1]
        if userAnswer == question.correctAnswer {
            view.printSuccessMessage()
            score += 1
        } else {
            view.printFailureMessage(correctAnswer: question.correctAnswer)
        }
    }
}
