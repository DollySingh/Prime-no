//
//  main.m
//  Prime
//
//  Created by Student-004 on 25/11/16.
//  Copyright © 2016 Student-004. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int number;
        
        BOOL isPrime=YES;
        
        NSLog (@"Enter a number");
        
        scanf("%i",&number);
        
        for (int i=2; i < number-1; i++)
            
        {
            
            if (number % i == 0)
                
            {
                
                isPrime = NO;
                
                break;
                
            }
            
        }
        
        if (isPrime)
            
        {
            
            NSLog (@"%i is a Prime Number",number);
            
        }
        
        else
            
        {
            
            NSLog (@"%i is not a Prime Number", number);
            
        }
        
        
        
    }
    
    
    
    return 0;
}
