//
//  FileKitManager.swift
//  LyricsEasy
//
//  Created by David Hu on 2017/1/24.
//  Copyright © 2017年 David Hu. All rights reserved.
//

import Foundation
import FileKit

public struct LyricsFile {
    var basicPath:String = ""
    var lyricsTitle:String = ""
    var lyricsContent:String = ""
    var lyricsContentForShow:String = ""
    
}

class FileKitManager: NSObject {
    let lpath = Path("~")
    
    let textFiles = Path.userDesktop.find(searchDepth: 5) { path in
        path.pathExtension == "txt"
    }
}
