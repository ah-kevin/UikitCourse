//
//  Functions.swift
//  MyLocations
//
//  Created by bjke on 2023/5/18.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(
    deadline: .now() + seconds,
    execute: run)
}
