//
//  MathBrain.h
//  MathTrainer
//
//  Created by Andrea Gottardo on 2/11/16.
//  Copyright © 2016 Andrea Gottardo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathBrain : NSObject

/*
 Given a difficulty level, returns a question and four different possible answers to the question.
 @param difficultyLevel An int from 0 (minimum difficulty) to 3 (maximum difficulty).
 @return The method returns an array with 5 elements. The question is the first element of the array, and is provided as a NSString. The correct answer is the 2nd element of the array, while the other three elements are wrong answers. All possible answers are provided as integers.
 */
-(NSMutableArray*)generateQuestWithDifficultyLevel:(int)difficultyLevel;

@end
