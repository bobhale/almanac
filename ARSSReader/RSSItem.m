//
//  RSSItem.m

#import "RSSItem.h"
#import "GTMNSString+HTML.h"

@implementation RSSItem

-(NSAttributedString*)cellMessage
{
    if (_cellMessage!=nil) return _cellMessage;
    
    NSDictionary* boldStyle = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Bold" size:16.0 ]};
    NSDictionary* normalStyle = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:14.0]};
    
    NSMutableAttributedString* articleAbstract = [[NSMutableAttributedString alloc] initWithString:self.title];
    
    
     
    [articleAbstract setAttributes:boldStyle
                             range:NSMakeRange(0, self.title.length)];
    
    [articleAbstract addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, [articleAbstract length])];
    
    [articleAbstract appendAttributedString:
     [[NSAttributedString alloc] initWithString:@"\n"]
     ];
    
    int startIndex = (int)[articleAbstract length];
    
    // Bob hale 11/28/14 added code below in case of shorter  descriptions
    // causing bad index errors
    int longIndex = (int)[self.description length];
    
    int tester = 0;
    
    if ( longIndex < 101){
        tester = longIndex - 1;
        
    } else {
        tester = 100;
    }
    
    
    NSString* description = [NSString stringWithFormat:@"%@...", [self.description substringToIndex:tester]];
    description = [description gtm_stringByUnescapingFromHTML];
    
    [articleAbstract appendAttributedString:
     [[NSAttributedString alloc] initWithString: description]
     ];
    
    [articleAbstract setAttributes:normalStyle
                             range:NSMakeRange(startIndex, articleAbstract.length - startIndex)];
    
    _cellMessage = articleAbstract;
    return _cellMessage;
    
}

@end
