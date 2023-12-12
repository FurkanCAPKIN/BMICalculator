import UIKit

class CalculateViewController: UIViewController 
{
    
    var calculatorBrain = CalculatorBrain()
    // CalculatorBrain struct'ının bir örneğini oluşturur.

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) 
    {
    //heightSlider'ın değeri değiştiğinde çağrılır.
        let height = String(format: "%.2f", sender.value)
        //slider'ın değerini 2 ondalık basamaklı bir String'e dönüştürür.
        heightLabel.text = "\(height)m"
        //heightLabel text'indeki değeri günceller.
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) 
    {
    //wightSlider'ın değeri değiştiğinde çağrılır.
        let weight = String(format: "%.0f", sender.value)
        //slider'ın değerini tam sayı olarak bir String'e dönüştürür.
        weightLabel.text = "\(weight)Kg"
        //weightLabel text'indeki değeri günceller.
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) 
    {
    //calculate butonuna tıklandığında çağrılır.
        let height = heightSlider.value
        //heightSlider değeri height'a atanır
        let weight = weightSlider.value
        //weightSlider değeri weight'a atanır

        calculatorBrain.calculateBMI(height: height, weight: weight)
        /*calculatorBrain nesnesi aracığıyla calculateBMI fonksiyonu çağrılır 
         ve height ile weight parametre olarak gönderilir.*/
        performSegue(withIdentifier: "goToResult", sender: self)
        //goToResult seguesi gerçeklişir ve self(CalculateViewController) gönderir.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
    //Bu fonksiyon segue gerçekleştirilmeden önce çağrılır.
        if segue.identifier == "goToResult" 
        {
        //segue'nin identifier'ı "goToResult" mu diye bakılır.
            let destinationVC = segue.destination as! ResultViewController
            //Segue'nin hedef view controller'ını bir ResultViewController nesnesi olarak cast eder.
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}























