//
//  ViewController.m
//  airUI
//
//  Created by Sandeep on 8/21/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"


@interface ViewController()

@property (weak, nonatomic) IBOutlet UILabel *MIT;

@end


@implementation ViewController

-(void)setCount:(int)count
{
    _count = count ;
}
- (IBAction)Action1:(id)sender
{
    self.count++ ;
    
    self.MIT.text = [NSString stringWithFormat:@"MIT : %d" ,self.count];
}


- (IBAction)NextUIButton:(id)sender
{
    [self performSegueWithIdentifier:@"nextUI" sender:sender];
}


// Passing the count ..
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"nextUI"])
    {
        if([segue.destinationViewController isKindOfClass:[ViewController2 class]])
        {
            ViewController2 * vc2 = [[ViewController2 alloc] init];
            
            vc2 =(ViewController2 *)segue.destinationViewController ;
            
            vc2.count2 = self.count ;
            
        }
    }
    
}





/*
ViewController2 *vc2;

-(void)setCount:(int)count
{
    if(var)
    {
    NSLog(@"Log3 : %d",self.count);
    _count = count ;
         NSLog(@"TURE1");
    
    }
    else
    {
        NSLog(@"Log7 : %d",self.count);
        _count = vc2.count2 ;
         NSLog(@"FLSE1");
    }
    self.MIT.text = [NSString stringWithFormat:@"MIT : %d",self.count];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"nextUI"])
    {
        if ([segue.destinationViewController isKindOfClass:[ViewController2 class]])
        {
          vc2 = (ViewController2 *)segue.destinationViewController;
             NSLog(@"Log4 : %d",self.count);
           
            vc2.count2 = self.count ; //Log 4
           
        }
    }
}

- (IBAction)next:(id)sender {
    
    [self performSegueWithIdentifier:@"nextUI" sender:self];
     self.count++;
    vc2.count2 = self.count ;
    NSLog(@"Log5 : %d",self.count);
}

BOOL var = true ;
*/

@end
