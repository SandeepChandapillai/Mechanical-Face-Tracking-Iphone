//
//  ViewController2.m
//  airUI
//
//  Created by Sandeep on 8/21/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
@interface ViewController2()
@property (weak, nonatomic) IBOutlet UILabel *MIT;
@end
@implementation ViewController2


-(void)setCount2:(int)count2
{
    _count2 = count2 ;
}

- (IBAction)ExperienceButton:(id)sender
{
    self.MIT.text = [NSString stringWithFormat:@"MIT : %d", self.count2];
    self.count2++ ;
}


- (IBAction)BackUIButton:(id)sender
{
    [self performSegueWithIdentifier:@"backUI" sender:sender];
    

}




// Passing the count ..
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"backUI"])
    {
        if([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            ViewController * vc = [[ViewController alloc] init];
            
            vc =(ViewController *)segue.destinationViewController ;
            
            vc.count = self.count2 ;
            
        }
    }
    
}


///////////////////////////////////////////////////////////////////////
//Starting new Project as continuation


- (IBAction)Day_2_Button:(id)sender
{
    [self performSegueWithIdentifier:@"Day_2" sender:sender];
}


/*
ViewController *vc ;

- (IBAction)backUP:(id)sender
{
     self.count2++;
    [self performSegueWithIdentifier:@"backUI" sender: sender];
    self.count2++ ;
    NSLog(@"Log1 : %d",self.count2);
}

-(void)setCount2:(int)count2
{
    
    _count2 = count2 ;
     NSLog(@"Log2 : %d",self.count2);
    self.MIT.text = [NSString stringWithFormat:@"MIT :  %d",self.count2];
    
    
    if(var1)
    {
        NSLog(@"Log3 : %d",self.count2);
        _count2 = count2 ;
        NSLog(@"TURE");
        
    }
    else
    {
        NSLog(@"Log7 : %d",self.count2);
        _count2 = vc.count ;
          NSLog(@"FALSE");
    }
    self.MIT.text = [NSString stringWithFormat:@"MIT : %d",self.count2];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nextUI"])
    {
        if ([segue.destinationViewController isKindOfClass:[ViewController class]])
        {
            vc = (ViewController *)segue.destinationViewController;
            NSLog(@"Log4 : %d",self.count2);
            self.count2++;
            vc.count = self.count2 ; //Log 4
            
        }
    }
}

bool var1 = true ;

*/
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze = self.body.textStorage;
        }
    }
}
*/
@end
