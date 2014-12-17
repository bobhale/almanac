//
//  TableHeaderView.m
//  ARSSReader
//
//  Created by Marin Todorov on 29/10/2012.
//

#import "TableHeaderView.h"

@interface TableHeaderView()
{
	UILabel* label;
}
@end

@implementation TableHeaderView

- (id)initWithText:(NSString*)text
{
    //[super initWithFrame:CGRectZero];
  //  this = self;
    
	UIImage* img = [UIImage imageNamed:@"backheadalamanac.png"];
    if ((self = [super initWithImage:img])) {
        // Initialization code
		label = [[UILabel alloc] initWithFrame:CGRectMake(20,0,200,40)];
		label.textColor = [UIColor whiteColor];
		label.shadowColor = [UIColor grayColor];
		label.shadowOffset = CGSizeMake(1, 1);
		label.backgroundColor = [UIColor clearColor];
        //label.backgroundColor = [UIColor colorWithRed:236/255.0 green:59/255.0 blue:57/255.0 alpha:1.0];
		label.font = [UIFont systemFontOfSize:15];
		label.text = text;
		label.numberOfLines = 1;
       
		[self addSubview:label];
    }
    return self;
}

    
- (void)setText:(NSString*)text
{
	label.text = text;
}

@end