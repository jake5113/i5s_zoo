
import SwiftUI

struct Zoo: Codable {
    let cate3_name: String
    let name_kor: String
    
    let h_kor_city: String
    let h_kor_gu: String
    let h_kor_dong: String
}

class ZooStore: ObservableObject {
    @Published var zoos: [Zoo]
    
    init(zoos: [Zoo] = []) {
        self.zoos = zoos
    }
}

var zooData: [Zoo] = loadJson("zoo.json")

struct ContentView: View {
    
    @StateObject var zooStore: ZooStore = ZooStore(zoos: zooData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<zooStore.zoos.count, id:\.self) { i in
                    NavigationLink(value: i) {
                        HStack {
                            Image("zoo\(i % 10 + 1)")
                                .resizable()
                                .cornerRadius(10.0)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50)
                            Text(zooStore.zoos[i].name_kor)
                        }
                    }
                }
            }
            .navigationDestination(for: Int.self) { i in
                DetailView(selectedZoo: zooStore.zoos[i], position: i)
            }
        }
    }
}

#Preview {
    ContentView()
}
