//
//  SingleUnit.m
//  LCARS Calc
//
//  Created by Danny Draper on 19/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "SingleUnit.h"


@implementation SingleUnit

- (void) seUnitname:(NSString *)name
{
	unitname = name;
}

- (NSString *) getUnitname
{
	return unitname;
}

- (void) setUnittype:(NSString *)utype
{
	unittype = utype;
}

- (NSString *) getUnittype
{
	return unittype;
}

- (void) setBasemetric:(double)basevalue
{
	basemetric = basevalue;
}

- (double) getBasemetric
{
	return basemetric;
}




@end
