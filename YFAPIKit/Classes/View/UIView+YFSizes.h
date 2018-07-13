#import <UIKit/UIView.h>

@interface UIView (YFSizes)

///---------------------------------------------------------------------------------------
/// @name Edges
///---------------------------------------------------------------------------------------

/** Get the left point of a view. */
@property (nonatomic) CGFloat yf_left;

/** Get the top point of a view. */
@property (nonatomic) CGFloat yf_top;

/** Get the right point of a view. */
@property (nonatomic) CGFloat yf_right;

/** Get the bottom point of a view. */
@property (nonatomic) CGFloat yf_bottom;

///---------------------------------------------------------------------------------------
/// @name Dimensions
///---------------------------------------------------------------------------------------

/** Get the width of a view. */
@property (nonatomic) CGFloat yf_width;

/** Get the height of a view. */
@property (nonatomic) CGFloat yf_height;

///---------------------------------------------------------------------------------------
/// @name Quick Access
///---------------------------------------------------------------------------------------

/** Get the origin of a view. */
@property (nonatomic) CGPoint yf_origin;

/** Get the size of a view. */
@property (nonatomic) CGSize yf_size;

@end
