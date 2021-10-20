//
//  ViewModel.swift
//  DesafioPremierSoft
//
//  Created by Leonardo Cunha on 19/10/21.
//

import Foundation

class ViewModel {
    
    var separatedCandidates: [[String.SubSequence]]  = []
    var arrayCandidates: [[String]] = []
    var sortedArrayCandidates: [[String]] = []
    
    var apiCount: Int = 0
    var iosCount: Int = 0
    var qaCount: Int = 0
    var total: Int = 0
    
    var apiSumAge: Int = 0
    var apiYoungerCandidate: String = " "
    var apiYougerAge: Int = 100
    
    var iosOlderCandidate: String = " "
    var iosOlderAge: Int = 0
    
    var qaSumAge: Int = 0
    var qaAvgAge: Int = 0
    
    var numStates: Int = 0
    
    func getData(){
        if let url = URL(string: "https://raw.githubusercontent.com/premiersoft/AppAcademyChallenge2/main/AppAcademy_Candidates.csv") {
            do {
                let contents = try String(contentsOf: url)
                let candidates = contents.split(whereSeparator: \.isNewline)
                for candidate in candidates {
                    let atribute = candidate.split(separator: ";")
                    separatedCandidates.append(atribute)
                }
                var i: Int = 0
                for candidate in separatedCandidates {
                    arrayCandidates.append(["Candidato \(i)"])
                    for atribute in candidate {
                        arrayCandidates[i].append(String(atribute))
                    }
                    i = i + 1
                }
                arrayCandidates.remove(at: 0)
                print(arrayCandidates)
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func getCandidatesPercentage () {
        numStates = 0
        apiCount = 0
        iosCount = 0
        qaCount = 0
        // API .NET
        apiSumAge = 0
        apiYougerAge = 100
        // IOS
        iosOlderAge = 0
        // QA
        qaSumAge = 0
        qaAvgAge = 0
        
        var statesList = Set<String>()
        
        for candidate in arrayCandidates  {
            
            if candidate[2] == "API .NET" {
                apiCount += 1
                apiSumAge = apiSumAge + makeFirstWordAnInteger(candidate[3])
                if apiYougerAge > makeFirstWordAnInteger(candidate[3]) {
                    apiYougerAge = makeFirstWordAnInteger(candidate[3])
                    apiYoungerCandidate = candidate[1]
                }
                statesList.insert(candidate[4])
            }
            else if candidate[2] == "iOS" {
                iosCount += 1
                if iosOlderAge < makeFirstWordAnInteger(candidate[3]) {
                    iosOlderAge = makeFirstWordAnInteger(candidate[3])
                    iosOlderCandidate = candidate[1]
                }
                statesList.insert(candidate[4])
            }
            else if candidate[2] == "QA" {
                qaCount += 1
                qaSumAge += makeFirstWordAnInteger(candidate[3])
                statesList.insert(candidate[4])
            }
            else {
                print("Trilha Nao Identificada: \(candidate)")
            }
        }
        print(statesList)
        numStates = statesList.count
        qaAvgAge = qaSumAge/qaCount
        total = qaCount + iosCount + apiCount
        print("qa = \(qaCount), ios = \(iosCount), api = \(apiCount), total = \(total)")
    }
    
    func makeFirstWordAnInteger(_ myString: String) -> Int {
        
            if let firstWord = myString.components(separatedBy: " ").first {
                let myAge = Int(firstWord)
                return myAge ?? 0
            }
        return 0
    }
    func sortByAlphabeticalOrder() {
    //    arrayCandidates.sort(by: {$0. > $1.date.timeIntervalSinceNow})
        
    }
}
 
