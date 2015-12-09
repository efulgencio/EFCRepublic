
#import <Foundation/Foundation.h>

@class VTDUpcomingDisplayData;


// Defines the public interface that something else can use to drive the user interface
@protocol ListViewInterface <NSObject>

// - (void)showNoContentMessage;
// - (void)showUpcomingDisplayData:(VTDUpcomingDisplayData *)data;
- (void)reloadEntries;

@end
