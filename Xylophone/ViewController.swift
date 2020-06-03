import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        print("I got pressed")
        playSound()
    }
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else {return};
        
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // following line is required for the player to work on iOS 11
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
}

