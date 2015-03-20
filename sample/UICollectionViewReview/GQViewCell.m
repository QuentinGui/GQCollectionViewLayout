//
//  GQViewCell.m
//  UICollectionViewReview
//
//  Created by Katsura on 3/20/15.
//  Copyright (c) 2015 Katsura. All rights reserved.
//

#import "GQViewCell.h"

@implementation GQViewCell

- (void)awakeFromNib {
    self.imageView.layer.borderWidth= 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
    
}

-(void)setImage:(NSString *)image
{
    _image  =[image copy];
    self.imageView.image = [UIImage imageNamed:image];
}

@end
