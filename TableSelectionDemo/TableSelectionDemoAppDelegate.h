//
//  TableSelectionDemoAppDelegate.h
//  TableSelectionDemo
//
//  Created by Kumaran Venkataraman on 08/09/11.
//  Copyright 2011 Wings. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomTable.h"

@interface TableSelectionDemoAppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource> {
    NSWindow *_window;
    NSMutableDictionary *expertise;
    NSMutableArray *technologies;
    IBOutlet CustomTable *tv;
    IBOutlet NSTextField *lblField;
}

@property (strong) IBOutlet NSWindow *window;
@property (nonatomic, retain) NSMutableDictionary *expertise;
@property (nonatomic, retain) NSMutableArray *technologies;

@end
