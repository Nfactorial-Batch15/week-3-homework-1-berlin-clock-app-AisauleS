//
//  BerlinClockLogic.swift
//  BerlinClock
//
//  Created by Aisaule Sibatova on 15.12.2021.
//

import Foundation

class BerlinClock {
    
    func berlinClock(_ hours: Int ,_ minutes: Int,_ seconds: Int) -> String {
        return convertSeconds(seconds) + " " + convertHours(hours) + " " + convertMinutes(minutes)
    }
    
    
    func convertSeconds(_ seconds: Int) -> String {
        return seconds % 2 == 0 ? "Y" : "O"
    }

    func convertHours(_ hours: Int) -> String {
        let fiveHourLamps = hours / 5
        let singleHourLamps = hours % 5
        
        var hoursArr: [String] = []
        hoursArr.append(LampsRow(4, fiveHourLamps, "R"))
        hoursArr.append(LampsRow(4, singleHourLamps, "R"))
        
        return hoursArr.compactMap { $0 as String }.joined()
    }
    
    func convertMinutes(_ minutes: Int) -> String {
        let fiveMinutesLamps = minutes / 5
        let singleMinutesLamps = minutes % 5
        
        var minutesArr: [String] = []
        
        for n in 1...11 {
            minutesArr.append(n <= fiveMinutesLamps ? minuteLampsColour(n) : "O")
        }

        minutesArr.append(LampsRow(4, singleMinutesLamps, "Y"))
        return minutesArr.compactMap { $0 as String }.joined()
    }
    
    func LampsRow(_ totalNumberLamps: Int, _ numberLampsOn: Int, _ lampSymbol: String) -> String {
        var sb: [String] = []
        
        for n in 1...totalNumberLamps {
            sb.append(n <= numberLampsOn ? lampSymbol : "O")
        }

        return sb.compactMap { $0 as String }.joined()
    }
    
    func minuteLampsColour(_ index: Int) -> String {
        return index % 3 == 0 ? "R" : "Y"
    }
    
    func rawBerlinClock(_ hours: Int ,_ minutes: Int,_ seconds: Int) -> String {
        return convertSeconds(seconds) + convertHours(hours) + convertMinutes(minutes)
    }
}
