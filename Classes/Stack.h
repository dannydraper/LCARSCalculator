//
//  Stack.h
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Stack : NSObject {
	
	NSMutableArray * _array;
	bool _binitialised;

}

- (NSObject *) GetItem:(int)index;
- (void) Push:(NSObject *)myobject;
- (NSObject *) Peek;
- (NSObject *) Pop;
- (int) Count;
- (void) Initialise;

@end
