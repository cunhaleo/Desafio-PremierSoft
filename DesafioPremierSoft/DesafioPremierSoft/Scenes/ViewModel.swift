//
//  ViewModel.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import Foundation

class ViewModel {
    
    var separatedCandidates: [[String.SubSequence]]  = []
    
    var apiCount: Int = 0
    var iosCount: Int = 0
    var qaCount: Int = 0
    
    var apiSumAge: Int = 0
    
    func getData(){
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                let candidates = contents.split(whereSeparator: \.isNewline)
                for candidate in candidates {
                    separatedCandidates.append(candidate.split(separator: ";"))
                }
                print(separatedCandidates)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func getCandidatesPercentage () {
        apiCount = 0
        iosCount = 0
        qaCount = 0
        
        apiSumAge = 0
        
        for candidate in separatedCandidates  {
            
            
            if candidate[1] == "API .NET" {
                apiCount += 1
                apiSumAge = apiSumAge + makeFirstWordAnInteger(candidate[2])
            }
            else if candidate[1] == "iOS" {
                iosCount += 1
            }
            else if candidate[1] == "QA" {
                qaCount += 1
            }
            else {
                print("Trilha Nao Identificada")
            }
            print("qa = \(qaCount), ios = \(iosCount), api = \(apiCount)")
        }
     
    }
    
    func makeFirstWordAnInteger(_ myString: String.SubSequence) -> Int {
        
            if let firstWord = myString.components(separatedBy: " ").first {
                let myAge = Int(firstWord)
                return myAge ?? 0
            }
        return 0
    }
}
 
