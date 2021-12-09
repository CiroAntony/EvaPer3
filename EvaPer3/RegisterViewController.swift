import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBOutlet weak var userRegister: UIButton!
    
    var selectedTipo: String?
    var listOfTipos = ["",""]
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 13.0
        
        lastNameTextField.layer.borderWidth = 1.0
        lastNameTextField.layer.cornerRadius = 13.0
        
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 13.0
        
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 13.0
        
        confirmTextField.layer.borderWidth = 1.0
        confirmTextField.layer.cornerRadius = 13.0
        
        userRegister.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        userRegister.layer.cornerRadius = 25.0
        userRegister.tintColor = UIColor.black
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    @objc func dismissAction(){
        self.view.endEditing(true)
    }
    
    @IBAction func createAccount(_ sender: Any) {
            if let correo = emailTextField.text {
                if let contraseña = passwordTextField.text {
                    if let confirmarContraseña = confirmTextField.text {
                            
                            if (contraseña != confirmarContraseña) {
                                let passAlert = UIAlertController(title: "Aceptar", message: "Error al igualar contraseñas", preferredStyle: .alert)
                                passAlert.addAction(UIAlertAction(title: "Aceptar", style: .default))
                                self.present(passAlert, animated: true, completion: nil)
                                return
                            }
                            
                        Auth.auth().createUser(withEmail: correo, password: contraseña) { authResult, error in guard let _ = authResult?.user, error == nil else {
                                let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al registrar al usuario", preferredStyle: .alert)
                                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                                self.present(alertController, animated: true, completion: nil)
                                return
                            }
                                let alertController = UIAlertController(title: "Registro exitoso", message: "Se ha registrado al usuario correctamente", preferredStyle: .alert)
                                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                                self.present(alertController, animated: true, completion: nil)
                                return
                            }
                        }
                    }
                }
            }
        }
    



    

