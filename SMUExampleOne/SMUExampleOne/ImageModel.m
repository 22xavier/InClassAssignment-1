//
//  ImageModel.m
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel ()
@property (strong,nonatomic) NSArray<NSString*> *imageNames;
@property (strong,nonatomic) NSMutableArray<UIImage*> *images;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize images = _images;

-(NSArray*)imageNames{
    
    if(!_imageNames)
        _imageNames = @[@"Eric1",@"Eric2",@"Eric3", @"Image1", @"Image2",@"Image3"];
    
    return _imageNames;
}

-(NSMutableArray*)images{
    
    if(!_images)
        _images = [NSMutableArray<UIImage*> new];

    return _images;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
        for (NSString* name in _sharedInstance.imageNames) {
            UIImage* image = nil;
            image = [UIImage imageNamed:name];
            [_sharedInstance.images addObject:image];
        }
         NSLog(@"Images Preloaded!");
    });
    
    return _sharedInstance;
}

-(UIImage *)getImageUsingIndex:(NSInteger)index {
    return [self.images objectAtIndex:index];
}

-(UIImage *)getImageUsingNamae:(NSString*)name {
    NSInteger index = -1;
    for (NSString* imageName in self.imageNames) {
        if([imageName isEqualToString:name]) {
            index = [self.imageNames indexOfObject:imageName];
            break;
        }
    }
    return [self.images objectAtIndex:index];
}

-(NSString *)getImageNameUsingIndex:(NSInteger)index {
    return [self.imageNames objectAtIndex:index];
}

-(NSInteger)getImageCount {
    int count = (int)[self.imageNames count];
    return count;
}

@end
