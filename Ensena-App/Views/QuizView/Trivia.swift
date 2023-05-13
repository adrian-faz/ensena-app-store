//  Created by Adrian Martin Hernandez  on 13/11/22.
//

import Foundation

struct Trivia {
    var questionList: [Result]?
    
    struct Result: Identifiable {
        var id: UUID {
            UUID()
        }
        var correct: String?
        var incorrectList: [String]?
        var type: String?
        var url: String?
        var answers: [Answer]?
        
        public mutating func createAnswers() {
            do {
                let right = [Answer(text: try AttributedString(markdown: correct!), isCorrect: true)]
                let incorrects = try incorrectList!.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
               let allAnswers = right + incorrects
                self.answers = allAnswers.shuffled()
            }
            catch {
                print("Error setting answers: \(error)")
            }
        }

    }
}
