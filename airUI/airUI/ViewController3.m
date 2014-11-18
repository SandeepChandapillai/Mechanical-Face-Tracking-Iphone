//
//  ViewController3.m
//  airUI
//
//  Created by Sandeep on 8/22/14.
//  Copyright (c) 2014 Carpe Diem. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;



@end

@implementation ViewController3



- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
}



- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.ImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


///////////// NAVIGATION ////////////
- (IBAction)backButtonDay2:(id)sender
{
    [self performSegueWithIdentifier:@"backButtonDay2" sender:sender ];
}

- (IBAction)NextUI:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"MagicUI" sender:sender ];
}

- (IBAction)AlertButton:(id)sender
{
    
    [[ [UIAlertView alloc] initWithTitle:@"WARNING" message:@"Hello World!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Double OK", nil ] show ] ;
    
}


@end
