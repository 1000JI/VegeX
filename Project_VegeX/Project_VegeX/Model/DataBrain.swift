//
//  DataBrain.swift
//  Project_VegeX
//
//  Created by Doyoung Song on 7/15/20.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

struct DataBrain {
    
    let challengeTitleVCPopularData: [[String: String]] = [
        ["Image": "01_starbucks", "MissionType": "주간",
         "MainTitle":
            """
            [스타벅스] 비건 커스텀
            음료 5잔마시고 별2배 적립
            """,
         "Date": "2020.07.20~07.31", "like": "125", "comment": "39"],
        
        ["Image": "02_cass",
         "MissionType": "주간",
         "MainTitle":
            """
            [카스] 불금에 친구들과
            비건 맥주 파티
            """,
         "Date": "2020.07.19~07.26",
         "like": "110", "comment": "42"],
        
        ["Image": "03_brand", "MissionType": "주간 - 매일",
         "MainTitle":
            """
            1일 1비건 브랜드 찾아보기
            """,
         "Date": "2020.07.22~07.29",
         "like": "80", "comment": "41"],
        
        ["Image": "04_cu", "MissionType": "주간 - 주2회",
         "MainTitle":
            """
            [CU편의점] 점심시간
            비건도시락 챌린지
            """,
         "Date": "2020.08.01~08.09", "like": "100", "comment": "34"],
        
        ["Image": "05_yeondoo", "MissionType": "주간 - 주2회",
         "MainTitle":
            """
            [연두] 연두 에센스
            사용해서 요리하기
            """,
         "Date": "2020.07.19~07.27", "like": "93", "comment": "21"],
        
        ["Image": "06_burger", "MissionType": "주간",
         "MainTitle":
            """
            페이크미트 햄버거
            맛집 도장깨기
            """,
         "Date": "2020.08.01~08.31", "like": "90", "comment": "15"],
        
        ["Image": "07_monday", "MissionType": "주간 - 주1회",
         "MainTitle":
            """
            #고기 없는 월요일 1기
            """,
         "Date": "2020.07.19~08.16", "like": "63", "comment": "41"],
        
        ["Image": "08_ohnutty", "MissionType": "매일",
         "MainTitle":
            """
            [오넛티] 아침마다
            아몬드우유 마시기
            """,
         "Date": "2020.07.19~07.25", "like": "63", "comment": "26"],
        
        ["Image": "09_festival", "MissionType": "주간",
         "MainTitle":
            """
            [비건 페스티벌] 비건영화
            상영회 예고편 구경하기
            """,
         "Date": "2020.07.18~07.28", "like": "56", "comment": "12"],
        
        ["Image": "10_yogurt", "MissionType": "주간",
         "MainTitle":
            """
            두유캐슈넛 요거트 만들기
            """,
         "Date": "2020.07.19~07.26", "like": "40", "comment": "12"],
    ]
    
    let challengeTitleVCBrandData: [[String: String]] = [
        ["Image": "01_yeondoo", "MissionType": "주간 - 주2회",
        "MainTitle":
           """
           [연두] 연두 에센스
            사용해서 요리하기
           """,
        "Date": "2020.07.19~07.27", "like": "93", "comment": "21"],
        
        ["Image": "02_lotte", "MissionType": "주간 - 주1회",
        "MainTitle":
           """
           [롯데마트] ‘고기 대신’
            6종 활용해서 밥상 차리기
           """,
        "Date": "2020.08.01~08.15", "like": "86", "comment": "22"],
        
        ["Image": "03_oliveyoung", "MissionType": "주간",
        "MainTitle":
           """
           [올리브영] 크루얼티프리
            제품 SNS에 홍보하기
           """,
        "Date": "2020.07.20~07.27", "like": "95", "comment": "32"],
        
        ["Image": "04_cass", "MissionType": "주간",
        "MainTitle":
           """
           [카스] 불금에 친구들과
            비건 맥주 파티
           """,
        "Date": "2020.07.19~07.26", "like": "110", "comment": "42"],
        
        ["Image": "05_ohnutty", "MissionType": "매일",
        "MainTitle":
           """
           [오넛티] 아침마다
            아몬드우유 마시기
           """,
        "Date": "2020.07.19~07.25", "like": "63", "comment": "26"],
        
        ["Image": "06_festival", "MissionType": "주간",
        "MainTitle":
           """
           [비건 페스티벌] 비건영화
            상영회 예고편 구경하기
           """,
        "Date": "2020.07.18~07.28", "like": "56", "comment": "12"],
        
        ["Image": "07_starbucks", "MissionType": "주간",
        "MainTitle":
           """
           [스타벅스] 비건 커스텀음료
            5잔마시고 별2배 적립
           """,
        "Date": "2020.07.20~07.31", "like": "125", "comment": "39"],
        
        ["Image": "08_lemon", "MissionType": "주간 - 주3회",
        "MainTitle":
           """
           [룰루레몬] 일주일 3번,
            요가로 마음 다스리기
           """,
        "Date": "2020.08.01~08.15", "like": "80", "comment": "12"],
        
        ["Image": "09_aveda", "MissionType": "매일",
        "MainTitle":
           """
           [아베다] 잠들기 전
            소이왁스캔들 10분
           """,
        "Date": "2020.07.20~07.26", "like": "92", "comment": "26"],
        
        ["Image": "10_cu", "MissionType": "주간 - 주2회",
        "MainTitle":
           """
           [CU편의점] 점심시간
            비건도시락 챌린지
           """,
        "Date": "2020.08.01~08.09", "like": "100", "comment": "34"],
    ]
    
