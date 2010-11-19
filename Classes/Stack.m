//
//  Stack.m
//  HyperCalc
//
//  Created by Danny Draper on 04/06/2010.
//  Copyright 2010 CedeSoft Ltd. All rights reserved.
//

#import "Stack.h"


@implementation Stack

- (NSObject *) GetItem:(int)index
{
	if (_binitialised == TRUE)
	{
		if (index < [_array count]) {
			return [_array objectAtIndex:index];
		}
	}
	
	return nil;
}

- (void) Push:(NSObject *)myobject
{

	if (_binitialised == TRUE)
	{
		[_array addObject:myobject];
	}
	
}

- (NSObject *) Peek
{
	if (_binitialised == TRUE) {
	
		if ([_array count] > 0) {
		
			NSObject *peekedobject = [NSObject new];
	
			peekedobject = [_array objectAtIndex:[_array count]-1];
	
			return peekedobject;
		}
	}
	
	return nil;
}

- (int) Count
{
	if (_binitialised == TRUE) {
		return [_array count];
	} else {
		return 0;
	}
}

- (NSObject *) Pop
{
	//NSLog (@"STACK Pop called.");
	NSObject *poppedobject = [NSObject new];
	NSMutableArray *temparray = [NSMutableArray new];
	NSObject *currentobject = [NSObject new];
	int i;
	
	if (_binitialised == TRUE) 
	{
		if ([_array count] > 0) {
			poppedobject = [_array objectAtIndex:[_array count]-1];
			//NSLog (@"STACK Pop: poppedobject: %@", poppedobject);
			
			for (i=0;i<[_array count]-1;++i)
			{
				currentobject = [_array objectAtIndex:i];
				[temparray addObject:currentobject];
				
				
				
			}
			
			[_array removeAllObjects];
			
			for (i=0;i<[temparray count];++i)
			{
				currentobject = [temparray objectAtIndex:i];
				[_array addObject:currentobject];
			}
			
			[temparray release];
			//[currentobject release];
			
			return poppedobject;
		}
		
	}
	
	[temparray release];
	//[currentobject release];
	return nil;
}

- (void) Initialise
{
	_array = [NSMutableArray new];
	_binitialised = TRUE;
}

@end

