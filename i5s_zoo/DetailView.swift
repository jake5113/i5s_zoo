//
//  DetailView.swift
//  i5s_zoo
//
//  Created by 이종원 on 11/2/23.
//

import SwiftUI

struct DetailView: View {
    
    let selectedZoo: Zoo
    let position: Int
    
    var body: some View {
        Form {
            Section(header: Text("Zoo Detail")) {
                Image("zoo\(position % 10 + 1)")
                    .resizable()
                    .cornerRadius(10.0)
                    .aspectRatio(contentMode: .fit)
                
                Text("분류: \(selectedZoo.cate3_name)")
                Text("이름: \(selectedZoo.name_kor)")
                Text("주소: \(selectedZoo.h_kor_city) \(selectedZoo.h_kor_gu) \(selectedZoo.h_kor_dong)")
            }
        }
    }
}


#Preview {
    DetailView(selectedZoo: zooData[3], position: 1)
}
