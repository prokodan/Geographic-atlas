#  Geographic atlas
## Internship project

### Description

-implemented frameworks via **SPM**: *Alamofire, SnapKit* 
- all required features for both screens are implemented;
- no runtime crashes being catched
- API calls are made via Alamofire: firsScreen fetching all countries and the second sceen fetches country via cca2 code of selected country
- all advanced features are listed in **Advanced** section with number that was listed in test assignment. Video / animation materials can be recodred, if needed contacting me via telegram;
- all found but existing bugs are listed in the **Bugs** section

### Advanced

- Programmatic layout was used (firstly Autolayout only, later SnapKit); (1)
- first and second screen are hande the current device and changing it's height properties of some UI elements; (3)
- Collapsing / expanding animation handling; (4)
- Label with capital coordinates value opens the link in browser with capital location. If there is no capital in model data it opens country coordinates handled by the model;(10)
- Pushes feature is impleneted. It shows a random country data with all data from the model (including flag picture). By tapping it follows to the country details screen filled with data&. (11)

### Bugs

- constant button height constraint causing collection view to recalculate it's sizeForItem and was disabled to match the UI design;
- interacted cell (opened and closed once) after dequing the cell (while user scrolls the cells down and the goes back) shows it's detail view above the cell right before user tapps the cell again
