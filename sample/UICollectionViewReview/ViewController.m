//
//  ViewController.m
//  UICollectionViewReview
//
//  Created by Katsura on 3/20/15.
//  Copyright (c) 2015 Katsura. All rights reserved.
//

#import "ViewController.h"
#import "GQViewCell.h"
#import "GQLineLayout.h"
#import "GQCycleLayout.h"
#import "GQTileLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *images;
@property(nonatomic,weak)UICollectionView* collectionView;
@end

@implementation ViewController

static NSString* const REID = @"image";

-(NSMutableArray*)images{
    if(!_images){
        _images = [[NSMutableArray alloc]init];
        for (int i=1; i<=20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = self.view.frame.size.width;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100,w, 200) collectionViewLayout:[[GQCycleLayout alloc]init]];
    collectionView.delegate =  self;
    collectionView.dataSource = self;
    //regist the class ,tell the identifier
    //[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:REID];
    [collectionView registerNib:[UINib nibWithNibName:@"GQViewCell" bundle:nil] forCellWithReuseIdentifier:REID];
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.images.count;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GQViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:REID forIndexPath:indexPath];
  //  cell.backgroundColor = [UIColor redColor];
    cell.image = self.images[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型数据
    [self.images removeObjectAtIndex:indexPath.item];
    
    // 删UI(刷新UI)
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[GQTileLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[GQCycleLayout alloc] init] animated:YES];
    } else if([self.collectionView.collectionViewLayout isKindOfClass:[GQCycleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
    }else if([self.collectionView.collectionViewLayout isKindOfClass:[GQLineLayout class]]){
        [self.collectionView setCollectionViewLayout:[[GQTileLayout alloc] init]];
    }else{
        [self.collectionView setCollectionViewLayout:[[GQLineLayout alloc]init]];
    }
}

@end
