//
//  MasterViewController.h
//  ARSSReader
//
//  Created by Marin Todorov on 29/10/2012.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

<UIActionSheetDelegate>  {}
-(IBAction)showActionSheet:(id)sender;

 
@end

#import <UIKit/UIKit.h>
@class MBProgressHUD;

@interface ViewController : UIViewController {
    MBProgressHUD *HUD;
}

@end