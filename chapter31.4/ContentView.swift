//
//  ContentView.swift
//  chapter31.4
//
//  Created by HEE TAE YANG on 2020/06/08.
//  Copyright © 2020 yht. All rights reserved.
//
/* 31.4 updating 콜백 액션
updating 콜백 액션은 onChanged와 거의 비슷하나, @GestureState라는 이름의 특별한 프로퍼티 래퍼를 사용한다는 점이 다르다. @GestureState는 표준 @State 프로퍼티 래퍼와 유사하지만, 제스처와 함께 사용되도록 특별히 설계되었다. @GestureState의 가장 큰 차이점은 제스처가 끝나면 @GestureState는 자동으로 원래 상태 값으로 리셋된다는 것이다. 따라서 updating 콜백은 제스처를 사용하는 동안에만 필요한 임시 상태를 저장하는 데 최적이다. updating 액션이 호출될 때마다 다음의 세 가지 인자가 전달된다.
    제스처에 대한 정보가 담겨 있는 DragGesture.Value 인스턴스
    제스처가 바인인되어 있는 @GestureState 프로퍼티에 대한 참조체
    제스처에 해당하는 애니메이션의 현재 상태를 담고 있는 Transaction 객체
*/

import SwiftUI

struct ContentView: View {
    
    @GestureState private var offset: CGSize = .zero
    
    var body: some View {
        
        let drag = DragGesture()
            .updating($offset) {dragValue, state, transaction in
                state = dragValue.translation
        }
        
        return Image(systemName: "hand.point.right.fill")
            .font(.largeTitle)
            .offset(offset)
            .gesture(drag)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
