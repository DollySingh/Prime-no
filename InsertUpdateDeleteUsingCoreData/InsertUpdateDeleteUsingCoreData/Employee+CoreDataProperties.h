//
//  Employee+CoreDataProperties.h
//  InsertUpdateDeleteUsingCoreData
//
//  Created by Student-004 on 25/10/16.
//  Copyright © 2016 Student-004. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *eno;
@property (nullable, nonatomic, retain) NSString *ename;
@property (nullable, nonatomic, retain) NSString *eaddress;
@property (nullable, nonatomic, retain) NSNumber *ephoneno;

@end

NS_ASSUME_NONNULL_END
