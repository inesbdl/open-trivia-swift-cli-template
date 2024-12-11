import Foundation

struct Printers {


    func printLine() {
    print("\u{001B}[34m---------------------------------------------\u{001B}[0m")
    }

    func printHeader(text: String) {
        print("\u{001B}[35m\(text)\u{001B}[0m")
    }

    func printCategory(text: String) {
        print("\u{001B}[36mCatégorie: \(text)\u{001B}[0m")
    }

    func printDifficulty(text: String) {
        print("\u{001B}[33mDifficulté: \(text.capitalized)\u{001B}[0m")

    }

    func printQuestion(text: String) {
        print("\u{001B}[37mQuestion: \(text)\u{001B}[0m")
    }

    func printAnswerOption(index: Int, text: String) {
        print("\u{001B}[32m\(index). \(text)\u{001B}[0m")
    }

    func printSuccessMessage() {
        print("\u{001B}[32mBonne réponse ! :3\u{001B}[0m")
    }


    func printFailureMessage(correctAnswer: String) {
        print("\u{001B}[31mMauvaise réponse. La bonne réponse était: \(correctAnswer)\u{001B}[0m")
    }


    func printScore(score: Int, total: Int) {

        var messagePerso: String
        if score < 3 {
            messagePerso = "C'est inquiétant d'être aussi nul(le). "
        } else if score < 6 {
            messagePerso = "Peut mieux faire."
        } else if score < 9 {
            messagePerso = "Gros cerveau gg"
        } else {
            messagePerso = "Tu as triché ???"
        }
        print("\u{001B}[34mVous avez \(score) bonnes réponses sur \(total). \(messagePerso)\u{001B}[0m")
    }

    func printError(message: String) {
        
        print("\u{001B}[31mErreur : \(message)\u{001B}[0m")
    }
}
