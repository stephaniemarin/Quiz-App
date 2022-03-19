//
//  FeedbackVC.swift
//  IOS_QUIZ
//
//  Created by stephen weber on 3/12/22.
//

import UIKit
import Speech

class FeedbackVC: UIViewController {

    
    @IBOutlet weak var vocalFeedback: UILabel!
    @IBOutlet weak var vocalFeedbacktextview: UITextView!
    
    let audioEng = AVAudioEngine()
    let speechR = SFSpeechRecognizer()
    let req = SFSpeechAudioBufferRecognitionRequest()
    var rTask : SFSpeechRecognitionTask! //request tasks
    
    var isStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func startSpeechRec(){
        let nd = audioEng.inputNode
        let recordF = nd.outputFormat(forBus: 0)
        nd.installTap(onBus: 0, bufferSize: 1024, format: recordF){
            (buffer , _)in self.req.append(buffer)
        }
        
        audioEng.prepare()
        do{
            try audioEng.start()
        }
        catch let err{
            print(err)
        }
        
        rTask = speechR?.recognitionTask(with: req, resultHandler: { (resp , error) in
            guard let rsp = resp else{
            
                print(error.debugDescription)
                
                return
            }
            
            let msg = resp?.bestTranscription.formattedString
            self.vocalFeedbacktextview.text = msg!
            
            var str : String = ""
            for seg in resp!.bestTranscription.segments{
                let indexTo = msg!.index(msg!.startIndex, offsetBy: seg.substringRange.location)
                str = String(msg![indexTo...])
                
            }
            
        })
        print("start")
    }
    
    
    func stopSpeechRec(){
        print("cancel")
        rTask.finish()
        rTask.cancel()
        rTask = nil
        req.endAudio()
        audioEng.stop()
        if audioEng.inputNode.numberOfInputs > 0 {
            audioEng.inputNode.removeTap(onBus: 0)
        }
    }
    
    @IBAction func micButton(_ sender: UIButton) {
        
        isStart = !isStart
        if isStart {
            startSpeechRec()
            sender.setTitle("stop", for: .normal)
        }
        else {
            stopSpeechRec()
            sender.setTitle("start", for: .normal)
        }
    }
    
//    @IBAction func GOTOHERE(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                if let vc = storyboard.instantiateViewController(withIdentifier: "CollectionCenter") as? CollectionVC {
//            self.present(vc,animated:true)
//    }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
