import Foundation
import UIKit
import PlaygroundSupport

public class Topping: UIView {
    
    var frameWidth = 500
    var frameHeight = 500
    
    let instructionLabel = UILabel()
    let enjoyLabel = UILabel()
    let bonLabel = UILabel()
    
    let plateImage = UIImageView()
    let noodleImage = UIImageView()
    let eggImage = UIImageView()
    let broccoliImage = UIImageView()
    let seafoodImage = UIImageView()
    let tomatoImage = UIImageView()
    let chiliImage = UIImageView()
    let chopsticksImage = UIImageView ()
    let forkImage = UIImageView()
    let doodleImage = UIImageView()
    
    let eggButton = UIButton()
    let broccoliButton = UIButton()
    let seafoodButton = UIButton()
    let tomatoButton = UIButton()
    let chiliButton = UIButton()
    let finishButton = UIButton()
    
    var eggSelected:Bool = false
    var broccoliSelected:Bool = false
    var seafoodSelected:Bool = false
    var tomatoSelected:Bool = false
    var chiliSelected:Bool = false

    
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
        
        instructionLabel.text = "Let's add toppings you want."
        instructionLabel.textColor = UIColor.black
        instructionLabel.frame = CGRect(x: 35, y: -220, width: frameWidth, height: frameHeight)
        instructionLabel.font = UIFont(name: "Arial", size: 18)
        instructionLabel.alpha = 1
        instructionLabel.isHidden = false
        self.addSubview(instructionLabel)
        
        enjoyLabel.text = "Enjoy your INDOMIE."
        enjoyLabel.textColor = UIColor.black
        enjoyLabel.frame = CGRect(x: 100, y: -130, width: frameWidth, height: frameHeight)
        enjoyLabel.font = UIFont(name: "Arial", size: 30)
        enjoyLabel.alpha = 0
        enjoyLabel.isHidden = true
        self.addSubview(enjoyLabel)
        
        bonLabel.text = "Bon Appetite!"
        bonLabel.textColor = UIColor.black
        bonLabel.frame = CGRect(x: 150, y: -180, width: frameWidth, height: frameHeight)
        bonLabel.font = UIFont(name: "Arial", size: 30)
        bonLabel.alpha = 0
        bonLabel.isHidden = true
        self.addSubview(bonLabel)
        
