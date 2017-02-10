//
//  SPDeepCopy.h
//  Right Verify
//
//  Created by bviadmin on 20/01/15.
//  Copyright (c) 2015 Brainvire. All rights reserved.
//

#import <Foundation/Foundation.h>

// Deep -copy and -mutableCopy methods for NSArray and NSDictionary

@interface NSObject (MyDeepCopy)
-(id)deepMutableCopy;
@end
