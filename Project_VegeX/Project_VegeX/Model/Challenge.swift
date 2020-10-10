//
//  Challenge.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/19.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

enum ChallengeStatus {
    case prepare
    case processing
    case popular
    case finish
}

struct Challenge {
    let title: String
    let cycle: String
    let date: String
    let rate: Int
    let imageName: String
    var status: ChallengeStatus
}
