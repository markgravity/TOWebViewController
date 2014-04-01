//
//  TOActivitySafari.m
//
//  Copyright 2014 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TOActivitySafari.h"

/* Detect if we're running iOS 7.0 or higher */
#ifndef NSFoundationVersionNumber_iOS_6_1
#define NSFoundationVersionNumber_iOS_6_1  993.00
#endif
#define MINIMAL_UI (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1)

/* Detect which user idiom we're running on */
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface TOActivitySafari ()

/* The URL to load */
@property (nonatomic, strong) NSURL *url;

+ (UIImage *)sharedActivityImage;

@end

@implementation TOActivitySafari

#pragma mark - Activity Display Properties -
- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"Safari", @"TOWebViewControllerLocalizable", @"Open in Safari Action");
}

- (UIImage *)activityImage
{
    return [TOActivitySafari sharedActivityImage];
}

#pragma mark - Activity Action Handlers -
- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    //Grab the first URL in the list
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSURL class]]) {
            self.url = (NSURL *)item;
            break;
        }
    }
}

- (void)performActivity
{
    if (self.url == nil) {
        [self activityDidFinish:NO];
        return;
    }
    
    [[UIApplication sharedApplication] openURL:self.url];
    [self activityDidFinish:YES];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    //Check to see if there is an NSURL in the provided items
    BOOL containsURL = NO;
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSURL class]]) {
            containsURL = YES;
            break;
        }
    }
    
    return containsURL;
}

