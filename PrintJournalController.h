
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

/* PrintJournalController */

#import <Cocoa/Cocoa.h>

#define kPrintModeText	1
#define kPrintModeTextAndImages	2

@interface PrintJournalController : NSWindowController
{
    IBOutlet NSDatePicker *_dateFrom;
    IBOutlet NSDatePicker *_dateTo;
    IBOutlet NSImageView *_modeImageView;
    IBOutlet NSMatrix *_printMode;
}

- (NSInteger) runAsSheetForWindow:(NSWindow*)window attached:(BOOL)sheet;

- (NSDate*) dateFrom;
- (void) setDateFrom:(NSDate*)date;

- (NSDate*) dateTo;
- (void) setDateTo:(NSDate*)date;

- (NSInteger) printMode;

- (IBAction)cancelPrint:(id)sender;
- (IBAction)changeMode:(id)sender;
- (IBAction)continuePrint:(id)sender;

@end
