//
//  ContentView.swift
//  Project9_part1
//
//  Created by K.Takahama on R 4/12/06.
//

import SwiftUI

struct ContentView: View {
    //カスタムパスを描画していきます
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
        //strokeを使用してpathの周りを描画（別の修正方法）
        .stroke(.blue, style: StrokeStyle(lineWidth: 10,lineCap: .round,lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
