
#import <Foundation/Foundation.h>

@class FNDPresenter;

@interface FNDWireframe : NSObject

@property (nonatomic, strong) FNDPresenter *fndPresenter;

- (void)presentFndInterfaceFromViewController:(UIViewController *)viewController;
- (void)dismissFndInterface;

@end
