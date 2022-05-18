//
//  main.m
//  PigLatin
//
//  Created by Li Tzu Lin on 2022-05-18.
//

#import <Foundation/Foundation.h>
bool isVowel(char c)
    {
        return (c == 'A' || c == 'E' ||
                c == 'I' || c == 'O' ||
                c == 'U' || c == 'a' ||
                c == 'e' || c == 'i' ||
                c == 'o' || c == 'u');
            
   // NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
    }
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
                NSString *word1 = [mutableWords objectAtIndex:0];
                
                NSLog(@"%@",word1);
    }
    return 0;
}
}
