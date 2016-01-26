#import "NSMutableString+Common.h"
#import "Parser.h"
#import "NSString+Common.h"

@implementation NSMutableString (Common)

- (void)spaceWith:(NSString *)string {
    if (self.length != 0) {
        unichar c = [self characterAtIndex:self.length - 1];
        if (![Parser isBlank:c]) {
            [self appendString:@" "];
        }
    }
    [self appendString:string];
    [self appendString:@" "];
}

- (void)keepSpace {
    if (self.length != 0) {
        unichar c = [self characterAtIndex:self.length - 1];
        if (![Parser isBlank:c]) {
            [self appendString:@" "];
        }
    } else {
        [self appendString:@" "];
    }
}

- (void)keepNewline {
    if (self.length != 0) {
        //NSUInteger last = [self lastNonSpaceIndex:0 defaults:0];
        NSUInteger index = self.length - 1;
        unichar c = [self characterAtIndex:index];

        while ([Parser isSpace:c]) {
            index--;
            c = [self characterAtIndex:index];
        }

        if (![Parser isNewline:c]) {
            [self appendString:@"\n"];
        }
    } else {
        [self appendString:@" "];
    }
}

- (void)trim {
    while (self.length > 0 && [Parser isSpace:[self characterAtIndex:self.length - 1]])
        [self deleteCharactersInRange:NSMakeRange(self.length - 1, 1)];
}

@end
