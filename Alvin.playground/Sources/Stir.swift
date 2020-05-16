import Foundation
import UIKit
import PlaygroundSupport

public class Stir: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let instructionLabel = UILabel()
    
    let plateImage = UIImageView()
    let seasoningAllPouredImage = UIImageView()
    let noodleDrainerImage = UIImageView()
    let noodleImage = UIImageView()
    let chopsticksImage = UIImageView()
    let noodleChopsticksImage = UIImageView()
    let doodleImage = UIImageView()

    let plateBody = UIView()
    
    let drainerFrame = CGRect(x: 50, y: 50, width: 140, height: 140)
    let chopsticksFrame = CGRect(x: 325, y: 50, width: 140, height: 140)
    
    var isDraggingBlock = 0
    var cookingProcess = 0
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        doodleImage.image = UIImage(named: "doodle.png")
        doodleImage.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        doodleImage.contentMode = .scaleAspectFit
        doodleImage.alpha = 0.5
        self.addSubview(doodleImage)
        
        instructionLabel.text = "Now put the noodle on the plate."
        instructionLabel.textColor = UIColor.black
        instructionLabel.frame = CGRect(x: 35, y: -220, width: frameWidth, height: frameHeight)
        instructionLabel.font = UIFont(name: "Arial", size: 18)
        instructionLabel.alpha = 0
        instructionLabel.isHidden = true
        self.addSubview(instructionLabel)
        
        plateImage.image = UIImage(named: "plate.png")
        plateImage.frame = CGRect(x: 700, y: 230, width: 180, height: 180)
        plateImage.contentMode = .scaleAspectFit
        plateImage.alpha = 1
        self.addSubview(plateImage)
        
        plateBody.frame = CGRect(x: 193, y: 265, width: 115, height: 115)
        plateBody.contentMode = .scaleAspectFit
        self.addSubview(plateBody)
        
        seasoningAllPouredImage.image = UIImage(named: "seasoningallpoured.png")
        seasoningAllPouredImage.frame = CGRect(x: 700, y: 290, width: 60, height: 60)
        seasoningAllPouredImage.contentMode = .scaleAspectFit
        seasoningAllPouredImage.alpha = 1
        self.addSubview(seasoningAllPouredImage)
        
        noodleDrainerImage.image = UIImage(named: "noodledrainer.png")
        noodleDrainerImage.frame = CGRect(x: 50, y: 50, width: 140, height: 140)
        noodleDrainerImage.contentMode = .scaleAspectFit
        noodleDrainerImage.alpha = 1
        noodleDrainerImage.isHidden = false
        self.addSubview(noodleDrainerImage)
        
        noodleImage.image = UIImage(named: "noodle.png")
        noodleImage.frame = CGRect(x: 190, y: 260, width: 120, height: 120)
        noodleImage.contentMode = .scaleAspectFit
        noodleImage.alpha = 1
        noodleImage.isHidden = true
        self.addSubview(noodleImage)
        
        chopsticksImage.image = UIImage(named: "chopsticks.png")
        chopsticksImage.frame = CGRect(x: 325, y: 50, width: 140, height: 140)
        chopsticksImage.contentMode = .scaleAspectFit
        chopsticksImage.alpha = 0
        chopsticksImage.isHidden = true
        self.addSubview(chopsticksImage)
        
        noodleChopsticksImage.image = UIImage(named: "noodlechopsticks.png")
        noodleChopsticksImage.frame = CGRect(x: 230, y: 230, width: 140, height: 140)
        noodleChopsticksImage.contentMode = .scaleAspectFit
        noodleChopsticksImage.alpha = 1
        noodleChopsticksImage.isHidden = true
        self.addSubview(noodleChopsticksImage)
        
        animateInstruction()
    }
    
    func animateInstruction() {
        if(cookingProcess == 0) {
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.isHidden = false
                self.instructionLabel.alpha = 1
                self.animatePlateOnScreen()
            }) { (completion) in
               Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                  self.cookingProcess = 1
                  self.animateInstruction()
              })
            }
        }
        if(cookingProcess == 1) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Drag the drainer into the plate."
            }, completion: nil)
        }
        if(cookingProcess == 2) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Now, Stir the noodle."
                self.chopsticksImage.isHidden = false
                self.chopsticksImage.alpha = 1
            }) { (completion) in
              Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                 self.cookingProcess = 3
                 self.animateInstruction()
             })
           }
        }
        if(cookingProcess == 3) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Drag the chopsticks to the plate."
            }, completion: nil)
        }
        if(cookingProcess == 4) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Stir until seasoning is evenly distributed."
            }, completion: nil)
        }
        if(cookingProcess == 5) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Well done."
            })
            { (completion) in
              Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                  self.animationOut()
              })
            }
        }
    }
    
    func animatePlateOnScreen() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.plateImage.frame = CGRect(x: 160, y: 230, width: 180, height: 180)
            self.seasoningAllPouredImage.frame = CGRect(x: 220, y: 290, width: 60, height: 60)
        }))
    }
    
    func animateStirNoodle() {
        noodleChopsticksImage.isHidden = false
        var stir = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            stir += 1
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.noodleChopsticksImage.frame = CGRect(x: 230, y: 100, width: 140, height: 140)
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.noodleChopsticksImage.frame = CGRect(x: 230, y: 230, width: 140, height: 140)
            }, completion: nil)
            
            if stir == 5 {
                timer.invalidate()
                self.cookingProcess = 5
                self.animateInstruction()
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                    self.noodleChopsticksImage.alpha = 0
                }, completion: nil)
                
            }
        }
    }
    
    func animationOut() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.instructionLabel.alpha = 0
            self.plateImage.alpha = 0
            self.noodleImage.alpha = 0
        })
        { (completion) in
          Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
            self.nextScreen()
          })
        }
    }

    @objc func checkingForMatch() {
        if noodleDrainerImage.frame.intersects(plateBody.frame) {
            if(cookingProcess == 1) {
                self.putSound()
                noodleDrainerImage.alpha = 0
                noodleDrainerImage.isHidden = true
                seasoningAllPouredImage.isHidden = true
                noodleImage.isHidden = false
                cookingProcess = 2
                animateInstruction()
            } else {
                noodleDrainerImage.frame = drainerFrame
            }
        } else {
            noodleDrainerImage.frame = drainerFrame
        }
        
        if chopsticksImage.frame.intersects(plateBody.frame) {
            if(cookingProcess == 3) {
                chopsticksImage.isHidden = true
                noodleChopsticksImage.isHidden = false
                noodleChopsticksImage.alpha = 1
                cookingProcess = 4
                animateStirNoodle()
                animateInstruction()
            } else {
                chopsticksImage.frame = chopsticksFrame
            }
        } else {
            chopsticksImage.frame = chopsticksFrame
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if noodleDrainerImage.frame.contains(location) {
                isDraggingBlock = 1
                noodleDrainerImage.center = location
            }
            else if chopsticksImage.frame.contains(location) {
                isDraggingBlock = 2
                chopsticksImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
        
            if noodleDrainerImage.frame.contains(location) && isDraggingBlock == 1 {
                noodleDrainerImage.center = location
            }
            
            else if chopsticksImage.frame.contains(location) && isDraggingBlock == 2 {
                chopsticksImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        let toppingView = Topping(scene: self)
        PlaygroundPage.current.liveView = toppingView
    }
    
}

