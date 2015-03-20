//
//  GQViewCell.h
//  UICollectionViewReview
//
//  Created by Katsura on 3/20/15.
//  Copyright (c) 2015 Katsura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic,copy) NSString *image;

@end
