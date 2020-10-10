//
//  TutorialViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/16.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import UIKit

struct TutorialViewModel {
    let tutorial: Tutorial
    
    var dayText: String {
        switch tutorial.status {
        case .start: return "DAY \(tutorial.day)"
        case .ongoing: return "미션 완료 시 \(tutorial.point)P"
        case .finish: return "완료"
        }
    }
    
    var formatterDayText: String {
        return String(format: "%02d", tutorial.day)
    }
    
    var dayTextColor: UIColor {
        switch tutorial.status {
        case .start: return .white
        case .ongoing: return UIColor(rgb: 0xF6CC60)
        case .finish: return .white
        }
    }
    
    var titleText: String {
        switch tutorial.status {
        case .start: return tutorial.title
        case .ongoing: fallthrough
        case .finish: return tutorial.mission
        }
    }
    
    var missionText: String {
        return "미션. \(tutorial.mission)"
    }
    
    var buttonText: String {
        switch tutorial.status {
        case .start: return "시작하기"
        case .ongoing: return "인증하기"
        case .finish: return "완료"
        }
    }
    
    var buttonColor: [UIColor] { // [글자색, 배경색]
        switch tutorial.status {
        case .start: return [.white, .clear]
        case .ongoing: return [.vegeTextBlack, .white]
        case .finish: return [.vegeTextBlack, .white]
        }
    }
    
    var checkImage: UIImage? {
        switch tutorial.status {
        case .start: fallthrough
        case .ongoing: return UIImage(named: "circle")
        case .finish: return UIImage(named: "checkcircle")
        }
    }
}


struct TutorialSaveData {
    static var shared = TutorialSaveData()
    private init() { }
    
    let tutorialIntroduceText = """
채식에 관심은 있는데 어떻게 시작해야 할지 막막한
초보 느리너들을 위한 7일 튜토리얼입니다. 🥦

하루에 15분, 느린채식에서 제공하는 채식과 관련된 컨텐츠를 읽고
미니 미션들을 완료해보세요. 💪

7일 간의 튜토리얼을 완료하고 나면 책 1권 분량의 지식과 함께
느리너님에게 맞는 채식 스타일을 찾게 됩니다!
"""
    var tutorialList = [
        Tutorial(imageName: "VegetableBackground", day: 1, title: "채식에 대한 오해와 진실",
                 mission: "채식 인플루언서 1명 팔로우", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 2, title: "채식의 타입을 알아보자",
                 mission: "나에게 맞는 채식 한끼 도전", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 3, title: "쉽게 구할 수 있는 대체 식재료",
                 mission: "장바구니에 비건 상품 담기", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 4, title: "비건뷰티에 대해서 알아보자",
                 mission: "내가 쓰는 화장품 분석하기", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 5, title: "한국에서 채식을 한다는 것",
                 mission: "주변 비건 식당/베이커리 가보기", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 6, title: "채식이 지구를 살릴 수 있을까?",
                 mission: "장바구니와 텀블러 사용하기", point: 20, status: .start),
        Tutorial(imageName: "salmon_picture", day: 7, title: "완전하지 않아도 괜찮아",
                 mission: "챌린지 1개 시작하기", point: 20, status: .start)
    ]
}
