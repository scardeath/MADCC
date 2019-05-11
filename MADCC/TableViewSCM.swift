
import UIKit
public
class TableViewSCM: UITableViewController {
    
    // There u go :)
    var identifies = [String]()
    
    struct Objects {
        var sectionName : String!
        var sectionObjects : [String]!
        
    }
    
    var objectsArray = [Objects]()

    override public func viewDidLoad() {
        
        super.viewDidLoad()
        
        objectsArray = [Objects(sectionName: "Supply Chain Managment", sectionObjects: ["Program Mission","Program Objectives","Professional Occupations","Program Faculty","Curriculum Overview"])]
        // _______________________________________________________________
        // HERE, we move to the other views by these big-boys.
        
        identifies = ["ProgramMissionSCM","ProgramObjectivesSCM","ProfessionalOccupationsSCM","ProgramFacultySCM","CurriculumOverviewSCM"]
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellSCM = tableView.dequeueReusableCellWithIdentifier("cellSCM") as UITableViewCell!
        
        cellSCM.textLabel?.text = objectsArray[indexPath.section].sectionObjects[indexPath.row ]
        
        return cellSCM
    }
    // here it counts the values and return accuordinly
    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return objectsArray.count
        // here in this code, it will count how many section we have.
    }
    override public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return objectsArray[section].sectionName
    }
    override public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        //header.contentView.backgroundColor = UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0) //make the background color light blue
        // header.contentView.backgroundColor = UIColor(red: 177, green: 178, blue: 178, alpha: 1)
        header.textLabel!.textColor = UIColor.blackColor()
        
        header.textLabel!.font = UIFont.italicSystemFontOfSize(18)//make the text white
        header.alpha = 2 //make the header transparent
        navigationController!.navigationBar.barTintColor = UIColor.init(red: 177, green: 178, blue: 178, alpha: 1)
        
    }
    public override  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Try to use this later ,dude -> ideentifiesSecond[indexPath.row] + ideentifiesThird[indexPath.row] + ideentifiesFourth[indexPath.row]
        
        let vcName = identifies[indexPath.row]
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController( viewController!, animated: true)
        
    }
    override public func viewWillAppear(animated: Bool) {
        animateTable()
    }
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell1: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell1.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    override public func prepareForSegue(segue: (UIStoryboardSegue!), sender: AnyObject!) {
        if segue.identifier == "segue" {
            
            
        }
    }
}