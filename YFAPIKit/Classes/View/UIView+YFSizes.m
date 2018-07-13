
#import "UIView+YFSizes.h"

@implementation UIView (YFSizes)

- (CGFloat)yf_left {
    return self.frame.origin.x;
}

- (void)setYf_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)yf_top {
    return self.frame.origin.y;
}

- (void)setYf_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)yf_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYf_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yf_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYf_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yf_width {
    return self.frame.size.width;
}

- (void)setYf_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)yf_height {
    return self.frame.size.height;
}

- (void)setYf_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)yf_origin {
    return self.frame.origin;
}

- (void)setYf_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)yf_size {
    return self.frame.size;
}

- (void)setYf_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
