/*:
 # Welcome !
 Indonesia my country is famous for producing instant noodles, namely **Indomie**.
 
 In this playground, we will explore and learn about Indomie and how to cook it.
*/

import UIKit
import PlaygroundSupport

var view = UIView()

var welcomeView = Welcome(scene: view)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = welcomeView
