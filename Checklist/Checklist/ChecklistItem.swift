//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Roxane Amory on 17.10.2019.
//  Copyright © 2019 Roxane Amory. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
