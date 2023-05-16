//
//  Checklist.swift
//  Checklists
//
//  Created by bjke on 2023/5/15.
//

import UIKit

class Checklist: NSObject, Codable {
  var name = ""
  var items = [ChecklistItem]()
  init(name: String) {
     self.name = name
     super.init()
   }
}
