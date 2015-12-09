#import <Foundation/Foundation.h>

@protocol FNDViewInterface <NSObject>

- (void)setEntryName:(NSString *)name;
- (void)setEntryDueDate:(NSDate *)date;
// En lugar de asignar el mínimo de fecha puedo asignar los datos
- (void)setMinimumDueDate:(NSDate *)date;

@end
