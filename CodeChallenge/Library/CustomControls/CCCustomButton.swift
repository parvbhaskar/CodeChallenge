import UIKit

class CCCustomButton: UIButton {
 
    //MARK: - Inspectable -
    @IBInspectable var cornerRadius: CGFloat = 4.0
    @IBInspectable var borderWidth: CGFloat = 2.0
    @IBInspectable var borderColor: UIColor = CCConstants.Color.themeOrangeColor
    @IBInspectable var shadowColor: UIColor = UIColor.colorWithRedValue(0.0, greenValue: 0.0, blueValue: 0.0, alpha: 0.2)
    @IBInspectable var activeColorBackground: UIColor = CCConstants.Color.themeOrangeColor

    //MARK: - Initialize
    override func awakeFromNib() {
        super.awakeFromNib()

        self.customizeButtonProperties()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    //MARK: - Other
    func customizeButtonProperties() {
        self.updateNormalProperties()
    }

    private func updateNormalProperties() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.backgroundColor = self.activeColorBackground
    }
}
