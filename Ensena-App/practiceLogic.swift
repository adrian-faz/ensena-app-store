//
//  practiceLogic.swift
//  Ensena-App
//
//  Created by Alumno on 03/05/23.
//

import Foundation

func getPractice(course:String) -> Trivia {
    var words: [Palabra]
    words = cargaPalabras(course: currentCourseId)
    
    var trivia: Trivia = Trivia()
    var questionList: [Trivia.Result] = []
    
    
    for word in words{
        var result = Trivia.Result()
        result.correct = word.word
        result.type = word.type
        result.url = word.fileName
        
        var arrayHelper: [String] = []
        while arrayHelper.count < 3{
            let n = Int.random(in: 0...words.count - 1)
            let randomWord = words[n].word
            if randomWord != word.word && !arrayHelper.contains(randomWord){
                arrayHelper.append(randomWord)
            }
        }
        
        result.incorrectList = arrayHelper
        result.createAnswers()
        questionList.append(result)
    }
    
    trivia.questionList = questionList.shuffled()
    
    return trivia
}
