import Foundation
import UIKit
import PlaygroundSupport

public class Seasoning: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let instructionLabel = UILabel()
    
    let oilImage = UIImageView()
    let seasoningImage = UIImageView()
    let plateImage = UIImageView()
    let seasoningPowderImage = UIImageView()
    let seasoningAllPouredImage = UIImageView()
    let doodleImage = UIImageView()

    let plateBody = UIView()
    
    let seasoningFrame = CGRect(x: 125, y: 23, width: 60, height: 130)
    let oilFrame = CGRect(x: 200, y: 23, width: 60, height: 130)
    
    var isDraggingBlock = 0
    var cookingProcess = 0
    
    var isSeasoningPoured = false
    var isOilPoured = false
    
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
        
        instructionLabel.text = "While waiting for the noodles to be ready."
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
        
        seasoningPowderImage.image = UIImage(named: "seasoningpowder.png")
        seasoningPowderImage.frame = CGRect(x: 220, y: 290, width: 60, height: 60)
        seasoningPowderImage.contentMode = .scaleAspectFit
        seasoningPowderImage.alpha = 0
        seasoningPowderImage.isHidden = true
        self.addSubview(seasoningPowderImage)
        
        seasoningAllPouredImage.image = UIImage(named: "seasoningallpoured.png")
        seasoningAllPouredImage.frame = CGRect(x: 220, y: 290, width: 60, height: 60)
        seasoningAllPouredImage.contentMode = .scaleAspectFit
        seasoningAllPouredImage.alpha = 0
        seasoningAllPouredImage.isHidden = true
        self.addSubview(seasoningAllPouredImage)
        
        seasoningImage.image = UIImage(named: "seasoning.png")
        seasoningImage.frame = CGRect(x: 125, y: 23, width: 60, height: 130)
        seasoningImage.contentMode = .scaleAspectFit
        seasoningImage.alpha = 1
        self.addSubview(seasoningImage)
        
        oilImage.image = UIImage(named: "seasoningoil.png")
        oilImage.frame = CGRect(x: 200, y: 23, width: 60, height: 130)
        oilImage.contentMode = .scaleAspectFit
        oilImage.alpha = 1
        self.addSubview(oilImage)
        
        animateInstruction()
    }
    
    func animateInstruction() {
        if(cookingProcess == 0) {
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.isHidden = false
                self.instructionLabel.alpha = 1
                self.animatePlateOnScreen()
            }) { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
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
                self.instructionLabel.text = "Let's prepare seasoning. Drag seasonings into the plate."
            }, completion: nil)
        }
        if(cookingProcess == 2) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Now, Drag seasoning oil into the plate."
            }, completion: nil)
        }
        if(cookingProcess == 3) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)

            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Well done."
            }) { (completion) in
              Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
                  self.animatePlateOffScreen()
              })
            }
        }
    }
    
    func animatePlateOnScreen() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.plateImage.frame = CGRect(x: 160, y: 230, width: 180, height: 180)
        }))
    }
    
    func animatePlateOffScreen() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.plateImage.frame = CGRect(x: 700, y: 230, width: 180, height: 180)
            self.seasoningPowderImage.isHidden = true
            self.seasoningAllPouredImage.frame = CGRect(x: 720, y: 290, width: 60, height: 60)
        }), completion:{ (completion) -> Void in
            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
        })
    }
    
    func animateSeasoningPlate() {
        if(isSeasoningPoured == true) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.seasoningPowderImage.isHidden = false
                self.seasoningPowderImage.alpha = 1
                self.cookingProcess = 2
                self.animateInstruction()
            }, completion: nil)
        }
    }
    
    func animateOilPlate() {
        if(isOilPoured == true) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.seasoningPowderImage.alpha = 0
                self.seasoningAllPouredImage.isHidden = false
                self.seasoningAllPouredImage.alpha = 1
                self.cookingProcess = 3
                self.animateInstruction()
            }, completion: nil)
        }
    }
    
    @objc func checkingForMatch() {
        if seasoningImage.frame.intersects(plateBody.frame) {
            if(cookingProcess == 1) {
                self.putSound()
                seasoningImage.alpha = 0
                seasoningImage.isHidden = true
                isSeasoningPoured = true
                animateSeasoningPlate()
            } else {
                seasoningImage.frame = seasoningFrame
            }
        } else {
            seasoningImage.frame = seasoningFrame
        }

        if oilImage.frame.intersects(plateBody.frame) {
            if(cookingProcess == 2) {
                self.putSound()
                oilImage.alpha = 0
                oilImage.isHidden = true
                isOilPoured = true
                animateOilPlate()
            } else {
                oilImage.frame = oilFrame
            }
        } else {
            oilImage.frame = oilFrame
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if seasoningImage.frame.contains(location) {
                isDraggingBlock = 1
                seasoningImage.center = location
            }
            else if oilImage.frame.contains(location) {
                isDraggingBlock = 2
                oilImage.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
        
            if seasoningImage.frame.contains(location) && isDraggingBlock == 1 {
                seasoningImage.center = location
            }
            else if oilImage.frame.contains(location) && isDraggingBlock == 2 {
                oilImage.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        let liftView = Lift(scene: self)
        PlaygroundPage.current.liveView = liftView
    }
    
}

