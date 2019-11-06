//
//  SupportFile.swift
//  iMusic
//
//  Created by 黄宇杰 on 2019/11/5.
//  Copyright © 2019 黄宇杰. All rights reserved.
//

let info = ["播放列表", "艺人", "专辑", "歌曲"]
let songs = ["Galway Girl", "Photograph", "YELLOW", "烟袋斜街"]

struct Current {
    static var index: Int!
    static var songName: String! {
        get
        {
            return songs[index]
        }
    }
}