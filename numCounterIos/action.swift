//
//  action.swift
//  numCounterIos
//
//  Created by Ryosuke Nishigami on 2018/09/08.
//  Copyright © 2018年 tapigami. All rights reserved.
//

import Foundation
import RealmSwift

class Action: Object {
    @objc dynamic var title = ""
    @objc dynamic var commit = 0
}