    let challengeTitleVCRecentData: [[String: String]] = [
        ["Image": "01_monday", "MissionType": "주간 - 주1회",
        "MainTitle":
           """
           #고기 없는 월요일 1기
           """,
        "Date": "2020.07.19~08.16", "like": "63", "comment": "41"],
        
        ["Image": "02_yogurt", "MissionType": "주간",
        "MainTitle":
           """
           두유캐슈넛 요거트 만들기
           """,
        "Date": "2020.07.19~07.26", "like": "40", "comment": "12"],
        
        ["Image": "03_brand", "MissionType": "주간 - 매일",
        "MainTitle":
           """
           1일 1비건 브랜드 찾아보기
           """,
        "Date": "2020.07.22~07.29", "like": "80", "comment": "41"],
        
        ["Image": "04_burger", "MissionType": "주간",
        "MainTitle":
           """
           페이크미트 햄버거
            맛집 도장깨기
           """,
        "Date": "2020.08.01~08.31", "like": "90", "comment": "15"],
        
        ["Image": "05_study", "MissionType": "주간 - 주2회",
        "MainTitle":
           """
           내가 쓰는 화장품 성분표
            공부하기
           """,
        "Date": "2020.07.25~08.08", "like": "48", "comment": "21"],
        
        ["Image": "06_exercise", "MissionType": "주간",
        "MainTitle":
           """
           식단+운동 비건벌크업
            3주 챌린지
           """,
        "Date": "2020.07.20~07.10", "like": "50", "comment": "11"],
        
        ["Image": "07_lunchbox", "MissionType": "주간",
        "MainTitle":
           """
           일주일에 3번
            비건 도시락 싸기
           """,
        "Date": "2020.07.27~08.03", "like": "39", "comment": "12"],
        
        ["Image": "08_lush", "MissionType": "주간",
        "MainTitle":
           """
           [러쉬]포장지 없는
            고체샴푸 사용하기
           """,
        "Date": "2020.07.19~07.31", "like": "92", "comment": "10"],
        
        ["Image": "09_book", "MissionType": "주간 - 매일",
        "MainTitle":
           """
           <아무튼, 비건> 하루에
            5페이지 읽기
           """,
        "Date": "2020.08.01~08.31", "like": "37", "comment": "26"],
        
        ["Image": "10_flogging", "MissionType": "주간",
        "MainTitle":
           """
           우리동네 30분 플로깅
           """,
        "Date": "2020.07.19~07.26", "like": "32", "comment": "8"],
    ]
    
    let tutorialDetailVCData: [[String: String]] = [
        ["Category": "채식에 대한 오해와 진실", "Title": "채식하면 풀만 먹어야 하나요?", "Day": "DAY 1"],
    ]
    
