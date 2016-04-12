//
//  main.m
//  GopherC
//
//  Created by Tomasen on 4/12/16.
//  Copyright © 2016 PINIDEA LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "hello.h"
#include "world.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Can't link more than one go libraries, yet, maybe?
        // GoString s1 = Hello();
        
        GoString s1;
        s1.p = "hello";
        s1.n = 5;
        GoString s2 = World(s1);
        
        NSLog(@"%s %s", s1.p, s2.p);
    }
    return 0;
}
