//
//  ImageModel.h
//  SMUExampleOne
//
//  Created by Eric Larson on 1/21/15.
//  Copyright (c) 2015 Eric Larson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageModel : NSObject

+(ImageModel*) sharedInstance;
-(UIImage *)getImageUsingIndex:(NSInteger)index;
-(UIImage *)getImageUsingNamae:(NSString*)name;
-(NSString *)getImageNameUsingIndex:(NSInteger)index;
-(NSInteger)getImageCount;
@end
