//
//  ChallengeViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/19.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

struct ChallengeViewModel {
    let challenge: Challenge
    
    var dateText: String{
        switch challenge.status {
        case .finish: fallthrough
        case .prepare: fallthrough
        case .processing:
            return "\(challenge.date) 달성률 : \(challenge.rate)%"
        case .popular:
            return challenge.date
        }
    }
    
    var isAlphaViewHidden: Bool {
        switch challenge.status {
        case .finish: fallthrough
        case .prepare: fallthrough
        case .processing: return false
        case .popular: return true
        }
    }
}

struct ChallengeSaveData {
    static var shared = ChallengeSaveData()
    private init() { }
    
    var proccessingData = [
        Challenge(title: "[러쉬]포장지 없는 고체샴푸 사용하기",
                  cycle: "매일", date: "2020.07.19~07.26", rate: 20,
                  imageName: "01_gochesampoo", status: .processing),
        Challenge(title: "페이크미트 햄버거 맛집 도장깨기",
                  cycle: "주 1회", date: "2020.07.19~07.26", rate: 10,
                  imageName: "02_fakehamburger", status: .processing)]
    
    let popularData = [
        Challenge(title: "[스타벅스] 비건 커스텀 음료 5잔 마시고 별2배 적립",
                  cycle: "주간", date: "2020.07.20~07.31", rate: 0,
                  imageName: "01_starbucks", status: .popular),
        Challenge(title: "[카스] 불금에 친구들과 비건 맥주 파티",
                  cycle: "주간", date: "2020.07.19~07.26", rate: 0,
                  imageName: "02_cass", status: .popular),
        Challenge(title: "1일 1비건 브랜드 찾아보기",
                  cycle: "주간 - 매일", date: "2020.07.22~07.29", rate: 0,
                  imageName: "03_brand", status: .popular),
        Challenge(title: "[CU편의점] 점심시간 비건도시락 챌린지",
                  cycle: "주간 - 주2회", date: "2020.08.01~08.09", rate: 0,
                  imageName: "04_cu", status: .popular),
        Challenge(title: "[연두] 연두 에센스 사용해서 요리하기",
                  cycle: "주간 - 주2회", date: "2020.07.19~07.27", rate: 0,
                  imageName: "05_yeondoo", status: .popular)]
}
