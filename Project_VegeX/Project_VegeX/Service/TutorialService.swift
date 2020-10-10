//
//  TutorialService.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/19.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

struct TutorialService {
    static let shared = TutorialService()
    private init() { }
    
    func getPresentTutorial(completion: @escaping(Tutorial) -> Void) {
        var presentTutorial: Tutorial!
        for tutorial in TutorialSaveData.shared.tutorialList {
            if tutorial.status != .finish {
                presentTutorial = tutorial
                break
            }
            presentTutorial = tutorial
        }
        completion(presentTutorial)
    }
    
    func setTutorial(to tutorial: Tutorial, status: TutorialStatus) {
        let index = tutorial.day - 1
        TutorialSaveData.shared.tutorialList[index].status = status
    }
}
