//
//  SingleUnit.h
//  LCARS Calc
//
//  Created by Danny Draper on 19/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SingleUnit : NSObject {
	NSString *unitname;
	NSString *unittype;
	double basemetric;
}

- (void) seUnitname:(NSString *)name;
- (NSString *) getUnitname;
- (void) setUnittype:(NSString *)utype;
- (NSString *) getUnittype;
- (void) setBasemetric:(double)basevalue;
- (double) getBasemetric;

@end