    let tutorialDetailVCContent: [[String: String]] = [
        ["Intro": "회식자리나 여럿이 함께 밥을 먹는 자리에서 ‘채식 하고 있다’라고 하면 주위에서 ‘독한 녀석’ ‘왜 그럼 생선은 먹냐 그건 위선이다’ , ‘어떻게 고기를 안 먹을 수 있느냐’라는 말을 자주 듣습니다. 하지만 저는 저만의 신념을 지니고 있는 평범한 채식주의자이고 이 생활을 5년 동안 지속하고 있습니다. 전 감수성 넘치는 평범한 채식주의자입니다.",
         
         "Q1": "Q. 채식주의로 지내다 보면 영양실조에 걸리지 않나요?",
         "A1": "채식주의에 대한 여러 자료들이 인터넷상에 많이 있는데요. 채식주의에 대한 자료 중에 오로지 야채만을 먹는 '비건'으로 살아가면 섭취할 수 없는 영양분이 있다는 자료들도 가끔 보입니다. 하지만 오늘날에는 단백질을 대체할 수 있는 식품들이 잘 나와 있기 때문에 그런 정보들은 믿을 수 없다고 보시면 됩니다. 현미밥이나 콩, 등을 통해 단백질을 충분히 보충할 수 있습니다. 또한 티모시 블랙웰 책 <생산 관행과 복지>에 따르면 '채식주의 식단은 포화지방과 콜레스테롤을 낮추고 식이섬유, 마그네슘, 포타슘, 비타민 C와 E, 폴산, 카르티노이드, 폴라보노이드, 기타 식물성 화학 물질을 다량으로 함유한다'고 나와 있습니다.",
         
         "Q2": "Q. 눈에 띄는 신체적 변화가 있나요?",
         "A2": "제가 고등학생 때부터 비염이 너무 심했는데 겨울이 되면 이비인후과를 일주일에 세 번씩 가던 사람이었습니다. 하지만 채식을 시작하고부터 비염이 깨끗이 낫고 이제는 병원에도 가지 않습니다. 100% 인과 관계가 있다고 생각하지 않지만, 한의원에 가도 비염환자에게 면역력 향상을 위해 채식을 권유하기도 합니다. 오늘날 고기를 사육하면서 항생제를 많이 사용하게 되는데 이 항생제가 음식에서 사람에게까지 영향을 미친다는 연구결과가 있습니다.",
         
         "Q3": "Q. 마지막으로 전하고 싶은 한마디?",
         "A3": "채식은 환경과 건강을 지키는 일입니다. 환경을 지키는 방법들에는 여러 가지가 있죠. 환경오염 관련 정책 중에는 자동차 홀수제-짝수제, 이산화탄소 배출 줄이기와 같은 것들이 있는 반면에 공장식 축산업에 대한 규제, 음식 관련 정책에 대한 사회적 관심이 적다는 것이 안타까웠습니다.",
         "A3_1": "채식주의자들도 고기를 먹으면 안 된다고 단정짓고 말하는 경우는 거의 없어요. 환경파괴의 요인인 공장식 축산업이 나쁘다고 저항하는 것이지 고기섭취 자체에 반대하는 것은 아닙니다. 여러분들도 주변에 채식주의자가 있다면 그들에게 관심을 가져보세요. 왜 그들이 그런 선택을 하게 되었는지 이해하실 수 있을 겁니다. 이러한 채식주의자들을 아예 다른 사람이라고 생각하지 마시고 자신이 소중하게 생각하는 가치를 위해 노력하는 사람으로 기억해주세요. 모두 그 가치를 지키기 위해 행동하는 방법이 다르듯이 채식주의자도 조금 다를 뿐입니다."
        ]
    ]
    
    let storeHomeCategoryData = ["전체", "식품", "뷰티", ""]
    
    let storeHomeProductData = [
        [
            "main_image": "VegunPizza",
            "title":
            """
            지구의 열을 식혀줄
            비건 피자
            """,
            "description":
            """
            비건베이커리로 유명한 더브레드블루에서
            야심차게 새로 출시한 비건피자. 2주동안
            30% 할인된 착한 가격으로 만나보세요.
            """,
            
            "product_image_1": "The_Bread_Blue",
            "product_title_1": "THE BREAD BLUE",
            "product_description_1": "호두 깜빠뉴",
            "product_price_1": "7,900",
            
            "product_image_2": "VegeLife",
            "product_title_2": "채식생활",
            "product_description_2": "마시는채식 브이퀄귀리 1세트…",
            "product_price_2": "40% 11,900",
        ],
        
        [
            "main_image": "Melixer_Main",
            "title":
            """
            건강한 피부, 건강한 지구를
            위한 시작 멜릭서
            """,
            "description":
            """
            멜릭서는 제품부터 패키징까지, 우리가 가장 잘할
            수 있는 방법으로 일상 생활에서의 건강한 선택지를
            만들어가고 있습니다.
            """,
            
            "product_image_1": "Melixer_Product",
            "product_title_1": "멜릭서",
            "product_description_1": "비건 밸런싱 토너 150ml",
            "product_price_1": "12,000",
            
            "product_image_2": "Hersteller",
            "product_title_2": "Hersteller",
            "product_description_2": "리틀 드롭스 카밍 데이즈 15ml",
            "product_price_2": "24,000",
        ],
        
        [
            "main_image": "VegunTiger_Main",
            "title":
            """
            잔혹함이 없는 패션
            비건타이거 기획전
            """,
            "description":
            """
            비건타이거는 국내 최초의 비건패션브랜드로
            훌륭한 비동물성 소재로 제작된 아름다운
            옷들을 선보이고 있습니다.
            """,
            
            "product_image_1": "VegunTiger",
            "product_title_1": "비건타이거",
            "product_description_1": "타이거 밴드 원피스_블랙",
            "product_price_1": "248,000",
            
            "product_image_2": "Freitag",
            "product_title_2": "프라이탁",
            "product_description_2": "F12 DRAGNET_00187",
            "product_price_2": "322,000",
        ]
    ]
    
