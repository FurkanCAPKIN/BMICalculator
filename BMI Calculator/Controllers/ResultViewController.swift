import UIKit

class ResultViewController: UIViewController 
{
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) 
    {
    //Recalculate butonuna basıldığında çağrılır ve calculate ekrananı geri döner.
        dismiss(animated: true, completion: nil)
        //View controller'ı kapatır.
    }
    

}
