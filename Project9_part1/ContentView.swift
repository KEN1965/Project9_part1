//
//  ContentView.swift
//  Project9_part1
//
//  Created by K.Takahama on R 4/12/06.
//

import SwiftUI
//パスとは、「ここから始めて、ここまで線を引き、そこに円を追加する」などの一連の描画命令
//シェイプはパスを使用して作成されるため、パスを理解すれば簡単にシェイプを作成できる
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}
//shapeをカスタマイズ：円弧形状の最も単純なパターン記述
struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {//0度を真上に持っていきたい
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
        //Arcを使用してみる
        Arc(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)//Good
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
