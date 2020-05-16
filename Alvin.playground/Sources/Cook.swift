import Foundation
import UIKit
import PlaygroundSupport

public class Cook: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let instructionLabel = UILabel()
    let turnOnStoveLabel = UILabel()
    
    let oilImage = UIImageView()
    let seasoningImage = UIImageView()
    let rawNoodleImage = UIImageView()
    let glass1Image = UIImageView()
    let glass2Image = UIImageView()
    let stoveBodyImage = UIImageView()
    let stoveButtonOff = UIButton()
    let stoveButtonOn = UIButton()
    
    let panImage = UIImageView()
    let halfWaterPanImage = UIImageView()
    let fullWaterPanImage = UIImageView()
    let boiledWaterPanImage = UIImageView()
    let noodlePanImage = UIImageView()
    let doodleImage = UIImageView()

    let panBody = UIView()
    
    let rawNoodleFrame = CGRect(x: 35, y: 35, width: 80, height: 150)
    let seasoningFrame = CGRect(x: 125, y: 23, width: 60, height: 130)
    let oilFrame = CGRect(x: 200, y: 23, width: 60, height: 130)
    let glass1Frame = CGRect(x: 275, y: 35, width: 60, height: 150)
    let glass2Frame = CGRect(x: 350, y: 35, width: 60, height: 150)
    
    var isDraggingBlock = 0
    var waterDragged = 0
    var waterBoiled = false
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
        
        instructionLabel.text = "Let's cook. Drag two glasses of water to the pan."
        instructionLabel.textColor = UIColor.black
        instructionLabel.frame = CGRect(x: 45, y: -220, width: frameWidth, height: frameHeight)
        instructionLabel.font = UIFont(name: "Arial", size: 18)
        instructionLabel.alpha = 1
        self.addSubview(instructionLabel)
        
        stoveBodyImage.image = UIImage(named: "stovebody.png")
        stoveBodyImage.frame = CGRect(x: 115, y: 305, width: 220, height: 180)
        stoveBodyImage.contentMode = .scaleAspectFit
        stoveBodyImage.alpha = 1
        self.addSubview(stoveBodyImage)
        
        stoveButtonOff.setImage(UIImage(named: "stovebuttonoff.png"), for: .normal)
        stoveButtonOff.frame = CGRect(x: 208, y: 410, width: 30, height: 40)
        stoveButtonOff.isEnabled = false
        stoveButtonOff.addTarget(self, action: #selector(stoveButtonOffPressed), for: .touchUpInside)
        self.addSubview(stoveButtonOff)
        
        stoveButtonOn.setImage(UIImage(named: "stovebuttonon.png"), for: .normal)
        stoveButtonOn.frame = CGRect(x: 208, y: 410, width: 30, height: 40)
        stoveButtonOn.isEnabled = false
        stoveButtonOn.isHidden = true
        self.addSubview(stoveButtonOn)
        
        turnOnStoveLabel.text = "← Click here to turn on the stove."
        turnOnStoveLabel.textColor = UIColor.black
        turnOnStoveLabel.frame = CGRect(x: 240, y: 180, width: frameWidth, height: frameHeight)
        turnOnStoveLabel.font = UIFont(name: "Arial", size: 14)
        turnOnStoveLabel.alpha = 0
        turnOnStoveLabel.isHidden = true
        self.addSubview(turnOnStoveLabel)
        
        panImage.image = UIImage(named: "pan.png")
        panImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        panImage.contentMode = .scaleAspectFit
        panImage.alpha = 1
        self.addSubview(panImage)
        
        halfWaterPanImage.image = UIImage(named: "halfwaterpan.png")
        halfWaterPanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        halfWaterPanImage.contentMode = .scaleAspectFit
        halfWaterPanImage.alpha = 0
        halfWaterPanImage.isHidden = true
        self.addSubview(halfWaterPanImage)
        
        fullWaterPanImage.image = UIImage(named: "fullwaterpan.png")
        fullWaterPanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        fullWaterPanImage.contentMode = .scaleAspectFit
        fullWaterPanImage.alpha = 0
        fullWaterPanImage.isHidden = true
        self.addSubview(fullWaterPanImage)
        
        boiledWaterPanImage.image = UIImage(named: "boiledwaterpan.png")
        boiledWaterPanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        boiledWaterPanImage.contentMode = .scaleAspectFit
        boiledWaterPanImage.alpha = 0
        boiledWaterPanImage.isHidden = true
        self.addSubview(boiledWaterPanImage)
        
        noodlePanImage.image = UIImage(named: "noodlepan.png")
        noodlePanImage.frame = CGRect(x: 150, y: 220, width: 180, height: 180)
        noodlePanImage.contentMode = .scaleAspectFit
        noodlePanImage.alpha = 0
        noodlePanImage.isHidden = true
        self.addSubview(noodlePanImage)
        
        panBody.frame = CGRect(x: 157, y: 282, width: 133, height: 120)
        panBody.contentMode = .scaleAspectFit
        self.addSubview(panBody)
        
        rawNoodleImage.image = UIImage(named: "rawnoodle.png")
        rawNoodleImage.frame = CGRect(x: 35, y: 35, width: 80, height: 150)
        rawNoodleImage.contentMode = .scaleAspectFit
        rawNoodleImage.alpha = 1
        self.addSubview(rawNoodleImage)
        
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
        
        glass1Image.image = UIImage(named: "glass.png")
        glass1Image.frame = CGRect(x: 275, y: 35, width: 60, height: 150)
        glass1Image.contentMode = .scaleAspectFit
        glass1Image.alpha = 1
        self.addSubview(glass1Image)
        
        glass2Image.image = UIImage(named: "glass.png")
        glass2Image.frame = CGRect(x: 350, y: 35, width: 60, height: 150)
        glass2Image.contentMode = .scaleAspectFit
        glass2Image.alpha = 1
        self.addSubview(glass2Image)
    }
    
    func animateInstruction() {
        if(cookingProcess == 1) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Now, turn on the stove."
                self.turnOnStoveLabel.isHidden = false
                self.turnOnStoveLabel.alpha = 1
            }, completion: nil)
        }
        if(cookingProcess == 2) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Wait until the water boils."
            }) { (completion) in
                Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
                    self.waterBoiled = true
                    self.animatePanBoiledWater()
               })
           }
        }
        if(cookingProcess == 3) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Drag the raw noodle into the pan."
            }, completion: nil)
        }
        if(cookingProcess == 4) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 0
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                self.instructionLabel.alpha = 1
                self.instructionLabel.text = "Boil the noodles for 3 minutes."
            }, completion: nil)
        }
    }
    
    func animatePanWater() {
        if(waterDragged == 1) {
            self.pourSound()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.halfWaterPanImage.isHidden = false
                self.halfWaterPanImage.alpha = 1
            }, completion: nil)
        }
        if(waterDragged == 2) {
            self.pourSound()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.fullWaterPanImage.isHidden = false
                self.fullWaterPanImage.alpha = 1
                self.stoveButtonOff.isEnabled = true
                self.cookingProcess = 1
                self.animateInstruction()
            }, completion: nil)
        }
    }
    
    func animatePanBoiledWater() {
        if(waterBoiled == true) {
            self.boiledWaterPanImage.isHidden = false
            self.bubbleSound()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.boiledWaterPanImage.alpha = 1
            })
            { (completion) in
                Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
                     self.cookingProcess = 3
                     self.animateInstruction()
                })
            }
        }
    }
    
    func animateNoodlePan() {
        self.noodlePanImage.isHidden = false
        self.noodlePanImage.alpha = 1
        animatePanOffScreen()
    }
    
    func animatePanOffScreen() {
        panImage.isHidden = true
        halfWaterPanImage.isHidden = true
        fullWaterPanImage.isHidden = true
        boiledWaterPanImage.isHidden = true
        stoveButtonOff.isHidden = true
        UIView.animate(withDuration: 1.0, delay: 3, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
            self.noodlePanImage.center.x = self.frame.midX/2 - 300
            self.stoveButtonOn.center.x = self.frame.midX/2 - 300
            self.stoveBodyImage.center.x = self.frame.midX/2 - 300
        }), completion:{ (completion) -> Void in
            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
        })
    }
    
    @objc func checkingForMatch() {

        seasoningImage.frame = seasoningFrame
        oilImage.frame = oilFrame
        
        if rawNoodleImage.frame.intersects(panBody.frame) {
            if(cookingProcess == 3) {
                self.putSound()
                rawNoodleImage.alpha = 0
                rawNoodleImage.isHidden = true
                cookingProcess = 4
                animateNoodlePan()
                animateInstruction()
            } else {
                rawNoodleImage.frame = rawNoodleFrame
            }
        } else {
            rawNoodleImage.frame = rawNoodleFrame
        }
    
        if glass1Image.frame.intersects(panBody.frame) {
            glass1Image.alpha = 0
            glass1Image.isHidden = true
            glass1Image.frame = CGRect(x: 650, y: 35, width: 60, height: 150)
            waterDragged += 1
            animatePanWater()
        } else {
            glass1Image.frame = glass1Frame
        }
        
        if glass2Image.frame.intersects(panBody.frame) {
            glass2Image.alpha = 0
            glass2Image.isHidden = true
            glass2Image.frame = CGRect(x: 650, y: 35, width: 60, height: 150)
            waterDragged += 1
            animatePanWater()
        } else {
            glass2Image.frame = glass2Frame
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if rawNoodleImage.frame.contains(location) {
                isDraggingBlock = 1
                rawNoodleImage.center = location
            }
            else if seasoningImage.frame.contains(location) {
                isDraggingBlock = 2
                seasoningImage.center = location
            }
            else if oilImage.frame.contains(location) {
                isDraggingBlock = 3
                oilImage.center = location
            }
            else if glass1Image.frame.contains(location) {
                isDraggingBlock = 4
                glass1Image.center = location
            }
            else if glass2Image.frame.contains(location) {
                isDraggingBlock = 5
                glass2Image.center = location
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            if rawNoodleImage.frame.contains(location) && isDraggingBlock == 1 {
                rawNoodleImage.center = location
            }
            else if seasoningImage.frame.contains(location) && isDraggingBlock == 2 {
                seasoningImage.center = location
            }
            else if oilImage.frame.contains(location) && isDraggingBlock == 3 {
                oilImage.center = location
            }
            else if glass1Image.frame.contains(location) && isDraggingBlock == 4 {
                glass1Image.center = location
            }
            else if glass2Image.frame.contains(location) && isDraggingBlock == 5 {
                glass2Image.center = location
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isDraggingBlock = 0
        checkingForMatch()
        
    }
    
    @objc func stoveButtonOffPressed(sender: UIButton) {
        stoveButtonOff.isHidden = true
        stoveButtonOn.isHidden = false
        self.turnOnStoveLabel.isHidden = true
        turnOnStoveLabel.alpha = 0
        cookingProcess = 2
        animateInstruction()
    }
    
    @objc func nextScreen() {
        self.removeFromSuperview()
        let seasoningView = Seasoning(scene: self)
        PlaygroundPage.current.liveView = seasoningView
    }
    
}

