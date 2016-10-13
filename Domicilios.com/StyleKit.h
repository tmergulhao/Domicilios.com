//
//  StyleKit.h
//  Domicilios.com
//
//  Created by Tiago Mergulhão on 13/10/16.
//  Copyright (c) 2016 Tiago Mergulhão. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface StyleKit : NSObject

// iOS Controls Customization Outlets
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* deliveriesTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* locationTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* listViewTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* mapPlaceholderTargets;
@property(strong, nonatomic) IBOutletCollection(NSObject) NSArray* closeImageDialogTargets;

// Colors
+ (UIColor*)red;

// Drawing Methods
+ (void)drawTimeFilterWithTimeSortActive: (BOOL)timeSortActive time: (CGFloat)time;
+ (void)drawPriceFilterWithPriceSortActive: (BOOL)priceSortActive price: (CGFloat)price;
+ (void)drawRatingFilterWithRatingSortActive: (BOOL)ratingSortActive rating: (CGFloat)rating;
+ (void)drawTimeTagWithTimeSortActive: (BOOL)timeSortActive time: (CGFloat)time;
+ (void)drawPriceTagWithPriceSortActive: (BOOL)priceSortActive price: (CGFloat)price;
+ (void)drawRatingTagWithRatingSortActive: (BOOL)ratingSortActive rating: (CGFloat)rating;

// Generated Images
+ (UIImage*)imageOfDeliveries;
+ (UIImage*)imageOfLocation;
+ (UIImage*)imageOfListView;
+ (UIImage*)imageOfMapPlaceholder;
+ (UIImage*)imageOfCloseImageDialog;

@end
