//
//  MathBrain.m
//  MathTrainer
//
//  Created by Andrea Gottardo on 2/11/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import "MathBrain.h"

@implementation MathBrain

-(NSMutableArray*)generateQuestWithDifficultyLevel:(int)difficultyLevel{
    
    // we create our array
    NSMutableArray *itemsArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    // the question we'll be asking
    NSString *questionString;
    
    // the true result
    int actualResult;
    
    // fake results
    int bogus1;
    int bogus2;
    int bogus3;
    
    if (difficultyLevel == 0) {
        
        // What operation are we asking for? Addition, subtraction and multiplication this time.
        // We generate a random number between 0 and 2, and we use: 0 for addition, 1 for subtraction and 2 for multiplication.
        int operation = arc4random() % 3;
        
        // We now generate two numbers. They will be the numbers in the operation.
        int operant1 = arc4random() % 10 + 1;
        int operant2 = arc4random() % 10 + 2;
        
        if (operation == 0) {
            
            questionString = [NSString stringWithFormat:@"%d + %d", operant1, operant2];
            actualResult = operant1 + operant2;
            
            bogus1 = actualResult + 1;
            bogus2 = actualResult + 2;
            bogus3 = actualResult - 2;
            
        } else if (operation == 1) {
            
            questionString = [NSString stringWithFormat:@"%d - %d", operant1, operant2];
            actualResult = operant1 - operant2;
            
            bogus1 = actualResult + 1;
            bogus2 = actualResult + 2;
            bogus3 = actualResult - 2;
            
        } else if (operation == 2) {
            
            questionString = [NSString stringWithFormat:@"%d × %d", operant1, operant2];
            actualResult = operant1 * operant2;
            
            bogus1 = actualResult + 1;
            bogus2 = actualResult + 2;
            bogus3 = actualResult - 2;
            
        }
        
    }
    
    // Let's put all we need in our array, and return it.
    itemsArray[0] = questionString;
    itemsArray[1] = [NSNumber numberWithInt:actualResult];
    itemsArray[2] = [NSNumber numberWithInt:bogus1];
    itemsArray[3] = [NSNumber numberWithInt:bogus2];
    itemsArray[4] = [NSNumber numberWithInt:bogus3];
    
    return itemsArray;
    
}

@end