        eggButton.setTitle("Egg", for: .normal)
        eggButton.backgroundColor = UIColor.gray
        eggButton.frame = CGRect(x: 35, y: 55, width: 100, height: 40)
        eggButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        eggButton.layer.cornerRadius = 14.0
        eggButton.addTarget(self, action: #selector(eggButtonPressed), for: .touchUpInside)
        self.addSubview(eggButton)
        
        broccoliButton.setTitle("Broccoli", for: .normal)
        broccoliButton.backgroundColor = UIColor.gray
        broccoliButton.frame = CGRect(x: 145, y: 55, width: 100, height: 40)
        broccoliButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        broccoliButton.layer.cornerRadius = 14.0
        broccoliButton.addTarget(self, action: #selector(broccoliButtonPressed), for: .touchUpInside)
        self.addSubview(broccoliButton)
        
        seafoodButton.setTitle("Seafood", for: .normal)
        seafoodButton.backgroundColor = UIColor.gray
        seafoodButton.frame = CGRect(x: 255, y: 55, width: 100, height: 40)
        seafoodButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        seafoodButton.layer.cornerRadius = 14.0
        seafoodButton.addTarget(self, action: #selector(seafoodButtonPressed), for: .touchUpInside)
        self.addSubview(seafoodButton)
        
        tomatoButton.setTitle("Tomato", for: .normal)
        tomatoButton.backgroundColor = UIColor.gray
        tomatoButton.frame = CGRect(x: 365, y: 55, width: 100, height: 40)
        tomatoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        tomatoButton.layer.cornerRadius = 14.0
        tomatoButton.addTarget(self, action: #selector(tomatoButtonPressed), for: .touchUpInside)
        self.addSubview(tomatoButton)
        
        chiliButton.setTitle("Chili", for: .normal)
        chiliButton.backgroundColor = UIColor.gray
        chiliButton.frame = CGRect(x: 35, y: 105, width: 100, height: 40)
        chiliButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        chiliButton.layer.cornerRadius = 14.0
        chiliButton.addTarget(self, action: #selector(chiliButtonPressed), for: .touchUpInside)
        self.addSubview(chiliButton)
        
        plateImage.image = UIImage(named: "plate.png")
        plateImage.frame = CGRect(x: 120, y: 170, width: 240, height: 240)
        plateImage.contentMode = .scaleAspectFit
        plateImage.alpha = 1
        self.addSubview(plateImage)
        
        noodleImage.image = UIImage(named: "noodle.png")
        noodleImage.frame = CGRect(x: 150, y: 200, width: 180, height: 180)
        noodleImage.contentMode = .scaleAspectFit
        noodleImage.alpha = 1
        self.addSubview(noodleImage)
        
        chiliImage.image = UIImage(named: "chili.png")
        chiliImage.frame = CGRect(x: 170, y: 220, width: 150, height: 150)
        chiliImage.contentMode = .scaleAspectFit
        chiliImage.alpha = 1
        chiliImage.isHidden = true
        self.addSubview(chiliImage)
        
        eggImage.image = UIImage(named: "egg.png")
        eggImage.frame = CGRect(x: 210, y: 270, width: 90, height: 90)
        eggImage.contentMode = .scaleAspectFit
        eggImage.alpha = 1
        eggImage.isHidden = true
        self.addSubview(eggImage)
        
        tomatoImage.image = UIImage(named: "tomato.png")
        tomatoImage.frame = CGRect(x: 250, y: 220, width: 90, height: 90)
        tomatoImage.contentMode = .scaleAspectFit
        tomatoImage.alpha = 1
        tomatoImage.isHidden = true
        self.addSubview(tomatoImage)
        
        broccoliImage.image = UIImage(named: "broccoli.png")
        broccoliImage.frame = CGRect(x: 260, y: 260, width: 40, height: 40)
        broccoliImage.contentMode = .scaleAspectFit
        broccoliImage.alpha = 1
        broccoliImage.isHidden = true
        self.addSubview(broccoliImage)
        
        seafoodImage.image = UIImage(named: "seafood.png")
        seafoodImage.frame = CGRect(x: 270, y: 300, width: 50, height: 50)
        seafoodImage.contentMode = .scaleAspectFit
        seafoodImage.alpha = 1
        seafoodImage.isHidden = true
        self.addSubview(seafoodImage)
        
        chopsticksImage.image = UIImage(named: "servechopsticks.png")
        chopsticksImage.frame = CGRect(x: 380, y: 170, width: 50, height: 240)
        chopsticksImage.contentMode = .scaleAspectFit
        chopsticksImage.alpha = 0
        chopsticksImage.isHidden = true
        self.addSubview(chopsticksImage)
        
        forkImage.image = UIImage(named: "fork.png")
        forkImage.frame = CGRect(x: 35, y: 170, width: 60, height: 240)
        forkImage.contentMode = .scaleAspectFit
        forkImage.alpha = 0
        forkImage.isHidden = true
        self.addSubview(forkImage)
        
        finishButton.setTitle("Finish", for: .normal)
        finishButton.backgroundColor = UIColor.gray
        finishButton.frame = CGRect(x: 350, y: 420, width: 120, height: 50)
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28)
        finishButton.layer.cornerRadius = 14.0
        finishButton.isHidden = true
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        self.addSubview(finishButton)
        
    }
    
    func finish() {
        enjoyLabel.isHidden = false
        bonLabel.isHidden = false
        chopsticksImage.isHidden = false
        forkImage.isHidden = false
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.bonAppetiteSound()
            self.enjoyLabel.alpha = 1
            self.bonLabel.alpha = 1
            self.chopsticksImage.alpha = 1
            self.forkImage.alpha = 1
        })
    }
    
    @objc func eggButtonPressed(sender: UIButton) {
        eggSelected = !eggSelected
        if(eggSelected) {
            self.putSound()
            eggImage.isHidden = false
            eggButton.backgroundColor = UIColor.green
            finishButton.isHidden = false
        } else {
            eggImage.isHidden = true
            eggButton.backgroundColor = UIColor.gray
        }
    }
    
    @objc func broccoliButtonPressed(sender: UIButton) {
        broccoliSelected = !broccoliSelected
        if(broccoliSelected) {
            self.putSound()
            broccoliImage.isHidden = false
            broccoliButton.backgroundColor = UIColor.green
            finishButton.isHidden = false
        } else {
            broccoliImage.isHidden = true
            broccoliButton.backgroundColor = UIColor.gray
        }
    }
    
    @objc func seafoodButtonPressed(sender: UIButton) {
        seafoodSelected = !seafoodSelected
        if(seafoodSelected) {
            self.putSound()
            seafoodImage.isHidden = false
            seafoodButton.backgroundColor = UIColor.green
            finishButton.isHidden = false
        } else {
            seafoodImage.isHidden = true
            seafoodButton.backgroundColor = UIColor.gray
        }
    }
    
    @objc func tomatoButtonPressed(sender: UIButton) {
        tomatoSelected = !tomatoSelected
        if(tomatoSelected) {
            self.putSound()
            tomatoImage.isHidden = false
            tomatoButton.backgroundColor = UIColor.green
            finishButton.isHidden = false
        } else {
            tomatoImage.isHidden = true
            tomatoButton.backgroundColor = UIColor.gray
        }
    }
    
    @objc func chiliButtonPressed(sender: UIButton) {
        chiliSelected = !chiliSelected
        if(chiliSelected) {
            self.putSound()
            chiliImage.isHidden = false
            chiliButton.backgroundColor = UIColor.green
            finishButton.isHidden = false
        } else {
            chiliImage.isHidden = true
            chiliButton.backgroundColor = UIColor.gray
        }
    }
    
    @objc func finishButtonPressed(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.eggButton.alpha = 0
            self.broccoliButton.alpha = 0
            self.seafoodButton.alpha = 0
            self.tomatoButton.alpha = 0
            self.chiliButton.alpha = 0
            self.finishButton.alpha = 0
            self.instructionLabel.alpha = 0
        })
        { (completion) in
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (time) in
                self.stopBgSound()
                self.eggButton.isHidden = true
                self.broccoliButton.isHidden = true
                self.seafoodButton.isHidden = true
                self.tomatoButton.isHidden = true
                self.chiliButton.isHidden = true
                self.finishButton.isHidden = true
                self.instructionLabel.isHidden = true
                self.finish()
          })
        }
    }
}

