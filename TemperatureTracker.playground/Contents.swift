//: Playground - noun: a place where people can play

import UIKit


struct TemperatureTracker {
    
    private(set) var maxTemp: Int
    private(set) var minTemp: Int
    private(set) var totalTemp: Int
    private(set) var totalTempCount: Int
    private(set) var meanTemp: Double
    private(set) var modeHash: [Int:Int]
    private(set) var maxTempCount: Int
    private(set) var mode: Int
    
    init() {
        self.maxTemp = 0
        self.minTemp = -1
        self.totalTemp = 0
        self.totalTempCount = 0
        self.meanTemp = 0
        self.maxTempCount = 0
        self.modeHash = [:]
        self.mode = 0
    }
    
    mutating func insert(temp: Int) {
        totalTempCount += 1
        totalTemp += temp
        meanTemp = totalTempCount == 0 ? 0 : Double(totalTemp)/Double(totalTempCount)
        maxTemp = max(temp,maxTemp)
        minTemp = minTemp == -1 ? temp : min(temp,minTemp)
        (mode,modeHash) = updateModeHash(hash: modeHash, temp: temp)
    }
    
    func getMax() -> Int {
        return maxTemp
    }
    
    func getMin() -> Int {
        return minTemp
    }
    
    func getMean() -> Double {
        return meanTemp
    }
    
    func getMode() -> Int {
        return mode
    }
    
    private mutating func updateModeHash(hash: [Int:Int], temp: Int) -> (Int,[Int:Int]) {
        var hash = hash
        var tempCount: Int? = hash[temp]
        if tempCount == nil {
            tempCount = 1
        } else {
            tempCount! += 1
        }
        hash[temp] = tempCount!
        if tempCount! > maxTempCount {
            mode = temp
            maxTempCount = tempCount!
        }
        return (mode,hash)
    }
    
    mutating func printSummary() {
        print("maxTemp: \(maxTemp)")
        print("minTemp: \(minTemp)")
        print("meanTemp: \(meanTemp)")
        print("mode: \(mode)")
    }
}

var tracker = TemperatureTracker()
tracker.insert(temp: 1)
tracker.insert(temp: 3)
tracker.insert(temp: 6)
tracker.insert(temp: 3)
tracker.insert(temp: 1)
tracker.insert(temp: 3)
tracker.printSummary()


