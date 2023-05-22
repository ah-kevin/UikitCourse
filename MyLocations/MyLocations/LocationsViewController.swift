//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by bjke on 2023/5/22.
//

import CoreData
import CoreLocation
import UIKit

class LocationsViewController: UITableViewController {
  var managedObjectContext: NSManagedObjectContext!
  var locations = [Location]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // 1
    let fetchRequest = NSFetchRequest<Location>()
    // 2
    let entity = Location.entity()
    fetchRequest.entity = entity
    // 3
    let sortDescriptor = NSSortDescriptor(
      key: "date",
      ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    do {
      // 4
      locations = try managedObjectContext.fetch(fetchRequest)
    } catch {
      fatalCoreDataError(error)
    }
  }

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return locations.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "LocationCell",
      for: indexPath)

    let location = locations[indexPath.row]

    let descriptionLabel = cell.viewWithTag(100) as! UILabel
    descriptionLabel.text = location.locationDescription

    let addressLabel = cell.viewWithTag(101) as! UILabel
    if let placemark = location.placemark {
      var text = ""
      if let tmp = placemark.subThoroughfare {
        text += tmp + " "
      }
      if let tmp = placemark.thoroughfare {
        text += tmp + ", "
      }
      if let tmp = placemark.locality {
        text += tmp
      }
      addressLabel.text = text
    } else {
      addressLabel.text = ""
    }
    return cell
  }

  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       // Return false if you do not want the specified item to be editable.
       return true
   }
   */

  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           // Delete the row from the data source
           tableView.deleteRows(at: [indexPath], with: .fade)
       } else if editingStyle == .insert {
           // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
       }
   }
   */

  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

   }
   */

  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
       // Return false if you do not want the item to be re-orderable.
       return true
   }
   */

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
   }
   */
}
