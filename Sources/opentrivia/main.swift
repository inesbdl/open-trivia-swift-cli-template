// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// // NB: Replace the `DispatchQueue.main.asyncAfter` with your code.
// // Once the program is done, call `exit(EXIT_SUCCESS)` to exit the program.
DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    // fetchQuestions()
    let controller = QuizController()
    controller.fetchQuestions()
}

// Ne pas sortir du programme directement
// /!\ ne pas enlever
dispatchMain()
