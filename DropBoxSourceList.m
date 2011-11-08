//
//  DropBoxSourceList.m
//  Journler
//
//  Created by Philip Dow on 3/15/07.
//  Copyright 2007 Sprouted, Philip Dow. All rights reserved.
//

/*
 Redistribution and use in source and binary forms, with or without modification, are permitted
 provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions
 and the following disclaimer in the documentation and/or other materials provided with the
 distribution.
 
 * Neither the name of the author nor the names of its contributors may be used to endorse or
 promote products derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
 WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// Basically, you can use the code in your free, commercial, private and public projects
// as long as you include the above notice and attribute the code to Philip Dow / Sprouted
// If you use this code in an app send me a note. I'd love to know how the code is used.

// Please also note that this copyright does not supersede any other copyrights applicable to
// open source code used herein. While explicit credit has been given in the Journler about box,
// it may be lacking in some instances in the source code. I will remedy this in future commits,
// and if you notice any please point them out.

#import "DropBoxSourceList.h"


@implementation DropBoxSourceList

- (void) awakeFromNib {

	[self setIntercellSpacing:NSMakeSize(0.0,0.0)];
			
	_searchString = [[NSMutableString alloc] init];
	
	[self setAutoresizesOutlineColumn:NO];
	
	// appearance bindings
	[self bind:@"font" toObject:[NSUserDefaultsController sharedUserDefaultsController] 
		withKeyPath:@"values.FoldersTableFont" options:[NSDictionary dictionaryWithObjectsAndKeys:
		@"NSUnarchiveFromData", NSValueTransformerNameBindingOption,
		[NSFont controlContentFontOfSize:11], NSNullPlaceholderBindingOption, nil]];
}

- (void)keyDown:(NSEvent *)event
{
	static unichar kUnicharKeyReturn = '\r';
	static unichar kUnicharKeyNewline = '\n';
	
	//NSUInteger flags = [event modifierFlags];
	unichar key = [[event charactersIgnoringModifiers] characterAtIndex:0];
	
	if ( key == kUnicharKeyReturn || key == kUnicharKeyNewline || [event keyCode] == 53 )
		[[self window] keyDown:event];
	else
		[super keyDown:event];
}


- (BOOL)needsPanelToBecomeKey
{
	return YES;
}

- (BOOL)becomeFirstResponder
{
	BOOL became = [super becomeFirstResponder];
	if ( became == YES && [self selectedRow] == -1 && [self numberOfRows] != 0 )
		[self selectRowIndexes:[NSIndexSet indexSetWithIndex:0] byExtendingSelection:NO];
        //[self selectRow:0 byExtendingSelection:NO]; DEPRECATED
	
	return became;
}

@end
