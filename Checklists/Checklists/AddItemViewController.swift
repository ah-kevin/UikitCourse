//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by bjke on 2023/5/10.
//

import UIKit

class AddItemViewController: UITableViewController {
  // MARK: - Actions
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func done() {
    navigationController?.popViewController(animated: true)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
  }
}
