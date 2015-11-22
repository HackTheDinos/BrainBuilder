//
//  Dinos.swift
//  HeadsUpDino
//
//  Created by Samantha John on 11/22/15.
//  Copyright © 2015 Quadceratops. All rights reserved.
//

import UIKit

class Dinos: NSObject {
    var dinos: [Dino] = []
    private var unseenDinos: [Dino] = []
    private var correctDinos: [Dino] = []
    private var passedDinos: [Dino] = []
    var currentDino: Dino?
    
    override init() {
        super.init()
        
        if let url = NSBundle.mainBundle().URLForResource("descriptions", withExtension: "json"),
            let data = NSData(contentsOfURL: url) {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                    self.parseJson(json)
                } catch {}
        }
        unseenDinos = dinos
    }
    
    
    func correct() {
        if let dino = self.currentDino where correctDinos.last != dino {
            correctDinos.append(dino)
        }
    }
    
    func passed() {
        if let dino = self.currentDino where passedDinos.last != dino {
            passedDinos.append(dino)
        }
    }
    
    func correctDinoNames() -> [String] {
        return self.correctDinos.map { (dino) -> String in
            return dino.name
        }
    }
    
    func passedDinoNames() -> [String] {
        return self.passedDinos.map { (dino) -> String in
            return dino.name
        }
    }
    
    func getNextDino() {
        
        if unseenDinos.count == 0 && passedDinos.count > 0 {
            unseenDinos = passedDinos
            passedDinos = []
        }
        
        let randomIndex = Int(arc4random_uniform(UInt32(unseenDinos.count)))
        self.currentDino = unseenDinos[randomIndex]
        unseenDinos.removeAtIndex(randomIndex)
    }
    
    private func parseJson(json: AnyObject) {
        if let dict = json as? [String : AnyObject], let dinoDicts = dict["dinosaurs"] as? NSArray {
            for dino in dinoDicts  {
                if let dinoInfo = dino as? [String: String] {
                    self.dinos.append(Dino(info: dinoInfo))
                }
            }
        }
    }
}

class Dino: NSObject {
    let name: String
    let tagline: String
    let period: String
    let imageName: String
    init(info: [String: String]) {
        let name = info["name"] ?? ""
        self.name = name
        self.tagline = info["tag"] ?? ""
        self.period = info["period"] ?? ""
        self.imageName = name.lowercaseString
        super.init()
    }
}