#pragma mark - Image Generation -
+ (UIImage *)sharedActivityImage
{
    static UIImage *sharedActivityImage = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        UIColor *fillColor = [UIColor blackColor];
        
        if (IPAD) { //iPad
            if (MINIMAL_UI) {
                
            }
            else {
                UIGraphicsBeginImageContextWithOptions((CGSize){56, 56}, NO, [[UIScreen mainScreen] scale]);
                {
                    UIBezierPath* safariPadClassicPathPath = [UIBezierPath bezierPath];
                    [safariPadClassicPathPath moveToPoint: CGPointMake(4.52, 51.67)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(25.33, 24.55)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(52.42, 3.77)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(32.27, 31.1)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(4.52, 51.67)];
                    [safariPadClassicPathPath closePath];
                    [safariPadClassicPathPath moveToPoint: CGPointMake(29.11, 25.91)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(26.98, 28.01) controlPoint1: CGPointMake(27.93, 25.91) controlPoint2: CGPointMake(26.98, 26.85)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(29.11, 30.11) controlPoint1: CGPointMake(26.98, 29.17) controlPoint2: CGPointMake(27.93, 30.11)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(31.24, 28.01) controlPoint1: CGPointMake(30.29, 30.11) controlPoint2: CGPointMake(31.24, 29.17)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(29.11, 25.91) controlPoint1: CGPointMake(31.24, 26.85) controlPoint2: CGPointMake(30.29, 25.91)];
                    [safariPadClassicPathPath closePath];
                    [safariPadClassicPathPath moveToPoint: CGPointMake(28.17, 15.9)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(15.84, 28.2) controlPoint1: CGPointMake(21.36, 15.9) controlPoint2: CGPointMake(15.84, 21.41)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(16.55, 32.28) controlPoint1: CGPointMake(15.84, 29.63) controlPoint2: CGPointMake(16.1, 31)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(14.33, 35.13)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(12.87, 30.84) controlPoint1: CGPointMake(13.64, 33.81) controlPoint2: CGPointMake(13.15, 32.36)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(0, 28.02)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(12.82, 25.25)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(16.24, 18.03) controlPoint1: CGPointMake(13.31, 22.53) controlPoint2: CGPointMake(14.52, 20.05)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(13.14, 12.81)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(18.16, 16.14)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(25.16, 12.84) controlPoint1: CGPointMake(20.14, 14.5) controlPoint2: CGPointMake(22.53, 13.34)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(27.97, 0)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(30.74, 12.83)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(35, 14.22) controlPoint1: CGPointMake(32.24, 13.1) controlPoint2: CGPointMake(33.68, 13.56)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(31.94, 16.49)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(28.17, 15.9) controlPoint1: CGPointMake(30.75, 16.11) controlPoint2: CGPointMake(29.48, 15.9)];
                    [safariPadClassicPathPath closePath];
                    [safariPadClassicPathPath moveToPoint: CGPointMake(28.17, 40.49)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(40.5, 28.2) controlPoint1: CGPointMake(34.98, 40.49) controlPoint2: CGPointMake(40.5, 34.98)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(39.92, 24.49) controlPoint1: CGPointMake(40.5, 26.9) controlPoint2: CGPointMake(40.29, 25.66)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(42.11, 21.56)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(43.25, 25.16) controlPoint1: CGPointMake(42.63, 22.69) controlPoint2: CGPointMake(43.01, 23.9)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(56, 27.92)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(43.3, 30.7)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(40.1, 37.68) controlPoint1: CGPointMake(42.83, 33.31) controlPoint2: CGPointMake(41.71, 35.69)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(43.16, 42.8)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(38.28, 39.57)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(30.84, 43.18) controlPoint1: CGPointMake(36.22, 41.38) controlPoint2: CGPointMake(33.66, 42.66)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(28.07, 56)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(25.26, 43.16)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(21.29, 41.87) controlPoint1: CGPointMake(23.87, 42.9) controlPoint2: CGPointMake(22.53, 42.47)];
                    [safariPadClassicPathPath addLineToPoint: CGPointMake(24.07, 39.78)];
                    [safariPadClassicPathPath addCurveToPoint: CGPointMake(28.17, 40.49) controlPoint1: CGPointMake(25.35, 40.23) controlPoint2: CGPointMake(26.73, 40.49)];
                    [safariPadClassicPathPath closePath];
                    [fillColor setFill];
                    [safariPadClassicPathPath fill];
                    
                    sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
                }
                UIGraphicsEndImageContext();
            }
        }
        else { //iPhone
            if (MINIMAL_UI) {
                
            }
            else {
                UIGraphicsBeginImageContextWithOptions((CGSize){40, 40}, NO, [[UIScreen mainScreen] scale]);
                {
                    UIBezierPath* safariPhoneClassicPathPath = [UIBezierPath bezierPath];
                    [safariPhoneClassicPathPath moveToPoint: CGPointMake(3.23, 36.91)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(18.09, 17.54)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(37.44, 2.69)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(23.05, 22.21)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(3.23, 36.91)];
                    [safariPhoneClassicPathPath closePath];
                    [safariPhoneClassicPathPath moveToPoint: CGPointMake(20.54, 18.43)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(19.02, 19.93) controlPoint1: CGPointMake(19.7, 18.43) controlPoint2: CGPointMake(19.02, 19.1)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(20.54, 21.44) controlPoint1: CGPointMake(19.02, 20.76) controlPoint2: CGPointMake(19.7, 21.44)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(22.07, 19.93) controlPoint1: CGPointMake(21.39, 21.44) controlPoint2: CGPointMake(22.07, 20.76)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(20.54, 18.43) controlPoint1: CGPointMake(22.07, 19.1) controlPoint2: CGPointMake(21.39, 18.43)];
                    [safariPhoneClassicPathPath closePath];
                    [safariPhoneClassicPathPath moveToPoint: CGPointMake(20.01, 10.95)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(10.94, 20) controlPoint1: CGPointMake(15, 10.95) controlPoint2: CGPointMake(10.94, 15)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(11.59, 23.36) controlPoint1: CGPointMake(10.94, 21.19) controlPoint2: CGPointMake(11.17, 22.32)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(10.24, 25.1)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(9.19, 22.03) controlPoint1: CGPointMake(9.74, 24.15) controlPoint2: CGPointMake(9.39, 23.11)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(0, 20.01)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(9.16, 18.03)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(11.6, 12.88) controlPoint1: CGPointMake(9.51, 16.09) controlPoint2: CGPointMake(10.37, 14.32)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(9.38, 9.15)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(12.97, 11.53)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(17.97, 9.17) controlPoint1: CGPointMake(14.38, 10.36) controlPoint2: CGPointMake(16.09, 9.53)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(19.98, 0)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(21.96, 9.16)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(25, 10.16) controlPoint1: CGPointMake(23.03, 9.35) controlPoint2: CGPointMake(24.06, 9.68)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(23.16, 11.53)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(20.01, 10.95) controlPoint1: CGPointMake(22.17, 11.16) controlPoint2: CGPointMake(21.12, 10.95)];
                    [safariPhoneClassicPathPath closePath];
                    [safariPhoneClassicPathPath moveToPoint: CGPointMake(20.01, 29.04)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(29.08, 20) controlPoint1: CGPointMake(25.02, 29.04) controlPoint2: CGPointMake(29.08, 24.99)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(28.66, 17.29) controlPoint1: CGPointMake(29.08, 19.06) controlPoint2: CGPointMake(28.93, 18.15)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(30.08, 15.4)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(30.89, 17.97) controlPoint1: CGPointMake(30.45, 16.21) controlPoint2: CGPointMake(30.72, 17.07)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(40, 19.94)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(30.93, 21.93)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(28.65, 26.91) controlPoint1: CGPointMake(30.59, 23.79) controlPoint2: CGPointMake(29.79, 25.5)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(30.83, 30.57)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(27.34, 28.26)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(22.03, 30.84) controlPoint1: CGPointMake(25.87, 29.56) controlPoint2: CGPointMake(24.05, 30.47)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(20.05, 40)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(18.04, 30.83)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(15.2, 29.9) controlPoint1: CGPointMake(17.05, 30.64) controlPoint2: CGPointMake(16.09, 30.34)];
                    [safariPhoneClassicPathPath addLineToPoint: CGPointMake(17.03, 28.54)];
                    [safariPhoneClassicPathPath addCurveToPoint: CGPointMake(20.01, 29.04) controlPoint1: CGPointMake(17.96, 28.86) controlPoint2: CGPointMake(18.96, 29.04)];
                    [safariPhoneClassicPathPath closePath];
                    [fillColor setFill];
                    [safariPhoneClassicPathPath fill];
                    
                    sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
                }
                UIGraphicsEndImageContext();
            }
        }
    });
    
    return sharedActivityImage;
}


@end
