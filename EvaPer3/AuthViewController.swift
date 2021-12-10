import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var ingresarButton: UIButton!
    
    @IBOutlet weak var registrarButton: UIButton!
    
    @IBOutlet weak var recuperarButton: UIButton!
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 13.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 13.0

        ingresarButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        ingresarButton.layer.cornerRadius = 25.0
        ingresarButton.tintColor = UIColor.black
        
        registrarButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        registrarButton.layer.cornerRadius = 25.0
        registrarButton.tintColor = UIColor.black
        
        title = "Login"
        
        Analytics.logEvent("InitScreen", parameters: ["message": "Integracon de Firebase completa"])
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func ingresarButtonAction(_ sender: MenuGoPlaceViewController) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    if let _ =  authResult {
                        self?.performSegue(withIdentifier: "loginToHomeSegue", sender: nil)
                        return
                    } else {
                        let alertController = UIAlertController(title: "Error", message: "Credenciales no existentes", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        self?.present(alertController, animated: true, completion: nil)
                        return}
                }
            }
        }
    }
    
    @IBAction func registrarButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func forgotPassButton_Tapped(_ sender: Any) {
    }
}

