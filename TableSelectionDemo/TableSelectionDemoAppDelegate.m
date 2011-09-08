//
//  TableSelectionDemoAppDelegate.m
//  TableSelectionDemo
//
//  Created by Kumaran Venkataraman on 08/09/11.
//  Copyright 2011 Wings. All rights reserved.
//

#import "TableSelectionDemoAppDelegate.h"

@implementation TableSelectionDemoAppDelegate
@synthesize expertise, technologies;
@synthesize window = _window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    technologies = [[NSMutableArray alloc] init];
    [technologies addObject:@"Objective-C"];
    [technologies addObject:@"Java"];
    [technologies addObject:@"Ruby"];
    expertise = [[NSMutableDictionary alloc] init];
    [expertise setObject:[NSArray arrayWithObjects:@"Expert", @"Moderate", @"Novice", nil] forKey:@"John"];
    [expertise setObject:[NSArray arrayWithObjects:@"Moderate", @"Expert", @"Expert", nil] forKey:@"Micheal"];
    [expertise setObject:[NSArray arrayWithObjects:@"Expert", @"Novice", @"Expert", nil ] forKey:@"Gerald"];
    [tv reloadData];
    [tv addObserver:self forKeyPath:@"selectedCellRowIndex" options:NSKeyValueObservingOptionNew context:nil];
    [tv addObserver:self forKeyPath:@"selectedCellColumnIndex" options:NSKeyValueObservingOptionNew context:nil];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [[expertise allKeys] count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *key = [[expertise allKeys] objectAtIndex:row];
    NSInteger column = [[tableColumn identifier] intValue];
    if(column == 0)
        return key;
    return [[expertise valueForKey:key] objectAtIndex:column-1];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    int row = [[tv selectedCellRowIndex] intValue];
    int col = [[tv selectedCellColumnIndex] intValue];
    NSString *key = [[expertise allKeys] objectAtIndex:row];

    if(col > 0) {
        NSString *lblValue = [NSString stringWithFormat:@"%@ has %@ expertise in %@ technology", key, [[expertise valueForKey:key] objectAtIndex:col-1], [technologies objectAtIndex:row]];
        [lblField setStringValue:lblValue];
    }
    
}

@end
