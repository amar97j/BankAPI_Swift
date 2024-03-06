import UIKit
import SnapKit

class ViewController: UIViewController {

    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 12
        return button
    }()

    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.cornerRadius = 12
        return button
    }()

    let topRightContainerView: UIView = {
        let view = UIView()
        return view
    }()

    let topRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kfhLogo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    let topRightLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to KFH"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = UIColor.systemBackground

     
        let backgroundColorView = UIView()
        backgroundColorView.backgroundColor = UIColor.systemGray5
        view.addSubview(backgroundColorView)
        backgroundColorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        backgroundColorView.addSubview(visualEffectView)
        visualEffectView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)

        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)

        view.addSubview(topRightContainerView)
        topRightContainerView.addSubview(topRightImageView)
        topRightContainerView.addSubview(topRightLabel)
        topRightContainerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(100)
            make.height.equalTo(120)
        }

        topRightImageView.snp.makeConstraints { make in
                   make.top.leading.trailing.equalToSuperview()
                   make.height.equalTo(topRightImageView.snp.width)
               }

        topRightLabel.snp.makeConstraints { make in
            make.centerX.equalTo(topRightContainerView)
            make.centerY.equalTo(topRightContainerView).offset(-80)
        }
    }

    @objc private func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }

    @objc private func signInButtonTapped() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }
}