    let storeMainBrandData = [
        ["title":"디어달리아", "image": "DeerDalia_Logo"],
        ["title":"세럼카인드", "image": "SerumKind_Logo"],
        ["title":"닐스야드", "image": "NealsYard_Logo"],
        ["title":"올리베리어", "image": "Olivarriet_Logo"],
        
        ["title":"멜릭서", "image": "Melixer_Logo"],
        ["title":"비브", "image": "Beve_Logo"],
        ["title":"본다이시크", "image": "BondiChic_Logo"],
        ["title":"아임프롬", "image": "ImFrom_Logo"],
        
        ["title":"라운지비", "image": "LoungeB_Logo"],
        ["title":"허스텔러", "image": "DeerDalia_Logo"],
        ["title":"아떼", "image": "Athe_Logo"],
        ["title":"언리시아", "image": "UnleAshia_Logo"],
    ]
    
    let challengeProjectTitleData = ["image": "Dining_Main", "title": "‘고기 대신’ 제품 6종 활용해서 밥상 차리기", "date": "2020.08.01(토) ~ 08.15(토) (2주) | 주1회"]
    let challengeProjectSubInfoData = ["challenger": "도전자 수", "challengerNumber": "30명", "tree": "롯데마트와 함께 심은 나무", "treeNumber": "8그루+8그루"]
    let challengeProjectButtonData = ["leftButton": "다른 도전자 확인하기", "rightButton": "친구 초대하기"]
    let challengeProjectDetailData = [
        [
            "title": "[브랜드 소개]",
            "description": "롯데마트가 국내 비건 소비자가 느는 추세에 맞춰 대체육 상품인 ‘고기 대신’ 시리즈를 출시합니다. 고기대신은 콩, 밀에서 추출한 식물성 단백질과 조직을 기반으로 식이섬 유, 전분, 식물성 오일등 자연에서 유래한 재료를 이용하여 진짜 고기의 맛과 질감을 재현한 식물성 대체육입니다. 건강, 환경, 지구의 미래를 생각하는 더 건강하고 맛있는 고단백 식단. 우리 가족을 위해 오늘부터 ‘고기대신’ 하세요!"
        ],
        [
            "title": "[프로젝트 소개]",
            "description": "롯데마트의 고기대신 6종 중 하나를 활용하여 차린 맛있는 집밥을 인증해주세요!"
        ],
        [
            "title": "[프로젝트 보상]",
            "description":
            """
            그린포인트 +100p
            베스트 그리너 10명에게는 롯데마트가 ‘고기대신’ 6종 세트를 쏩니다!
            """
        ],
    ]
    let challengeProjectInstructionData = [
        [
            "title": "[이렇게 찍어주세요!]",
            "image1": "Instruction_01",
            "image2": "Instruction_02",
            "description": "다 차려진 [밥상] 혹은 [가스레인지] 위에서 조리 중인 음식 사진 찍기",
        ],
        [
            "title": "[이렇게 하면 안돼요!]",
            "image1": "Instruction_03",
            "image2": "Instruction_04",
            "description": "요리하는 음식이 보여야하고 음식의 사진이 제대로 잘 찍여야 합니다",],
    ]
    
    let challengeProjectInstructionConditionInfo = [
        """
    인증 가능 요일: 월-일
    인증 가능시간: 24시간
    인증샷 간격: 제한 없음
    사진첩 사용: 불가능
    인증샷 공개: 공개
    """
    ]
    
    let challengeProjectCommentData = [
        [
            "image": "01hy",
            "name": "김희연",
            "date": "2020.03.13 13:23",
            "comment":
            """
            롯데마트까지 가기 귀찮긴 했지만
            의미 있는 챌린지였어요.
            """
        ],
        [
            "image": "02dh",
            "name": "윤다혜",
            "date": "2020.03.16 19:53",
            "comment":
            """
            비건 양념 순살 후라이드 맛있었어요! 굿!!!
            속도 편하고 좋았어요
            """
        ],
        [
            "image": "03jh",
            "name": "이지호",
            "date": "2020.04.01 22:26",
            "comment":
            """
            식비 절약도 되고 건강한 밥 먹어서 좋아요:)
            재미도 있구요
            """
        ],
        [
            "image": "04jw",
            "name": "천지운",
            "date": "2020.04.03 08:31",
            "comment":
            """
            인증을 자꾸 깜빡해서 문제입니다ㅎㅎㅎㅎ
            재미있는 도전이였어요
            """
        ],
        [
            "image": "05dy",
            "name": "송도영",
            "date": "2020.04.08 14:33",
            "comment":
            """
            생애 첫 비건 요리인데 생각보다 괜찮았어요
            """
        ],
    ]
}
