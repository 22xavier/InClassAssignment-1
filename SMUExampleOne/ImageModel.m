//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"


@interface ImageModel()
@property (strong,nonatomic) NSArray* imageNames;

@end

@implementation ImageModel

@synthesize imageNames = _imageNames;
@synthesize preLoadedImages = _preLoadedImages;


-(NSArray*)imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3"];
    
    return _imageNames;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString *)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}

-(NSArray*)preLoadedImaged{
    if (!_preLoadedImages){
        UIImage* image1 = [self getImageWithName:@"Eric1"];
        UIImage* image2 = [self getImageWithName:@"Eric2"];
        UIImage* image3 = [self getImageWithName:@"Eric3"];
        _preLoadedImages = @[image1, image2, image3];
    }
    return _preLoadedImages;
}

@end
