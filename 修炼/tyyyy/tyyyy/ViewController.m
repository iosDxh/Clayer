//
//  ViewController.m
//  tyyyy
//
//  Created by Mac on 2022/5/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   

   //****************直接用（切割）*************
       UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 50)];
       vi.backgroundColor = [UIColor yellowColor];
       [self.view addSubview:vi];

       UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:vi.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(25, 25)];
       CAShapeLayer *maskLayer = [CAShapeLayer layer];
       maskLayer.fillColor = UIColor.redColor.CGColor;
       maskLayer.frame = vi.bounds;
       maskLayer.path = maskPath.CGPath;
    
     
       vi.layer.mask = maskLayer;
 
    
   
}


@end
