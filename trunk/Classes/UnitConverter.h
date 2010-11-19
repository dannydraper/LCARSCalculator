//
//  UnitConverter.h
//  LCARS Calc
//
//  Created by Danny Draper on 20/09/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleUnit.h"


@interface UnitConverter : NSObject {

	int _selectedunittypeindex;
	
	int _selectedfromindex;
	int _selectedtoindex;
	
	NSMutableArray *_unitnames;
	NSMutableArray *_unitlist;
	NSMutableArray *_unittypes;
}

- (void) Initialise;
- (void) AddSingleUnit:(NSString *)unittype:(NSString *)unitname: (double) basemetric;
- (void) PopulateTypes;
- (void) PopulateNames:(NSString *)unittype;
- (bool) DoesTypeExist:(NSString *)unittype;
- (void) LogTypes;
- (NSString *) getNextUnitType;
- (NSString *) getPrevUnitType;
- (NSString *) getCurrentUnitType;

- (NSString *) getPrevFromUnit;
- (NSString *) getNextFromUnit;
- (NSString *) getCurrentFromUnit;

- (NSString *) getCurrentToUnit;
- (NSString *) getNextToUnit;
- (NSString *) getPrevToUnit;
- (double) getBasemetric:(NSString *)unitname;

- (NSString *) Convert:(NSString *)from: (NSString *)to: (double) amount;


@end
