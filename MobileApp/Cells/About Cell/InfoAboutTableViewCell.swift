
import UIKit

class InfoAboutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var informationTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure() {
        informationTextLabel.text = "Pallavi Naidu is a fashion designer selling designer Womenswear, Tailored Mensware and Wedding Wear. Located in the heart of Bangalore, she has designed custom clothing for the who's who of the city."
    }
    
}
