//
//  main.m
//  PigLatin
//
//  Created by Li Tzu Lin on 2022-05-18.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatinConvert.h"
//bool isVowel(char c)
//    {
//        return (c == 'A' || c == 'E' ||
//                c == 'I' || c == 'O' ||
//                c == 'U' || c == 'a' ||
//                c == 'e' || c == 'i' ||
//                c == 'o' || c == 'u');
//            
//   // NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
//    }
NSString *getUserInput(NSString *prompt) {
   
    // 1. array of chars
    char inputChars[255];
    NSLog(@"%@", prompt);
    fgets(inputChars, 255, stdin);
    // covert char array (c string) to a NSString object
    return [NSString stringWithUTF8String:inputChars];

}
int main(int argc, const char * argv[]) {
restartprogram:
    @autoreleasepool {
        NSString *inputString = getUserInput(@"\nEnter your String:('q' to quit) ");
            if ([inputString  isEqual: @"q\n"]) {
                userBreak;

            } else if ([inputString  isEqual: @"\n"]) {
                goto restartprogram;
            }
            else {
                NSMutableArray *mutableWords = [[inputString componentsSeparatedByString: @" "] mutableCopy];
                
//              NSString *word1 = [mutableWords objectAtIndex:2];
                NSInteger *arrysize = [mutableWords count];
                int i = 0;
                while (i< (long)arrysize){
                    NSString *arrWord = mutableWords[i];
                    arrWord = [arrWord stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                    NSString *first2OfWord = [arrWord substringToIndex:2];  //word first 2 letters
                    NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
                    BOOL isTheObjectThere = [clusters containsObject: first2OfWord];
                    if (isTheObjectThere == true) {
                        NSString *toEnd = [arrWord substringFromIndex:2];
                        NSString *fromBegin = [arrWord substringToIndex:2];
                        arrWord = [toEnd stringByAppendingString:fromBegin];
                        mutableWords[i] = arrWord;
                        NSString *plword = [mutableWords[i] stringByPigLatinization];
                                     
                        arrWord = mutableWords[i];
                        arrWord = [arrWord stringByAppendingString:plword];
                        mutableWords[i] = arrWord;
                        //NSLog(@"%@",arrWord);
                        i += 1;
                    } else {
                    NSString *toEnd = [arrWord substringFromIndex:1];
                    NSString *fromBegin = [arrWord substringToIndex:1];
                    arrWord = [toEnd stringByAppendingString:fromBegin];
                    mutableWords[i] = arrWord;
                    //+ay
                    NSString *plword = [mutableWords[i] stringByPigLatinization];
                                 
                    arrWord = mutableWords[i];
                    arrWord = [arrWord stringByAppendingString:plword];
                    mutableWords[i] = arrWord;
                    //NSLog(@"%@",arrWord);
                    i += 1;
                }
                }
                NSString *str = [mutableWords componentsJoinedByString:@" "];
                NSLog(@"%@",str);
                goto restartprogram;
                
    }
        
    return 0;
}
}
